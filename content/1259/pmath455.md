---
title: "PMATH 455: Convex Analysis and Geometry"
prof: "Kateryna Tatarko"
subjects: "PMATH"
---

*These notes synthesize and enrich material from the primary sources listed below. The goal is to present convex geometry as a living subject — with motivation, geometric intuition, fully worked examples, and connections to analysis and optimization — rather than as a dry catalogue of definitions and theorems. All mathematical content is paraphrased into original prose; no text is reproduced verbatim from any source.*

## Sources and References

These notes draw primarily on the following works, paraphrased and synthesized into original exposition:

- **Primary:** D. Hug and W. Weil, *Lectures on Convex Geometry*, Springer, 2020. This is the main reference for the geometric theory of convex bodies, mixed volumes, and the Brunn–Minkowski theory.
- **Supplementary (combinatorial/polyhedral):** I. Pak, *Lectures on Discrete and Polyhedral Geometry* (draft manuscript), covering f-vectors, Euler's formula, and combinatorial aspects of polytopes.
- **Supplementary (asymptotic):** S. Artstein-Avidan, A. Giannopoulos, and V. D. Milman, *Asymptotic Geometric Analysis, Parts I and II*, AMS Mathematical Surveys and Monographs, 2015 and 2021. Used for log-concavity, functional inequalities, and duality.
- **Analysis background:** E. Lieb and M. Loss, *Analysis*, 2nd ed., AMS Graduate Studies in Mathematics, 2001. Particularly relevant for rearrangement inequalities and functional analytic tools.
- **Rearrangement inequalities:** A. Burchard, *A Short Course on Rearrangement Inequalities*, online lecture notes, University of Toronto (available at math.toronto.edu/almut/rearrange.pdf). Principal reference for Chapter 7.
- **Online resources:** MIT OpenCourseWare lecture notes on convex analysis (6.253 and related courses); publicly available course notes from the University of Washington, Berkeley, and other institutions on convex geometry and functional analysis.

All mathematical content is paraphrased into original prose; no text is reproduced verbatim from any source.

---

# Chapter 1: Basic Convexity

The notion of convexity is deceptively simple — a set is convex if any two of its points can be "seen" from each other without leaving the set — yet it underpins an enormous range of mathematics. Convex geometry provides the geometric framework for optimization (every local minimum of a convex function is a global minimum), probability (log-concave distributions are the natural class for concentration inequalities), and analysis (the Hahn–Banach theorem is at heart a separation result for convex sets). In this chapter we lay the affine and convex foundations that will be needed throughout the course.

## 1.1 Affine Structure in \(\mathbb{R}^n\)

Before studying convexity, we must recall the affine geometry of Euclidean space. Fix the ambient space \(\mathbb{R}^n\) with its standard inner product \(\langle \cdot, \cdot \rangle\) and norm \(\|\cdot\|\).

The key distinction between *linear* and *affine* structure is that affine geometry forgets the special role of the origin. In a linear subspace, the origin must be present; in an affine subspace it need not be. This flexibility is essential when we study convex bodies that are not symmetric about the origin.

<div class="remark">
<strong>Why affine geometry — not just linear — is the right setting for convexity.</strong> Linear algebra gives us subspaces (containing the origin) and linear maps (preserving the origin). Convexity, however, is fundamentally about "betweenness": a set is convex if the segment between any two of its points stays in the set. Betweenness is an affine concept, not a linear one. To see why linear structure is insufficient, consider the simplest convex set that is not a linear subspace: a line segment \([p, q]\) in \(\mathbb{R}^2\) that does not pass through the origin. This set is convex — the segment between any two of its points is part of itself — but it is not closed under scalar multiplication (scaling by 2 moves every point off the segment). In other words, \([p,q]\) has no natural "zero element" and cannot be described as a linear subspace.

Affine maps are precisely the maps of the form \(x \mapsto Ax + b\) (linear part plus a translation). They preserve affine combinations and therefore preserve convexity: if \(f(x) = Ax + b\) and \(C\) is convex, then \(f(C)\) is convex. Pure linear maps also preserve convexity, but they impose the artificial constraint that \(0 \in C\) (since \(f(0) = 0\) forces the image to contain the origin). Affine maps are exactly general enough: they can translate, rotate, and shear, but they cannot "fold" or "curve," so they map segments to segments and convex sets to convex sets.

The practical consequence: throughout this course, definitions and theorems will be stated in terms of affine combinations (where scalars sum to 1) rather than linear combinations (where scalars are unrestricted). The affine hull \(\mathrm{aff}(S)\), the relative interior \(\mathrm{relint}(C)\), and Carathéodory's theorem (Section 2.1) all reflect this choice. Working affinely means the theory is invariant under translations — a convex body translated to a new position has exactly the same convex geometry, just at a different location.
</div>

<div class="definition">
<strong>Affine combination.</strong> A point \(x \in \mathbb{R}^n\) is an <em>affine combination</em> of points \(x_1, \ldots, x_k \in \mathbb{R}^n\) if there exist real scalars \(\lambda_1, \ldots, \lambda_k\) satisfying \(\sum_{i=1}^k \lambda_i = 1\) such that

\[
x = \sum_{i=1}^k \lambda_i x_i.
\]
An <em>affine subspace</em> (or <em>flat</em>) of \(\mathbb{R}^n\) is a nonempty set closed under all affine combinations. The <em>affine hull</em> of a set \(S \subseteq \mathbb{R}^n\), written \(\mathrm{aff}(S)\), is the smallest affine subspace containing \(S\).
</div>

Every affine subspace of \(\mathbb{R}^n\) is a translate of a unique linear subspace; that is, it has the form \(x_0 + V\) where \(V\) is a linear subspace and \(x_0 \in \mathbb{R}^n\). The **dimension** of an affine subspace is the dimension of its underlying linear subspace \(V\). Affine subspaces of dimensions \(0, 1, n-1, n\) are called points, lines, hyperplanes, and the full space, respectively.

<div class="remark">
The affine hull of a finite set \(\{x_0, x_1, \ldots, x_k\} \subset \mathbb{R}^n\) is the translate \(x_0 + \mathrm{span}\{x_1 - x_0, \ldots, x_k - x_0\}\). In particular, \(\mathrm{aff}(S)\) has dimension at most \(|S| - 1\) when \(S\) is finite.
</div>

A set \(S\) is called **affinely independent** if no point of \(S\) is an affine combination of the others, equivalently if the vectors \(x_1 - x_0, \ldots, x_k - x_0\) are linearly independent for any labeling \(x_0, \ldots, x_k\) of \(S\).

<div class="example">
<strong>Worked Example: Affine hull and independence.</strong> Consider the four points \(p_1 = (0,0)\), \(p_2 = (1,0)\), \(p_3 = (0,1)\), \(p_4 = (1,1)\) in \(\mathbb{R}^2\). Their affine hull is all of \(\mathbb{R}^2\), since \(p_2 - p_1 = (1,0)\) and \(p_3 - p_1 = (0,1)\) span \(\mathbb{R}^2\). Are they affinely independent? No: \(p_4 = p_2 + p_3 - p_1\), so \(p_4\) is an affine combination of \(p_1, p_2, p_3\) (with coefficients \(-1, 1, 1\) summing to \(1\)). Any three of the four points in general position form an affinely independent set.
</div>

<div class="remark">
<strong>Relative interior.</strong> For a convex set \(C \subseteq \mathbb{R}^n\), the <em>relative interior</em> \(\mathrm{relint}(C)\) is the interior of \(C\) relative to its affine hull \(\mathrm{aff}(C)\). This is the correct notion of "interior" for convex sets that live in a lower-dimensional affine subspace (e.g., a line segment in \(\mathbb{R}^2\) has empty topological interior, but its relative interior is its open interior within the line). Many theorems about convex functions and sets are most cleanly stated using the relative interior.
</div>

## 1.1b A Warm-Up: Convexity as Absence of "Shortcuts"

Before the formal definition, here is a way to build geometric intuition. Think of a convex set as a "no-shortcut" domain: if you are at any two points inside the domain, you can travel in a straight line between them without leaving the domain. Non-convex sets are those with "dents" or "holes" that force you to detour.

<div class="example">
<strong>Convex vs. non-convex: a menagerie.</strong>
<ul>
<li><em>Convex:</em> Open ball \(\{x : \|x\| < 1\}\), closed ball \(\|x\| \leq 1\), half-space \(\{x : a_1 x_1 + \cdots + a_n x_n \leq c\}\), line segment, affine subspace, the positive orthant \(\{x : x_i \geq 0 \,\forall i\}\), the cone of positive semidefinite matrices.</li>
<li><em>Not convex:</em> The unit sphere \(\|x\| = 1\) (a line between two antipodal points passes through the interior, which is not on the sphere), the set \(\{x : \|x\| \geq 1\}\) (the complement of the open ball — a line between two points on the same side can dip below radius 1), any set with a "bite" taken out of it, a donut (torus), the set \(\{(x,y) : xy \geq 1, x > 0\}\) (two branches of a hyperbola — a line between a point on one branch and a point on the other passes through the origin, not in the set).</li>
</ul>
</div>

<div class="remark">
<strong>Dimension counting and convexity.</strong> A key heuristic: a convex set in \(\mathbb{R}^n\) is "determined" by its supporting hyperplanes (by the separation theorem). A supporting hyperplane is specified by a normal vector \(u \in \mathbb{S}^{n-1}\) and a constant \(c = h_K(u)\). So the "data" of a convex body is a function on the sphere \(\mathbb{S}^{n-1}\) (the support function), which has \(n-1\) degrees of freedom at each direction. The space of convex bodies is infinite-dimensional but can be parametrized by the (infinite-dimensional but structured) space of convex functions on the sphere.

For polytopes, only finitely many directions matter — those of the facet normals. An \(n\)-dimensional polytope with \(m\) facets is determined by \(m\) numbers (the support function values at the \(m\) facet normals), giving a finite-dimensional parametrization of the "polytope moduli space."
</div>

## 1.2 Convex Sets and the Convex Hull

<div class="definition">
<strong>Convex set.</strong> A set \(C \subseteq \mathbb{R}^n\) is <em>convex</em> if for every two points \(x, y \in C\) and every \(t \in \left[0, 1\right]\), the point \((1-t)x + ty\) belongs to \(C\). Equivalently, \(C\) contains the entire line segment \(\left[x, y\right]\) whenever it contains the endpoints.
</div>

<div class="definition">
<strong>Convex combination and convex hull.</strong> A <em>convex combination</em> of points \(x_1, \ldots, x_k\) is a point \(\sum_{i=1}^k \lambda_i x_i\) where \(\lambda_i \geq 0\) for all \(i\) and \(\sum_{i=1}^k \lambda_i = 1\). The <em>convex hull</em> of a set \(S \subseteq \mathbb{R}^n\), written \(\mathrm{conv}(S)\), is the set of all convex combinations of finite subsets of \(S\). Equivalently, \(\mathrm{conv}(S)\) is the smallest convex set containing \(S\).
</div>

Elementary examples of convex sets include: the empty set, singletons, line segments, open and closed balls, half-spaces \(\{x : \langle a, x \rangle \leq b\}\), affine subspaces, and the entire space \(\mathbb{R}^n\). Intersections of convex sets are convex; unions of convex sets need not be.

<div class="example">
<strong>Example: The standard simplex.</strong> Let \(S = \{e_1, e_2, e_3\} \subset \mathbb{R}^3\) be the standard basis vectors. Then \(\mathrm{conv}(S)\) is the standard 2-simplex: the set of all points \(\lambda_1 e_1 + \lambda_2 e_2 + \lambda_3 e_3\) with \(\lambda_i \geq 0\) and \(\sum \lambda_i = 1\). This is an equilateral triangle embedded in the hyperplane \(x_1 + x_2 + x_3 = 1\).
</div>

<div class="example">
<strong>Example: Convex hull of a circle.</strong> In \(\mathbb{R}^2\), let \(S = \{(\cos\theta, \sin\theta) : \theta \in [0, 2\pi]\}\) be the unit circle. Then \(\mathrm{conv}(S)\) is the closed unit disk. More generally, the convex hull of a sphere \(\mathbb{S}^{n-1}\) is the closed ball \(\overline{\mathbb{B}^n}\). This illustrates that the convex hull can be much "larger" than the original set — we are filling in all the gaps.
</div>

<div class="theorem">
<strong>Closure properties of convex sets.</strong> Let \(C, D \subseteq \mathbb{R}^n\) be convex.
<ol>
<li>The intersection \(C \cap D\) is convex.</li>
<li>For any scalar \(\lambda \in \mathbb{R}\), the dilation \(\lambda C = \{\lambda x : x \in C\}\) is convex.</li>
<li>The Minkowski sum \(C + D = \{x + y : x \in C, y \in D\}\) is convex.</li>
<li>Any affine image and preimage of a convex set is convex.</li>
<li>If \(\{C_\alpha\}_\alpha\) is any family of convex sets, then \(\bigcap_\alpha C_\alpha\) is convex.</li>
</ol>
</div>

<div class="remark">
<strong>Why convexity is preserved under intersections but not unions.</strong> If \(C\) and \(D\) are both convex and \(x, y \in C \cap D\), then the segment \([x,y]\) lies in \(C\) (by convexity of \(C\)) and also in \(D\) (by convexity of \(D\)), hence in \(C \cap D\). For unions, take \(C = [-2,-1]\) and \(D = [1,2]\) on the real line: both are convex, but \(C \cup D\) is not (the midpoint \(0\) of \(-1 \in C\) and \(1 \in D\) does not belong to \(C \cup D\)).

This closure under intersections is the key reason that convex sets are ubiquitous in optimization: feasible regions defined by linear inequalities (each defining a half-space, which is convex) are automatically convex.
</div>

<div class="example">
<strong>Worked Example: Convex hull as intersection.</strong> The convex hull \(\mathrm{conv}(S)\) can equivalently be described as the intersection of all convex sets containing \(S\). Let us verify this for \(S = \{(0,0),(1,0),(0,1)\}\) in \(\mathbb{R}^2\). The convex hull is the triangle \(T = \{(x,y) : x \geq 0,\, y \geq 0,\, x+y \leq 1\}\). Each of the three inequalities defines a half-space (a convex set), and \(T\) is their intersection. Any convex set containing the three vertices must contain all convex combinations of those vertices, i.e., must contain \(T\). So \(T\) is the smallest convex set containing \(S\).
</div>

## 1.2b Key Examples: Visualizing Convex Sets in Low Dimensions

Before proceeding to supporting hyperplanes, it is helpful to develop a library of standard examples and to understand how the convex hull operation behaves in familiar settings.

<div class="example">
<strong>Convex sets in \(\mathbb{R}^1\): intervals.</strong> In \(\mathbb{R}^1\), a set \(C \subseteq \mathbb{R}\) is convex if and only if it is an interval (possibly unbounded, possibly a single point, possibly empty). This is because the convex condition \((1-t)x + ty \in C\) for all \(x, y \in C\) and \(t \in [0,1]\) is exactly the condition that \(C\) contains all points between any two of its elements — the definition of an interval. The convex hull of a set \(S \subseteq \mathbb{R}\) is the smallest interval containing \(S\), i.e., \([\inf S, \sup S]\).

This 1D case is the foundation for the Prékopa–Leindler proof and the 1D Brunn–Minkowski inequality: for intervals, \(|A + B| = |A| + |B|\) (equality, not just inequality).
</div>

<div class="example">
<strong>Convex sets in \(\mathbb{R}^2\): a classification.</strong> In \(\mathbb{R}^2\), the following are all convex: disks, half-planes, triangles (and all polygons that are convex — "convex polygons"), ellipses (filled), strips \(\{a \leq x_1 \leq b\}\), wedges \(\{x_1 \geq 0, x_2 \geq 0\}\), and the entire plane. The following are NOT convex: the letter "C" (the circular arc without the interior is not convex; the interior-filled "C" shape has a concavity), a star polygon, an annulus \(\{r_1 \leq \|x\| \leq r_2\}\), the set \(\mathbb{R}^2 \setminus \{(0,0)\}\) (remove one point from the plane — take two points on opposite sides of the origin; the segment between them passes through the removed point).

The convex hull in \(\mathbb{R}^2\) of a finite point cloud is a convex polygon — the smallest convex polygon containing all the points. Computing this convex hull is one of the fundamental problems in computational geometry, solvable in \(O(n \log n)\) time by the Graham scan or Jarvis march algorithms.
</div>

<div class="example">
<strong>The PSD cone as a convex set.</strong> The set of positive semidefinite \(n \times n\) symmetric matrices \(\mathcal{S}^n_+ = \{A : A = A^T, A \succeq 0\}\) is a convex cone in the vector space of symmetric matrices. Convexity: if \(A \succeq 0\) and \(B \succeq 0\), then for \(t \in [0,1]\): \((1-t)A + tB \succeq 0\) (since for any vector \(v\), \(v^T((1-t)A + tB)v = (1-t)v^TAv + tv^TBv \geq 0\)). Cone property: \(\lambda A \succeq 0\) for any \(\lambda \geq 0\) if \(A \succeq 0\). The extreme rays of \(\mathcal{S}^n_+\) are the rank-1 matrices \(vv^T\) for \(v \neq 0\) — by Krein–Milman applied appropriately (this is the "spectral theorem" in disguise).

The PSD cone is the fundamental object in semidefinite programming (SDP), which generalizes linear programming by replacing linear inequality constraints with matrix inequality constraints \(X \succeq 0\). Many problems in combinatorial optimization (maximum cut, graph coloring) can be relaxed to SDPs.
</div>

## 1.3 Supporting Hyperplanes and Separation

One of the most powerful tools in convex geometry is the ability to separate convex sets by hyperplanes. Geometrically, if two convex sets do not overlap, there should be a "wall" — a hyperplane — that keeps them apart. This intuition is made precise by the separation theorems, which form the geometric foundation of convex optimization duality.

The connection to optimization is direct: the KKT conditions for constrained optimization are equivalent to separation of the primal feasible set from the "target" set, and the strong duality theorem in linear programming is equivalent to the strict separation of disjoint convex sets.

<div class="definition">
<strong>Supporting hyperplane.</strong> A hyperplane \(H = \{x : \langle u, x \rangle = c\}\) is a <em>supporting hyperplane</em> of a convex set \(C\) at a boundary point \(x_0 \in \partial C\) if \(x_0 \in H\) and \(C\) is entirely contained in one of the two closed half-spaces determined by \(H\). Explicitly, either \(\langle u, x \rangle \leq c\) for all \(x \in C\), or \(\langle u, x \rangle \geq c\) for all \(x \in C\).
</div>

<div class="remark">
<strong>Geometric picture.</strong> Imagine the convex set \(C\) as a lump of clay. A supporting hyperplane at a boundary point \(x_0\) is like a flat table on which \(x_0\) rests: the entire body of clay sits on one side of the table, touching it exactly at \(x_0\). The normal vector \(u\) points away from the body. At a smooth boundary point, there is exactly one supporting hyperplane (the tangent plane); at a corner, there may be infinitely many.
</div>

<div class="theorem">
<strong>Supporting Hyperplane Theorem.</strong> Let \(C \subseteq \mathbb{R}^n\) be a nonempty convex set. For every point \(x_0 \in \partial C\) (the topological boundary of \(C\)), there exists a supporting hyperplane of \(C\) at \(x_0\). That is, there is a nonzero vector \(u \in \mathbb{R}^n\) such that \(\langle u, x \rangle \leq \langle u, x_0 \rangle\) for all \(x \in C\).
</div>

<div class="proof">
The key ingredient is the projection onto a closed convex set. If \(C\) is closed, take a sequence of points \(y_k \notin C\) approaching \(x_0\). Each \(y_k\) has a closest point \(p_k \in C\), and the unit vector \(u_k = (y_k - p_k)/\|y_k - p_k\|\) satisfies \(\langle u_k, x - p_k \rangle \leq 0\) for all \(x \in C\) (this is the characterization of orthogonal projection onto convex sets). A subsequential limit as \(y_k \to x_0\) yields the desired normal vector \(u\) at \(x_0\). For non-closed convex sets, one works with the closure and verifies the supporting hyperplane still touches the original set at the boundary point. The Hahn–Banach separation theorem provides an alternative approach valid in infinite-dimensional Banach spaces.
</div>

<div class="example">
<strong>Worked Example: Supporting hyperplanes of the \(\ell^\infty\) ball.</strong> The unit \(\ell^\infty\) ball in \(\mathbb{R}^2\) is the square \(C = [-1,1]^2\). At the corner point \(x_0 = (1,1)\), which supporting hyperplanes exist? We need \(\langle u, x \rangle \leq \langle u, x_0\rangle = u_1 + u_2\) for all \((x_1,x_2) \in [-1,1]^2\). Since \(\max_{C} \langle u, x \rangle = |u_1| + |u_2|\), we need \(|u_1| + |u_2| = u_1 + u_2\), which requires \(u_1 \geq 0\) and \(u_2 \geq 0\). So every direction \(u = (\cos\theta, \sin\theta)\) with \(\theta \in [0, \pi/2]\) gives a valid supporting hyperplane at this corner. This illustrates how corners of convex sets have entire fans of supporting hyperplanes — in contrast to smooth boundary points.
</div>

<div class="theorem">
<strong>Separation Theorem.</strong> Let \(C\) and \(D\) be nonempty convex sets in \(\mathbb{R}^n\) with \(C \cap D = \emptyset\). Then there exists a nonzero vector \(u\) and a scalar \(c\) such that \(\langle u, x \rangle \leq c \leq \langle u, y \rangle\) for all \(x \in C\) and \(y \in D\). If additionally \(C\) is compact and \(D\) is closed, the separation is strict: \(\langle u, x \rangle < c < \langle u, y \rangle\).
</div>

<div class="proof">
<em>Idea of proof.</em> The set \(C - D = \{x - y : x \in C, y \in D\}\) is convex (as a Minkowski sum \(C + (-D)\)). The assumption \(C \cap D = \emptyset\) means \(0 \notin C - D\). Apply the supporting hyperplane theorem to \(C - D\) at the origin (or at its closest point to the origin). The separating hyperplane for \(C - D\) at \(0\) directly yields a hyperplane separating \(C\) from \(D\). Strict separation follows from compactness: if \(C\) is compact and \(D\) is closed and disjoint from \(C\), then \(\mathrm{dist}(C, D) > 0\), and we can strictly separate.
</div>

<div class="remark">
<strong>Connection to strong duality in optimization.</strong> The separation theorem is the geometric heart of LP duality. Suppose we want to minimize \(c^T x\) over the feasible set \(P = \{x : Ax \leq b\}\). If the optimal value is \(v\), then the sets \(\{x : Ax \leq b,\, c^T x < v\}\) and any supporting hyperplane to the feasible set at the optimum provide a separating hyperplane — and that hyperplane corresponds precisely to the dual optimal solution. The Lagrange multipliers in nonlinear programming are the normal vector of this separating hyperplane.
</div>

## 1.4 Extreme Points

<div class="definition">
<strong>Extreme point.</strong> A point \(x \in C\) is an <em>extreme point</em> of the convex set \(C\) if it cannot be written as a nontrivial convex combination of two distinct points in \(C\). Formally, if \(x = (1-t)y + tz\) with \(y, z \in C\) and \(t \in (0,1)\), then necessarily \(y = z = x\). The set of extreme points of \(C\) is denoted \(\mathrm{ext}(C)\).
</div>

The extreme points are the "irreducible" building blocks of a convex set — the points that cannot be decomposed as mixtures of other points. In a polytope they are exactly the vertices; in a ball they are the points on the boundary sphere; in a half-space they do not exist (the half-space is unbounded and every boundary point can be expressed as a convex combination of other boundary points).

<div class="example">
<strong>Extreme points of standard convex sets.</strong>
<ul>
<li>For the closed unit disk \(\mathbb{B}^2 \subset \mathbb{R}^2\), the extreme points are precisely the points on the boundary circle \(\mathbb{S}^1\). Any interior point \(p\) with \(\|p\| < 1\) can be written as the midpoint of \(p - \varepsilon e\) and \(p + \varepsilon e\) (for small \(\varepsilon\) and any unit vector \(e\)), both of which lie in the disk.</li>
<li>For a closed triangle (filled), the extreme points are the three vertices. Any point on an edge (but not a vertex) is the average of the two endpoints.</li>
<li>For a closed line segment \(\left[a, b\right]\), the extreme points are just \(a\) and \(b\).</li>
<li>For the positive semidefinite cone \(\mathcal{S}^n_+ = \{A \in \mathbb{R}^{n \times n} : A \succeq 0\}\), the extreme rays are the rank-1 matrices \(\{vv^T : v \in \mathbb{R}^n\}\).</li>
</ul>
</div>

<div class="example">
<strong>Worked Example: Extreme points of the cross-polytope.</strong> The cross-polytope (or hyperoctahedron) in \(\mathbb{R}^n\) is \(\mathcal{C} = \{x : |x_1| + \cdots + |x_n| \leq 1\}\). Its extreme points are precisely the \(2n\) vectors \(\pm e_i\), where \(e_i\) are the standard basis vectors. To see why \(e_1 = (1,0,\ldots,0)\) is extreme: suppose \(e_1 = (1-t)y + tz\) with \(y, z \in \mathcal{C}\) and \(t \in (0,1)\). Then \(y_1, z_1 \leq 1\) (since \(\|y\|_1 \leq 1\) forces \(y_1 \leq 1\)), and \((1-t)y_1 + tz_1 = 1\) forces \(y_1 = z_1 = 1\). But then \(\|y\|_1 \geq y_1 = 1\) and \(\|y\|_1 \leq 1\) together give \(y_2 = \cdots = y_n = 0\), so \(y = e_1\). Similarly \(z = e_1\). So \(e_1\) is extreme.
</div>

<div class="theorem">
<strong>Krein–Milman Theorem (statement).</strong> Every nonempty compact convex set \(C \subseteq \mathbb{R}^n\) is the closed convex hull of its extreme points:

\[
C = \overline{\mathrm{conv}}(\mathrm{ext}(C)).
\]
</div>

This theorem, proven in Chapter 7 in the context of integral representations, shows that extreme points completely determine compact convex sets. It is a deep result: it says that for any compact convex body, no matter how "round" and featureless it appears, it is always built from its most rigid, irreducible elements.

<div class="remark">
<strong>Why Krein–Milman is surprising.</strong> At first glance, the theorem seems like it might be trivially true (just take the convex hull of all the "corner" points), but the content is precisely that every compact convex set <em>has</em> extreme points and that those extreme points suffice to recover the entire set. Consider the closed unit ball \(\mathbb{B}^n\): its extreme points form the entire sphere \(\mathbb{S}^{n-1}\), which is a set of measure zero in the ball, yet the ball is the closed convex hull of this sphere. This is geometrically obvious once stated, but the theorem asserts the same thing in infinite-dimensional spaces where intuition fails. In the space \(L^\infty([0,1])\), for instance, the unit ball has extreme points that are genuinely difficult to describe explicitly — yet the theorem guarantees they exist and generate the ball.

For a simplex (triangle in 2D, tetrahedron in 3D, \(n\)-simplex in \(\mathbb{R}^n\)): the extreme points are exactly the \(n+1\) vertices, and Carathéodory's theorem tells us every point in the simplex is a convex combination of at most \(n+1\) vertices — exactly the Krein–Milman content for this case. For the hypercube \([-1,1]^n\): the extreme points are the \(2^n\) vertices \((\pm 1, \ldots, \pm 1)\), and their convex hull is the entire cube. For the unit ball: the sphere generates the ball. The content of Krein–Milman is that this always works, no matter how "smooth" or "round" the set is, and even in infinite dimensions.
</div>

<div class="remark">
<strong>Why Krein–Milman matters.</strong> In optimization, the Krein–Milman theorem underpins the simplex method: for a linear program \(\max c^T x\) over a polytope, the maximum is always attained at a vertex (an extreme point). More generally, any linear functional over a compact convex set achieves its maximum at an extreme point. In functional analysis, the theorem characterizes the structure of dual spaces and is used to prove that every continuous function on a compact space is a limit of convex combinations of extreme points of the dual ball.
</div>

## 1.4b Caratheodory's Theorem for Linear Hulls and Extreme Points

The following result is a linear (rather than affine) analogue of Carathéodory's theorem, and connects Chapter 1 to Chapter 7.

<div class="proposition">
<strong>Linear Carathéodory theorem.</strong> Every point in the convex cone generated by a set \(S \subset \mathbb{R}^n\) (i.e., every \(x = \sum_i \lambda_i s_i\) with \(\lambda_i \geq 0\) and \(s_i \in S\)) can be expressed as a non-negative combination of at most \(n\) points of \(S\).
</div>

<div class="remark">
Note the bound is \(n\), not \(n+1\): this is because conic combinations do not have the "summing to 1" constraint, so the dimension counts differently. The proof is identical to Carathéodory's proof but without the affine dependence step — one uses linear dependence of \(n+1\) or more vectors in \(\mathbb{R}^n\).
</div>

<div class="proposition">
<strong>Extreme points and faces: precise relationship.</strong> Let \(C\) be a convex polytope. A point \(p \in C\) is an extreme point if and only if \(\{p\}\) is a face of \(C\) (a zero-dimensional face, i.e., a vertex). More generally, a proper face \(F\) of \(C\) consists of extreme points of \(F\) that may or may not be extreme in \(C\). A point \(p \in F\) is extreme in \(C\) if and only if \(\{p\}\) is a face of \(C\), not merely a face of \(F\).

This characterization is important for the simplex method: the vertices of the feasible polytope (the extreme points of the feasible region) are the only candidates for the optimal LP solution. The simplex method searches only among vertices (zero-dimensional faces), exploiting Krein–Milman (every compact convex set is the convex hull of its extreme points, so the max of a linear functional is attained at an extreme point).
</div>

## 1.5 Polyhedra, Polytopes, and the Minkowski Sum

<div class="definition">
<strong>Polyhedron and polytope.</strong> A <em>polyhedron</em> in \(\mathbb{R}^n\) is the intersection of finitely many closed half-spaces:

\[
P = \{x \in \mathbb{R}^n : Ax \leq b\}
\]
for some matrix \(A \in \mathbb{R}^{m \times n}\) and vector \(b \in \mathbb{R}^m\). A <em>polytope</em> is a bounded polyhedron, equivalently (by a theorem of Weyl and Minkowski) the convex hull of finitely many points.
</div>

The equivalence between the "vertex description" \(P = \mathrm{conv}(V)\) and the "half-space description" \(P = \{x : Ax \leq b\}\) is called the **Weyl–Minkowski theorem**. It is non-trivial: converting between the two representations is computationally hard in general (the "vertex enumeration problem"), but the theoretical equivalence is fundamental.

<div class="example">
<strong>The hypercube and the cross-polytope as dual polytopes.</strong> The unit hypercube is \([0,1]^n\) (or often centered at the origin as \([-1,1]^n\)). The cross-polytope is \(\mathcal{C}_n = \{x : \sum_i |x_i| \leq 1\}\). These two polytopes are polar duals of each other (see Chapter 8): the polar dual of the hypercube centered at the origin is the cross-polytope, and vice versa. As a sanity check in \(\mathbb{R}^2\): the unit square has vertices \((\pm 1, 0)\) and \((0, \pm 1)\) — wait, that's the diamond (cross-polytope). So the square \([-1,1]^2\) has vertices \((\pm 1, \pm 1)\), and its polar \(\{y : \langle v, y\rangle \leq 1\) for all vertices \(v\}\) is \(\{y : |y_1| + |y_2| \leq 1\}\), the diamond. This is verified explicitly in Section 8.1.
</div>

<div class="definition">
<strong>Minkowski sum.</strong> For sets \(A, B \subseteq \mathbb{R}^n\), their <em>Minkowski sum</em> is

\[
A + B = \{a + b : a \in A, b \in B\}.
\]
For a scalar \(\lambda \geq 0\), the dilation is \(\lambda A = \{\lambda a : a \in A\}\). The <em>Minkowski combination</em> \((1-t)A + tB\) for \(t \in \left[0,1\right]\) interpolates between \(A\) and \(B\).
</div>

<div class="remark">
The Minkowski sum of two polytopes is again a polytope. The vertices of \(P + Q\) are not simply the sums of vertices of \(P\) and \(Q\), but every vertex of \(P + Q\) is the sum of a vertex of \(P\) and a vertex of \(Q\). The number of vertices of \(P + Q\) can grow combinatorially.
</div>

<div class="example">
<strong>Worked Example: Minkowski sum of two squares.</strong> Let \(A = [-1,1]^2\) and \(B = [-r,r]^2\) be two squares in \(\mathbb{R}^2\) (a scaled copy). Their Minkowski sum is \(A + B = [-(1+r), 1+r]^2\), just a larger square. More interesting: let \(A = [-1,1]^2\) (a square) and \(B = \overline{\mathbb{B}^2}\) (the unit disk). Their Minkowski sum \(A + B\) is the "rounded square" — the square with corners smoothed by arcs of the unit circle. Specifically, each straight edge of \(A\) gets shifted outward by 1 (contributing a straight edge of \(A + B\)), and each corner contributes a quarter-circle arc of radius 1. The resulting set is convex.

This operation — adding a ball to "smooth" a polytope — is called taking the <strong>parallel body</strong> of \(A\) at radius 1. It is precisely the set of points within distance 1 of \(A\). The Steiner formula (Chapter 4) expresses the volume of this parallel body as a polynomial in the radius.
</div>

The Minkowski sum is the fundamental operation of convex geometry. It appears in the Steiner formula for the volume of dilated convex bodies, in the definition of mixed volumes, and in the Brunn–Minkowski inequality.

<div class="remark">
<strong>Support functions of Minkowski sums.</strong> One of the most elegant properties of the support function is its behavior under Minkowski addition: \(h_{A+B}(u) = h_A(u) + h_B(u)\). This transforms the nonlinear geometric operation of Minkowski sum into a simple linear operation on functions. It is the key reason why the support function is the natural tool for studying the Brunn–Minkowski theory (see Chapter 8).
</div>

---

# Chapter 2: Combinatorial Theorems

The three great combinatorial theorems of convex geometry — Carathéodory's theorem, Radon's theorem, and Helly's theorem — all concern the interplay between convexity and dimension. They have the same flavor: "how many points do you need" or "what do small families force about large families." Together they form the toolkit for the combinatorial geometry of convex sets.

## 2.0 The Big Picture: Combinatorial Convexity

Before diving into the theorems, it is worth understanding what questions they answer and why the answers are not obvious.

**Carathéodory**: If a point is in the convex hull of a set, how many generating points do you need? The naive answer is "possibly infinitely many" (e.g., a circle can generate a disk, and a single point on the circle is not enough). Carathéodory says: always at most \(n+1\) points in \(\mathbb{R}^n\). This is remarkable and tight: for the standard simplex (the convex hull of \(n+1\) points), an interior point genuinely requires all \(n+1\) vertices.

**Radon**: Can you always partition a set of points into two parts with intersecting convex hulls? For \(n+1\) points in general position (no linear dependencies), the answer is no — the convex hulls of any partition of a simplex's vertices into two non-empty parts are disjoint. But add one more point (\(n+2\) total) and the answer becomes: always yes. This is the threshold.

**Helly**: If a collection of convex sets satisfies a "small-scale" intersection condition (every \(n+1\) of them share a point), does it satisfy a "global" intersection condition (all of them share a point)? Again, the answer is: yes, and the threshold \(n+1\) is tight (take \(n+1\) pairwise intersecting sets in \(\mathbb{R}^n\) with no common point — this is possible; but require every \(n+1\) of them to intersect and you're done).

The number \(n+1\) appearing in all three theorems is not a coincidence: it is the affine dimension of \(\mathbb{R}^n\) plus one, and reflects the fact that \(n+1\) is the maximum size of an affinely independent set in \(\mathbb{R}^n\).

## 2.1 Carathéodory's Theorem

The first major combinatorial result tells us that convex combinations can always be realized with few points.

<div class="theorem">
<strong>Carathéodory's Theorem.</strong> Let \(S \subseteq \mathbb{R}^n\) be any set. If \(x \in \mathrm{conv}(S)\), then \(x\) can be expressed as a convex combination of at most \(n+1\) points in \(S\). In other words, every point of \(\mathrm{conv}(S)\) lies in the convex hull of some \((n+1)\)-element subset of \(S\).
</div>

<div class="proof">
Suppose \(x = \sum_{i=1}^k \lambda_i x_i\) is a convex combination with \(\lambda_i > 0\) and \(k > n+1\). We will reduce the number of points while remaining in \(\mathrm{conv}(S)\).

Since \(k > n+1\), the \(k\) points \(x_1, \ldots, x_k\) cannot be affinely independent (as \(\mathbb{R}^n\) has affine dimension \(n\), so any affinely independent set has at most \(n+1\) elements). Therefore there exist real numbers \(\mu_1, \ldots, \mu_k\), not all zero, with \(\sum_{i=1}^k \mu_i = 0\) and \(\sum_{i=1}^k \mu_i x_i = 0\).

For any \(s \in \mathbb{R}\), the combination \(x = \sum_{i=1}^k (\lambda_i - s\mu_i) x_i\) still sums to \(\sum \lambda_i - s \sum \mu_i = 1\). Choose \(s^* = \min\left\{\frac{\lambda_i}{\mu_i} : \mu_i > 0\right\}\). Then all coefficients \(\lambda_i - s^*\mu_i\) are nonneg, and at least one equals zero (the one achieving the minimum). This expresses \(x\) as a convex combination of at most \(k-1\) points. Repeating this argument reduces to at most \(n+1\) points.
</div>

<div class="remark">
The bound \(n+1\) is sharp: the vertices of a simplex in \(\mathbb{R}^n\) are affinely independent, and an interior point of the simplex requires all \(n+1\) vertices. The analogous result for affine hulls is that every point in \(\mathrm{aff}(S)\) is an affine combination of at most \(n+1\) points of \(S\).
</div>

<div class="example">
<strong>Worked Example: Carathéodory in \(\mathbb{R}^2\).</strong> Let \(S = \{(0,0), (2,0), (1,2), (0,3)\}\) in \(\mathbb{R}^2\). Consider the point \(p = (0.75, 1.25)\). Is \(p \in \mathrm{conv}(S)\)? Carathéodory tells us that if \(p\) is in the convex hull at all, it can be expressed as a convex combination of at most 3 of the 4 points. Let us try with the first three: \(p = \lambda_1 (0,0) + \lambda_2 (2,0) + \lambda_3 (1,2)\) with \(\lambda_1 + \lambda_2 + \lambda_3 = 1\). This gives the system \(2\lambda_2 + \lambda_3 = 0.75\) and \(2\lambda_3 = 1.25\), yielding \(\lambda_3 = 0.625\) and \(\lambda_2 = 0.0625\), \(\lambda_1 = 0.3125\). Since all \(\lambda_i > 0\), the point \(p\) is indeed in the convex hull of these three vertices, without needing the fourth point.
</div>

<div class="remark">
<strong>Algorithmic consequence.</strong> Carathéodory's theorem implies that membership in \(\mathrm{conv}(S)\) (for a finite set \(S\)) can be decided by a finite algorithm: we need only check all \(\binom{|S|}{n+1}\) subsets of size \(n+1\). This is exponential in \(n\) but polynomial in \(|S|\) for fixed \(n\).
</div>

## 2.2 Radon's Theorem

<div class="theorem">
<strong>Radon's Theorem.</strong> Any set of \(n+2\) or more points in \(\mathbb{R}^n\) can be partitioned into two disjoint subsets whose convex hulls intersect.
</div>

<div class="proof">
Let \(x_1, \ldots, x_{n+2} \in \mathbb{R}^n\). Since there are \(n+2\) points in \(\mathbb{R}^n\), the \(n+2\) vectors \(x_2 - x_1, \ldots, x_{n+2} - x_1\) live in \(\mathbb{R}^n\) and hence are linearly dependent. So there exist \(\mu_2, \ldots, \mu_{n+2}\) not all zero with \(\sum_{i=2}^{n+2} \mu_i (x_i - x_1) = 0\). Setting \(\mu_1 = -\sum_{i=2}^{n+2} \mu_i\) gives scalars \(\mu_1, \ldots, \mu_{n+2}\) with \(\sum \mu_i = 0\) and \(\sum \mu_i x_i = 0\), not all zero.

Partition the indices into \(I^+ = \{i : \mu_i \geq 0\}\) and \(I^- = \{i : \mu_i < 0\}\). Let \(\Lambda = \sum_{i \in I^+} \mu_i = \sum_{i \in I^-} (-\mu_i) > 0\) (both sums equal \(\Lambda\) since \(\sum \mu_i = 0\)). Then the point \(p = \sum_{i \in I^+} \frac{\mu_i}{\Lambda} x_i = \sum_{i \in I^-} \frac{-\mu_i}{\Lambda} x_i\) is a convex combination of points in \(\{x_i : i \in I^+\}\) and simultaneously of points in \(\{x_i : i \in I^-\}\), so \(p\) lies in both convex hulls.
</div>

<div class="example">
<strong>Worked Example: Radon partition in \(\mathbb{R}^2\).</strong> Take the four points \(A = (0,0)\), \(B = (2,0)\), \(C = (0,2)\), \(D = (1,1)\) in \(\mathbb{R}^2\). We seek a Radon partition. Following the proof: the vectors \(B - A = (2,0)\), \(C - A = (0,2)\), \(D - A = (1,1)\) are linearly dependent: \((1,1) = \frac{1}{2}(2,0) + \frac{1}{2}(0,2)\), so \(\mu_B = \mu_C = 1/2\), \(\mu_D = -1\), \(\mu_A = 0\). (One can check: \(\mu_A + \mu_B + \mu_C + \mu_D = 0 + 1/2 + 1/2 - 1 = 0\) and \(\mu_A A + \mu_B B + \mu_C C + \mu_D D = (1,0) + (0,1) - (1,1) = (0,0) = \mathbf{0}\).) The partition is \(I^+ = \{B, C\}\) and \(I^- = \{D\}\) (with \(A\) having \(\mu_A = 0\), we can put it in either part; let us add it to \(I^+\)). The Radon point is \(p = \frac{1/2}{1} B + \frac{1/2}{1} C = (1,0) + (0,1) = (1,1) = D\). So \(D \in \mathrm{conv}\{A,B,C\}\), confirming that \(D\) is in the interior of the triangle \(ABC\).
</div>

Radon's theorem is the foundation of Helly's theorem. It can also be stated as: any \(n+2\) points admit a **Radon partition** \(A \cup B\) with \(A \cap B = \emptyset\) and \(\mathrm{conv}(A) \cap \mathrm{conv}(B) \neq \emptyset\).

## 2.3 Helly's Theorem

<div class="theorem">
<strong>Helly's Theorem.</strong> Let \(C_1, C_2, \ldots, C_m\) be a finite collection of convex sets in \(\mathbb{R}^n\) with \(m > n\). If every \(n+1\) of these sets have a common point, then all \(m\) sets have a common point:

\[
\bigcap_{i=1}^m C_i \neq \emptyset.
\]
The same conclusion holds for infinite families of compact convex sets.
</div>

<div class="proof">
We prove the finite case by induction on \(m\). The base case \(m = n+1\) holds by hypothesis.

For the inductive step, assume the theorem holds for any \(m-1\) sets (with \(m > n+1\)). For each \(i \in \{1, \ldots, m\}\), the hypothesis guarantees every \(n+1\) of the remaining \(m-1\) sets \(\{C_j : j \neq i\}\) have a common point (since those \(n+1\) sets are also \(n+1\) of the full family). By the inductive hypothesis applied to the family \(\{C_j : j \neq i\}\), there exists a point \(x_i \in \bigcap_{j \neq i} C_j\).

We now have \(m\) points \(x_1, \ldots, x_m \in \mathbb{R}^n\). Since \(m \geq n+2\), Radon's theorem applies: partition \(\{x_1, \ldots, x_m\}\) into disjoint sets \(A\) and \(B\) with \(\mathrm{conv}(A) \cap \mathrm{conv}(B) \ni p\) for some point \(p\).

Fix any index \(k\). Either \(x_k \in A\) or \(x_k \in B\). If \(x_k \in A\), then every point of \(B\) (say \(x_j \in B\)) satisfies \(j \neq k\), so \(x_j \in C_k\). Since \(C_k\) is convex and \(p \in \mathrm{conv}(B)\), we get \(p \in C_k\). Similarly if \(x_k \in B\). Since \(k\) was arbitrary, \(p \in \bigcap_{k=1}^m C_k\).
</div>

<div class="example">
<strong>Worked Example: Helly's theorem in dimension 1.</strong> On the real line (\(n = 1\)), Helly's theorem says: if we have a family of intervals and every two of them overlap, then all of them have a common point. Take five intervals: \([0, 4]\), \([1, 5]\), \([2, 6]\), \([3, 7]\), \([4, 8]\). Every pair overlaps (the closest pair is \([0,4]\) and \([4,8]\), which intersect at \(\{4\}\)). And indeed all five share the point \(4\). This is the \(n=1\) case with \(n+1 = 2\): pairwise intersection implies global intersection.

Now take instead \([0,2]\), \([1,3]\), \([2,4]\). Every two overlap, and the global intersection is \(\{2\}\) — just a single point. Modifying the last interval to \([2.1, 4]\) destroys the common intersection: \([0,2]\) and \([2.1, 4]\) fail to intersect, violating the pairwise condition.
</div>

<div class="example">
<strong>Worked Example: Helly in \(\mathbb{R}^2\) with a concrete family.</strong> Consider four convex sets in \(\mathbb{R}^2\): \(C_1 = \{(x,y) : x \geq 0\}\), \(C_2 = \{(x,y) : y \geq 0\}\), \(C_3 = \{(x,y) : x + y \leq 2\}\), \(C_4 = \{(x,y) : x - y \leq 1\}\). We have \(n = 2\), so we need every 3 to have a common point. Let us check:
<ul>
<li>\(C_1 \cap C_2 \cap C_3\): the triangle \(\{x,y \geq 0,\, x+y \leq 2\}\), nonempty (contains origin).</li>
<li>\(C_1 \cap C_2 \cap C_4\): the region \(x \geq 0, y \geq 0, x - y \leq 1\). Contains \((0,0)\).</li>
<li>\(C_1 \cap C_3 \cap C_4\): \(x \geq 0, x+y \leq 2, x-y \leq 1\). Contains \((1,0)\).</li>
<li>\(C_2 \cap C_3 \cap C_4\): \(y \geq 0, x+y \leq 2, x-y \leq 1\). Contains \((0,0)\).</li>
</ul>
All triples intersect. By Helly, all four intersect. Indeed \((0.5, 0.5)\) satisfies all four constraints.
</div>

<div class="example">
Helly's theorem has beautiful combinatorial applications. Suppose \(n\) people go hiking in \(\mathbb{R}^2\) and each pair of them can see each other (their visibility regions pairwise intersect in a convex set). Helly's theorem in \(\mathbb{R}^2\) (with \(n+1 = 3\)) would then imply all can see a common point, provided every three can. More concretely: if \(n\) unit intervals on the real line satisfy the property that every two overlap, Helly's theorem (in dimension 1) guarantees a common point, recovering the intuitive fact that pairwise overlapping intervals on the line have a global intersection point.
</div>

<div class="remark">
<strong>Topological Helly theorem.</strong> Helly's theorem has been generalized far beyond convex sets. The topological version (Helly 1923, generalized by various authors) states that the same conclusion holds if the sets are "topologically nice" in appropriate senses. In combinatorics, fractional Helly theorems give probabilistic versions: if many (but not necessarily all) \((n+1)\)-tuples intersect, then a positive fraction of all sets have a common point.
</div>

<div class="remark">
<strong>The logical structure of Carathéodory, Radon, and Helly.</strong> These three theorems are not merely three independent results — they form a logical chain. Carathéodory's theorem bounds the "complexity" of a single point in a convex hull (at most \(n+1\) generators). Radon's theorem uses a dimension-counting argument to force an intersection between two complementary subsets. Helly's theorem uses Radon's theorem as its key inductive step. In this sense, Helly is a "global" consequence of the "local" geometry captured by Radon.

There is a fourth theorem in this family worth knowing: <strong>Tverberg's theorem</strong> (1966), which generalizes Radon. It states that any set of \((r-1)(n+1)+1\) points in \(\mathbb{R}^n\) can be partitioned into \(r\) subsets whose convex hulls have a common point. For \(r=2\) this is exactly Radon's theorem (\(n+2\) points, partition into 2). Tverberg's theorem is the starting point for an active modern area (topological Tverberg theorems and their combinatorial consequences).

Together, these results illustrate a deep principle: in convex geometry, dimension bounds "what can happen." In \(\mathbb{R}^n\), the threshold is always \(n+1\) or \(n+2\) — the number of points that can be in general position, and the number at which linear dependence is forced.
</div>

## 2.4 Kirchberger's Theorem

Kirchberger's theorem concerns the separability of two finite point sets.

<div class="theorem">
<strong>Kirchberger's Theorem.</strong> Let \(P\) and \(Q\) be finite point sets in \(\mathbb{R}^n\). The sets \(P\) and \(Q\) can be separated by a hyperplane if and only if for every subset \(T \subseteq P \cup Q\) of size at most \(n+2\), the sets \(T \cap P\) and \(T \cap Q\) can be separated by a hyperplane.
</div>

<div class="proof">
The "only if" direction is immediate: a separating hyperplane for \(P\) and \(Q\) also separates any subset. For the "if" direction, suppose every \((n+2)\)-element subset of \(P \cup Q\) has a separating hyperplane. One applies Helly's theorem to an appropriate family of convex sets derived from the separation conditions. Specifically, for each \((n+2)\)-element subset \(T\) of \(P \cup Q\), the set of separating hyperplanes (parameterized in the dual space) forms a convex region. The pairwise — indeed every \((n+2)\)-fold — intersection condition translates to the Helly hypothesis, giving a hyperplane that globally separates \(P\) from \(Q\).
</div>

<div class="remark">
Kirchberger's theorem can be viewed as a qualitative refinement of the separating hyperplane theorem for finite point clouds. It shows that the "witness" for non-separability, if it exists, can always be found among small subsets. This has algorithmic implications for linear programming and learning theory.
</div>

---

# Chapter 3: Geometry of Polytopes

A polytope is the convex hull of finitely many points, or equivalently (by Weyl–Minkowski) the bounded intersection of finitely many half-spaces. Polytopes are the "molecules" of convex geometry: they are the most concrete convex bodies, they can be described explicitly, and their combinatorial structure is both rich and tractable. The study of polytopes connects combinatorics, geometry, and algebra in deep ways.

## 3.0 Motivation: Why Study Polytopes?

Polytopes occupy a special place in convex geometry: they are the most concrete convex bodies (described by finitely many data), yet their study reveals deep truths that apply to all convex bodies. Every convex body can be approximated by polytopes (in the Hausdorff metric, polytopes are dense in the space of convex bodies), so proving results for polytopes and passing to a limit often gives results for general convex bodies.

The study of polytopes also connects to:
- **Linear programming:** the feasible region of an LP is a polyhedron, and the optimal solution is at a vertex. The simplex method navigates the face structure of the polytope to find the optimum.
- **Combinatorics:** the face lattice of a polytope encodes combinatorial information (Euler's formula, Dehn–Sommerville relations, the \(g\)-theorem). The connection between polytope theory and algebraic combinatorics (via toric varieties and Stanley–Reisner rings) is one of the most productive interfaces in modern mathematics.
- **Algebraic geometry:** the Newton polytope of a polynomial controls many of its geometric and algebraic properties. The theory of tropical geometry replaces polynomial rings by polytope combinatorics.

## 3.1 Faces, f-Vectors, and Euler's Formula

A **convex polytope** \(P \subset \mathbb{R}^n\) is the convex hull of finitely many points. The combinatorial structure of \(P\) is encoded in its **faces**.

<div class="definition">
<strong>Face.</strong> A <em>face</em> of a polytope \(P\) is a set of the form \(P \cap H\) where \(H\) is a supporting hyperplane of \(P\), together with the empty face and \(P\) itself. A face of dimension \(0\) is a <em>vertex</em>, dimension \(1\) an <em>edge</em>, dimension \(n-2\) a <em>ridge</em>, dimension \(n-1\) a <em>facet</em>. The <em>f-vector</em> of a polytope \(P\) in \(\mathbb{R}^3\) is \((f_0, f_1, f_2)\) where \(f_k\) counts the faces of dimension \(k\).
</div>

<div class="remark">
The face structure of a polytope is extremely rigid: every face of a face of \(P\) is itself a face of \(P\), and the set of all faces forms a lattice (the face lattice) under inclusion. This lattice captures the combinatorial type of \(P\) — two polytopes are called combinatorially equivalent if their face lattices are isomorphic. There are more combinatorial types of \(n\)-polytopes than we can count for large \(n\).
</div>

<div class="theorem">
<strong>Euler's Formula.</strong> For any convex polytope \(P\) in \(\mathbb{R}^3\) (equivalently any convex polyhedron homeomorphic to the sphere \(\mathbb{S}^2\)):

\[
V - E + F = 2,
\]
where \(V = f_0\) is the number of vertices, \(E = f_1\) the number of edges, and \(F = f_2\) the number of faces (2-cells).
</div>

<div class="proof">
One classical proof proceeds by triangulation and induction. Triangulate all faces so that every 2-face is a triangle. Note that triangulating a face with \(k\) edges adds \(k-3\) edges and \(k-2\) triangles but does not change the Euler characteristic. One then counts: a triangulated polyhedron with \(V\) vertices, \(E\) edges, and \(F\) triangular faces satisfies \(3F = 2E\) (each edge borders two faces; each triangular face has three edges). Choose any spanning tree of the 1-skeleton (the graph of vertices and edges): it uses \(V-1\) edges and connects all \(V\) vertices. The complementary edges in the "dual spanning tree" of the face adjacency graph uses \(F-1\) edges. The remaining edge count is \(E - (V-1) - (F-1) = E - V - F + 2\). For a polyhedron homeomorphic to the sphere, this count equals 1 (the graph has a single connected component and no cycle remaining), giving \(E - V - F + 2 = 1\), hence \(V - E + F = 2\).

A cleaner modern proof uses simplicial homology: the Euler characteristic \(\chi = V - E + F\) equals the alternating sum of Betti numbers, and for \(\mathbb{S}^2\) these are \(\beta_0 = \beta_2 = 1, \beta_1 = 0\), giving \(\chi = 2\).
</div>

<div class="example">
The five Platonic solids and their f-vectors:
<br>
<table>
<thead>
<tr><th>Solid</th><th>\(V\)</th><th>\(E\)</th><th>\(F\)</th><th>\(V-E+F\)</th></tr>
</thead>
<tbody>
<tr><td>Tetrahedron</td><td>4</td><td>6</td><td>4</td><td>2</td></tr>
<tr><td>Cube</td><td>8</td><td>12</td><td>6</td><td>2</td></tr>
<tr><td>Octahedron</td><td>6</td><td>12</td><td>8</td><td>2</td></tr>
<tr><td>Dodecahedron</td><td>20</td><td>30</td><td>12</td><td>2</td></tr>
<tr><td>Icosahedron</td><td>12</td><td>30</td><td>20</td><td>2</td></tr>
</tbody>
</table>
</div>

<div class="remark">
<strong>Duality of Platonic solids.</strong> Notice that the cube and octahedron have the same edge count 12, but their vertices and faces are swapped: \((V,F) = (8,6)\) for the cube and \((6,8)\) for the octahedron. This is no coincidence: the cube and octahedron are polar dual to each other. Similarly, the dodecahedron \((20, 30, 12)\) and icosahedron \((12, 30, 20)\) are dual, and the tetrahedron \((4,6,4)\) is self-dual. In general, for dual polytopes, vertices and facets are swapped while edges are preserved (in 3D). This duality is made precise by the polar body construction in Chapter 8.
</div>

## 3.2 Gauss–Bonnet Theorem for Polytopes

The classical Gauss–Bonnet theorem for smooth surfaces has a discrete analogue for polytopes, expressed in terms of angle defects.

<div class="definition">
<strong>Angle defect.</strong> At a vertex \(v\) of a 3-dimensional convex polytope, the <em>angle defect</em> \(\delta(v)\) is

\[
\delta(v) = 2\pi - \sum_{\text{faces } F \ni v} \angle_F(v),
\]
where \(\angle_F(v)\) is the interior angle of the face \(F\) at vertex \(v\).
</div>

<div class="theorem">
<strong>Descartes–Euler (Polyhedral Gauss–Bonnet).</strong> For any convex polytope \(P\) in \(\mathbb{R}^3\),

\[
\sum_{v \in \mathrm{vert}(P)} \delta(v) = 4\pi.
\]
</div>

<div class="proof">
Sum the interior angles of all faces. Each triangular face contributes \(\pi\) to the total (angle sum in a triangle). For a general polygonal face with \(k\) vertices, the interior angle sum is \((k-2)\pi\). Summing over all faces gives \(\sum_F (f_0(F) - 2)\pi = (2E - 2F)\pi\) (since each edge is shared by two faces and \(\sum_F f_0(F) = 2E\)). Meanwhile, the total of all vertex angles is \(\sum_v \left(2\pi - \delta(v)\right) = 2\pi V - \sum_v \delta(v)\). Setting these equal: \(2\pi V - \sum_v \delta(v) = (2E - 2F)\pi\), so \(\sum_v \delta(v) = 2\pi(V - E + F) = 2\pi \cdot 2 = 4\pi\) by Euler's formula.
</div>

<div class="example">
<strong>Verification for the cube.</strong> The cube has 8 vertices, each with 3 square faces meeting. Each square contributes an angle of \(\pi/2\) at each vertex. So the angle defect at each vertex is \(2\pi - 3 \cdot (\pi/2) = 2\pi - 3\pi/2 = \pi/2\). Total: \(8 \cdot (\pi/2) = 4\pi\). For the regular tetrahedron: 4 vertices, each with 3 equilateral triangles. Each triangle contributes \(\pi/3\) at a vertex. Defect: \(2\pi - 3 \cdot (\pi/3) = 2\pi - \pi = \pi\). Total: \(4 \cdot \pi = 4\pi\).
</div>

## 3.3 Cauchy's Rigidity Theorem

A striking theorem in the geometry of polytopes is that convex polytopes are rigid—their shape is determined by the shapes (but not the sizes) of their faces and the combinatorial structure.

<div class="theorem">
<strong>Cauchy's Rigidity Theorem.</strong> If two convex polyhedra in \(\mathbb{R}^3\) are combinatorially isomorphic (same face structure) and each pair of corresponding faces is congruent, then the polyhedra are congruent.
</div>

<div class="remark">
Cauchy's theorem is often paraphrased as: "You cannot continuously deform a convex polyhedron while keeping all faces rigid." The proof proceeds by labeling edges of the polyhedron with signs based on dihedral angle comparisons, and deriving a contradiction from the assumed non-congruence via an Euler-characteristic argument applied to the sign changes around vertices. The convexity hypothesis is essential—there exist non-convex flexible polyhedra (Bricard's octahedra, Connelly's sphere).
</div>

## 3.3b Normal Fans and the Structure of Polytopes

The combinatorial structure of a polytope is encoded in its normal fan — a partition of \(\mathbb{R}^n\) into cones that remembers which faces are "optimal" in each direction.

<div class="definition">
<strong>Normal cone and normal fan.</strong> For a polytope \(P\) and a face \(F \leq P\), the <em>normal cone</em> of \(F\) is:

\[
N_P(F) = \{u \in \mathbb{R}^n : \langle u, x\rangle = h_P(u) \text{ for all } x \in F\} = \{u : F \subseteq \arg\max_{P} \langle u, \cdot\rangle\}.
\]
The collection \(\{N_P(F) : F \text{ is a face of } P\}\) is the <em>normal fan</em> of \(P\).
</div>

<div class="remark">
<strong>Geometric meaning of the normal fan.</strong> The normal cone \(N_P(v)\) of a vertex \(v\) is the set of directions \(u\) for which \(v\) is the unique maximizer of \(\langle u, \cdot\rangle\) on \(P\). Equivalently, it is the set of directions for which the supporting hyperplane at \(v\) is the "tightest." The normal fan partitions \(\mathbb{R}^n\) into cones: the full-dimensional cones are the normal cones of vertices, the codimension-1 cones are the normal cones of edges, and so on. Two polytopes have the same normal fan if and only if they have the same combinatorial type with the same face normals — they are "normally equivalent."

The Minkowski sum \(P + Q\) has as its normal fan the common refinement of the normal fans of \(P\) and \(Q\). This is why Minkowski sums can "refine" the combinatorial structure of a polytope (adding more faces), and it is the precise geometric content of the formula \(h_{P+Q} = h_P + h_Q\).
</div>

<div class="example">
<strong>Normal fan of a square.</strong> For the square \(P = [-1,1]^2\), the vertices are \((\pm 1, \pm 1)\). The normal cone of the vertex \((1,1)\) is \(\{(u_1, u_2) : u_1 > 0, u_2 > 0\}\) (the open first quadrant, plus boundaries) — directions for which \((1,1)\) is the maximizer. The normal cone of the edge connecting \((1,1)\) to \((1,-1)\) (the right edge \(\{x_1=1, x_2 \in [-1,1]\}\)) is \(\{(u_1, 0) : u_1 > 0\}\) — only rightward directions with no vertical component make the entire right edge optimal. The normal fan of the square is the standard octant decomposition of \(\mathbb{R}^2\) into 4 quadrants (cones of vertices), 4 half-axes (cones of edges), and the origin (cone of the whole square).
</div>

<div class="remark">
<strong>The secondary polytope and fiber polytopes.</strong> For a fixed polytope \(P\), one can form the "secondary polytope" whose faces correspond to regular triangulations of \(P\). This connects the combinatorics of polytopes to tropical geometry, algebraic geometry (Gröbner bases), and mathematical physics (the ABHY associahedron in scattering amplitude theory). The secondary polytope is itself a polytope whose vertices correspond to regular triangulations and whose edges correspond to flips between triangulations — a rich combinatorial structure.
</div>

## 3.4 Minkowski's Existence and Uniqueness Theorem

A central question in polytope theory: given facet normals and areas, does a convex polytope with those data exist, and is it unique?

<div class="theorem">
<strong>Minkowski's Existence and Uniqueness Theorem.</strong> Let \(u_1, \ldots, u_m \in \mathbb{S}^{n-1}\) be unit vectors not all contained in any open hemisphere, and let \(\alpha_1, \ldots, \alpha_m > 0\) be positive numbers satisfying the balance condition

\[
\sum_{i=1}^m \alpha_i u_i = 0.
\]
Then there exists a convex polytope \(P\) in \(\mathbb{R}^n\), unique up to translation, whose facets have outer unit normals \(u_1, \ldots, u_m\) and corresponding \((n-1)\)-dimensional volumes (areas) \(\alpha_1, \ldots, \alpha_m\).
</div>

<div class="remark">
The balance condition \(\sum \alpha_i u_i = 0\) is necessary: the divergence theorem applied to the constant vector field on \(P\) gives exactly this identity (each facet contributes its outward normal scaled by its area, and the total flux is zero). Minkowski's theorem says this necessary condition is also sufficient. The proof of existence uses the Brunn–Minkowski theory and a compactness argument; uniqueness follows from the equality conditions in the mixed-volume inequalities.
</div>

<div class="example">
<strong>Worked Example: Verifying the balance condition for the cube.</strong> The cube \([-1,1]^3\) has 6 faces with outward normals \(\pm e_1, \pm e_2, \pm e_3\), each of area 4 (the faces are \(2 \times 2\) squares). The balance condition: \(4 e_1 + 4(-e_1) + 4 e_2 + 4(-e_2) + 4 e_3 + 4(-e_3) = 0\). Indeed satisfied. Minkowski's theorem says that this (or any proportional scaling of the areas, keeping the normals) is the only way to realize 6 square faces with these normals — up to translation.
</div>

---

# Chapter 4: Mixed Volumes and Symmetrizations

The theory of mixed volumes is the heart of Brunn–Minkowski theory. It generalizes the notion of volume to a multilinear setting, capturing how the volume of a Minkowski combination of bodies depends on all the pieces simultaneously. The Alexandrov–Fenchel inequalities are among the deepest results in convex geometry, with connections to algebraic geometry, combinatorics, and information theory.

## 4.0 Motivation: Volume as a Polynomial

Before the Steiner formula, let us appreciate why it is remarkable that the volume of a parallel body should be a polynomial. For a single point \(K = \{p\}\), the parallel body \(K_\varepsilon = B(p, \varepsilon)\) is a ball of radius \(\varepsilon\), with volume \(\omega_n \varepsilon^n\) — a polynomial. For a line segment \(K = [a,b]\) in \(\mathbb{R}^3\) (1-dimensional), the parallel body is a "capsule" (cylinder with hemispherical caps), with volume \(\pi\varepsilon^2 |b-a| + \frac{4}{3}\pi\varepsilon^3\) — again a polynomial. For a flat polygon \(K\) in \(\mathbb{R}^3\), the parallel body has volume equal to the polygon area times \(2\varepsilon\) (the flat slab) plus edge contributions (quarter-cylinders) plus corner contributions (spherical wedges). The formula sums to a polynomial in \(\varepsilon\), and the coefficient structure is exactly the Steiner formula.

The general Steiner formula says this always works, for any convex body in any dimension. The coefficients \(W_k(K)\) are the quermassintegrals — intrinsic geometric measurements of \(K\) at all scales. The formula simultaneously encodes the volume (\(k=0\)), the surface area (\(k=1\)), the mean width (\(k=n-1\)), and the Euler characteristic (implicitly, through the Gauss–Bonnet theorem).

## 4.1 The Steiner Formula

Let \(K \subset \mathbb{R}^n\) be a convex body (compact convex set with nonempty interior) and \(\mathbb{B}^n\) the unit ball. The **parallel body** of \(K\) at distance \(\varepsilon \geq 0\) is \(K_\varepsilon = K + \varepsilon \mathbb{B}^n\). A fundamental discovery of Jakob Steiner is that the volume of \(K_\varepsilon\) is a polynomial in \(\varepsilon\).

<div class="theorem">
<strong>Steiner Formula.</strong> For a convex body \(K \subseteq \mathbb{R}^n\) and \(\varepsilon \geq 0\):

\[
\mathrm{Vol}_n(K + \varepsilon \mathbb{B}^n) = \sum_{k=0}^n \binom{n}{k} W_k(K) \varepsilon^k,
\]
where the coefficients \(W_k(K)\) are called the <em>quermassintegrals</em> of \(K\). In particular, \(W_0(K) = \mathrm{Vol}_n(K)\) and \(n \cdot W_1(K) = \mathrm{Vol}_{n-1}(\partial K)\) (the surface area).
</div>

<div class="remark">
<strong>Why the Steiner formula is remarkable.</strong> There is no a priori reason why the volume of the parallel body should be a polynomial in \(\varepsilon\). For a general (non-convex) compact set, the volume of the \(\varepsilon\)-neighborhood can be highly irregular. The convexity hypothesis is essential: it forces the volume to expand in a perfectly polynomial manner. The coefficients \(W_k(K)\) — the quermassintegrals — are intrinsic geometric invariants of \(K\), and their study forms a major part of convex geometry.
</div>

<div class="example">
<strong>Worked Example: Steiner formula for the unit ball and for a box.</strong>

\textbf{Unit ball.} For \(K = \mathbb{B}^n\), we have \(K + \varepsilon \mathbb{B}^n = (1+\varepsilon)\mathbb{B}^n\), so \(\mathrm{Vol}_n(K + \varepsilon \mathbb{B}^n) = (1+\varepsilon)^n \omega_n\) where \(\omega_n = \mathrm{Vol}_n(\mathbb{B}^n)\). Expanding by the binomial theorem: \((1+\varepsilon)^n \omega_n = \sum_{k=0}^n \binom{n}{k} \omega_n \varepsilon^k\). So \(W_k(\mathbb{B}^n) = \omega_n\) for all \(k\). The quermassintegrals of the ball are all equal to its volume (up to normalization).

\textbf{Box in \(\mathbb{R}^3\).} Let \(K = [0,a] \times [0,b] \times [0,c]\) be a box. Then \(K + \varepsilon \mathbb{B}^3\) is the "rounded box" — a box with dimensions \((a + 2\varepsilon)\), \((b + 2\varepsilon)\), \((c + 2\varepsilon)\) for its flat sides, plus quarter-cylinders of radius \(\varepsilon\) on the edges and sphere caps on the corners. By direct computation:

\[
\mathrm{Vol}_3(K + \varepsilon \mathbb{B}^3) = abc + (ab + bc + ca) \cdot 2\varepsilon + (a+b+c) \cdot \pi \varepsilon^2 + \frac{4\pi}{3} \varepsilon^3.
\]
Matching with Steiner: \(W_0 = abc\), \(3 W_1 \cdot 2 = 2(ab+bc+ca)\), etc. The coefficient of \(\varepsilon^3\) is \(\omega_3 = \frac{4\pi}{3}\), as expected (the ball has volume \(\frac{4\pi}{3}\)).
</div>

<div class="example">
In \(\mathbb{R}^3\) for a convex body \(K\):

\[
\mathrm{Vol}_3(K + \varepsilon \mathbb{B}^3) = V + S\varepsilon + M\varepsilon^2 + \frac{4\pi}{3}\varepsilon^3,
\]
where \(V\) is the volume, \(S\) the surface area, and \(M = \int_{\partial K} H \,d\sigma\) is the integrated mean curvature (the mean width up to a constant). This is Steiner's original formula for 3D convex bodies.
</div>

## 4.2 Mixed Volumes

The Steiner formula motivates a multilinear generalization. For convex bodies \(K_1, \ldots, K_m\) and non-negative scalars \(t_1, \ldots, t_m\), the volume \(\mathrm{Vol}_n(t_1 K_1 + \cdots + t_m K_m)\) is a polynomial in \(t_1, \ldots, t_m\) of degree \(n\).

<div class="remark">
<strong>Why mixed volumes are the "right" multilinear extension.</strong> The Steiner formula tells us that volume, as a function of a single convex body \(K\) (measuring how it grows when we add a small ball), is already a polynomial. The natural next question is: if we mix together \(m\) different bodies with weights \(t_1, \ldots, t_m\) and look at the volume of the mixture \(t_1 K_1 + \cdots + t_m K_m\), what do we get? The answer — a polynomial in the \(t_i\) of degree \(n\) — is remarkable and non-obvious. The polynomial has \(\binom{m+n-1}{n}\) coefficients (the number of monomials of degree \(n\) in \(m\) variables), but by symmetrizing, we can write it as a sum over the symmetric multilinear coefficients \(V(K_{i_1}, \ldots, K_{i_n})\).

Mixed volumes thus form a multilinear algebra for convex bodies: they assign to any \(n\)-tuple of convex bodies a single non-negative real number that varies multilinearly. This is analogous to how the determinant is a multilinear function of \(n\) vectors in \(\mathbb{R}^n\). Indeed, for line segments \(K_i = [0, v_i]\), the mixed volume \(V(K_1, \ldots, K_n) = |\det(v_1, \ldots, v_n)| / n!\) — the mixed volume of segments is (up to a constant) the absolute value of the determinant of their direction vectors.
</div>

<div class="definition">
<strong>Mixed volume.</strong> The <em>mixed volume</em> \(V(K_1, \ldots, K_n)\) of \(n\) convex bodies is the unique symmetric multilinear coefficient in the polynomial expansion:

\[
\mathrm{Vol}_n(t_1 K_1 + \cdots + t_m K_m) = \sum_{i_1, \ldots, i_n = 1}^m t_{i_1} \cdots t_{i_n} V(K_{i_1}, \ldots, K_{i_n}).
\]
</div>

<div class="remark">
For the case \(m = 2\), \(K_1 = K\), \(K_2 = \mathbb{B}^n\):

\[
\mathrm{Vol}_n(tK + s\mathbb{B}^n) = \sum_{k=0}^n \binom{n}{k} t^{n-k} s^k V(K, \ldots, K, \mathbb{B}^n, \ldots, \mathbb{B}^n),
\]
where the mixed volume \(V(\underbrace{K, \ldots, K}_{n-k}, \underbrace{\mathbb{B}^n, \ldots, \mathbb{B}^n}_{k})\) equals \(W_k(K)/\binom{n}{k}\) up to normalization. Thus mixed volumes simultaneously generalize all quermassintegrals.
</div>

<div class="example">
<strong>Worked Example: Computing mixed volumes for the square and the disk in \(\mathbb{R}^2\).</strong>

Let \(K_1 = [-1,1]^2\) (unit square, area 4) and \(K_2 = \mathbb{B}^2\) (unit disk, area \(\pi\)). In \(\mathbb{R}^2\), the mixed volume expansion gives:

\[
\mathrm{Vol}_2(t K_1 + s K_2) = t^2 V(K_1, K_1) + 2ts \, V(K_1, K_2) + s^2 V(K_2, K_2).
\]
Here \(V(K_1, K_1) = \mathrm{Area}(K_1) = 4\), \(V(K_2, K_2) = \mathrm{Area}(\mathbb{B}^2) = \pi\), and \(V(K_1, K_2)\) is the mixed area. By the formula \(V(K, L) = \frac{1}{2}\left(\mathrm{Area}(K+L) - \mathrm{Area}(K) - \mathrm{Area}(L)\right)\), we use \(K_1 + K_2 = [-1,1]^2 + \mathbb{B}^2\) (the rounded square). Its area is \(4 + 4\pi/4 \cdot 4 + \pi \cdot 1 = 4 + 4 + \pi\) — wait, more carefully: the rounded square has 4 flat sides each of length 2 at distance 1 from the center, and 4 quarter-circles of radius 1. Area \(= 2 \times 2 \times 4 \text{ (rectangle core)} + \pi \times 1^2 \text{ (disk)} = 4 + \pi\) for the unit ball part. Actually: \(\mathrm{Area}([-1,1]^2 + \mathbb{B}^2) = 4 + \mathrm{perimeter of } [-1,1]^2 + \pi = 4 + 8 + \pi\). So \(V(K_1, K_2) = \frac{1}{2}(4 + 8 + \pi - 4 - \pi) = \frac{8}{2} = 4\). Geometrically, the mixed area of a convex body and the disk equals half its perimeter — a beautiful connection between mixed volumes and surface area.
</div>

<div class="example">
<strong>Worked Example: Mixed volumes for the unit ball and a segment.</strong> Let \(K_1 = \mathbb{B}^n\) and \(K_2 = [0, e_1]\) (the unit segment in the \(x_1\)-direction). Then \(t \mathbb{B}^n + s [0, e_1]\) is the "cylindrical capsule" — two hemiballs of radius \(t\) capped on a cylinder of length \(s\). In \(\mathbb{R}^3\), \(\mathrm{Vol}_3(t \mathbb{B}^3 + s [0, e_1]) = \frac{4}{3}\pi t^3 + \pi t^2 s\). So \(V(\mathbb{B}^3, \mathbb{B}^3, \mathbb{B}^3) = \frac{4\pi}{3}\), \(V(\mathbb{B}^3, \mathbb{B}^3, [0,e_1]) = \frac{\pi}{3}\) (matching \(\pi t^2 s = 3 \binom{3}{1} \cdot \frac{1}{3} \cdot V(\mathbb{B}, \mathbb{B}, [0,e_1]) \cdot t^2 s\)), and \(V(\mathbb{B}^3, [0,e_1], [0,e_1]) = V([0,e_1],[0,e_1],[0,e_1]) = 0\) (since the segment has zero volume).
</div>

<div class="theorem">
<strong>Alexandrov–Fenchel Inequalities.</strong> For convex bodies \(K_1, \ldots, K_n\) in \(\mathbb{R}^n\),

\[
V(K_1, K_2, K_3, \ldots, K_n)^2 \geq V(K_1, K_1, K_3, \ldots, K_n) \cdot V(K_2, K_2, K_3, \ldots, K_n).
\]
</div>

The Alexandrov–Fenchel inequalities are deep generalizations of the Brunn–Minkowski inequality and have profound combinatorial consequences (including log-concavity of the sequence of mixed volumes).

<div class="remark">
<strong>Log-concavity of mixed volumes.</strong> A sequence \((a_0, a_1, \ldots, a_n)\) is log-concave if \(a_k^2 \geq a_{k-1} a_{k+1}\) for all \(k\). The Alexandrov–Fenchel inequalities imply that the sequence \(\left(V(\underbrace{K, \ldots, K}_{n-k}, \underbrace{L, \ldots, L}_k)\right)_{k=0}^n\) is log-concave for any convex bodies \(K\) and \(L\). This has a celebrated application to the theory of matroids: the characteristic polynomial of a matroid is log-concave (a theorem proved by June Huh and collaborators using algebraic geometry, inspired by the Alexandrov–Fenchel inequalities).
</div>

## 4.2b The Mixed Volume Formula for Polytopes

For polytopes, mixed volumes have an explicit combinatorial formula. Let \(P\) and \(Q\) be polytopes in \(\mathbb{R}^n\). The mixed volume \(V(P, Q, \ldots, Q)\) (with \(P\) appearing once and \(Q\) appearing \(n-1\) times) is related to the "boundary interaction" between \(P\) and \(Q\).

<div class="example">
<strong>Mixed volumes in the plane (\(n=2\)).</strong> For two convex polygons \(P\) and \(Q\) in \(\mathbb{R}^2\):

\[
\mathrm{Area}(tP + sQ) = t^2 \mathrm{Area}(P) + 2ts \cdot V(P,Q) + s^2 \mathrm{Area}(Q).
\]
The mixed area \(V(P,Q)\) has a beautiful formula: if \(P\) has edges with outer unit normals \(u_1, \ldots, u_m\) and edge lengths \(\ell_1, \ldots, \ell_m\), and \(Q\) has support function \(h_Q\), then:

\[
2V(P,Q) = \sum_{i=1}^m h_Q(u_i) \cdot \ell_i.
\]
This formula says: the mixed area is obtained by taking each edge of \(P\) (with length \(\ell_i\) and outward normal \(u_i\)) and multiplying by how far \(Q\) extends in that direction (\(h_Q(u_i)\)), then summing. It is the "shadow" of \(Q\) in the directions of the edges of \(P\), weighted by edge length.

For \(P = Q = \mathbb{B}^2\): the "edges" are infinitesimal arcs, and the formula becomes \(2V(\mathbb{B}^2, \mathbb{B}^2) = \int_{\mathbb{S}^1} h_{\mathbb{B}^2}(u) \,d\sigma(u) = \int_{\mathbb{S}^1} 1\, d\sigma = 2\pi = 2 \cdot \mathrm{Area}(\mathbb{B}^2) = 2\pi\). Good, consistent.

For \(P\) a rectangle \([0,a] \times [0,b]\) and \(Q = \mathbb{B}^2\): the rectangle has four edges with outward normals \(e_1, -e_1, e_2, -e_2\) and lengths \(b, b, a, a\). The support function of \(\mathbb{B}^2\) is \(h = 1\) (constant on unit vectors). So \(2V(P, Q) = 1 \cdot b + 1 \cdot b + 1 \cdot a + 1 \cdot a = 2(a+b)\), giving \(V(P, \mathbb{B}^2) = a+b = \frac{1}{2}\mathrm{perimeter}(P)\). This confirms the general formula: \(V(K, \mathbb{B}^2) = \frac{1}{2}\mathrm{perimeter}(K)\) in the plane.
</div>

<div class="example">
<strong>Mixed volumes in \(\mathbb{R}^3\): the Steiner formula revisited.</strong> For a convex body \(K\) in \(\mathbb{R}^3\) and the unit ball \(B = \mathbb{B}^3\):

\[
\mathrm{Vol}_3(K + \varepsilon B) = V(K,K,K) + 3\varepsilon V(K,K,B) + 3\varepsilon^2 V(K,B,B) + \varepsilon^3 V(B,B,B).
\]
The coefficients are:
<ul>
<li>\(V(K,K,K) = \mathrm{Vol}(K)\) — the volume of \(K\).</li>
<li>\(3V(K,K,B) = \mathrm{Surface Area}(K)\) — so \(V(K,K,B) = S(K)/3\).</li>
<li>\(3V(K,B,B) = 2M(K)\) where \(M(K) = \int_{\partial K} H\,dA\) is the mean width integral — so \(V(K,B,B) = 2M(K)/3\).</li>
<li>\(V(B,B,B) = \mathrm{Vol}(B) = \frac{4\pi}{3}\omega_3\).</li>
</ul>
For a sphere \(K = r\mathbb{B}^3\): \(V(K,K,K) = \frac{4\pi}{3}r^3\), \(V(K,K,B) = \frac{4\pi}{3}r^2\) (so surface area \(= 4\pi r^2\)), \(V(K,B,B) = \frac{4\pi}{3}r\), and \(V(B,B,B) = \frac{4\pi}{3}\). The Steiner formula gives \(\mathrm{Vol}((r+\varepsilon)\mathbb{B}^3) = \frac{4\pi}{3}(r+\varepsilon)^3 = \frac{4\pi}{3}(r^3 + 3r^2\varepsilon + 3r\varepsilon^2 + \varepsilon^3)\), confirming all the mixed volume formulas for the ball.
</div>

## 4.3 Symmetrizations

A symmetrization is a procedure that replaces a convex body by a more symmetric one while preserving or improving certain geometric quantities.

<div class="definition">
<strong>Steiner symmetrization.</strong> Given a convex body \(K \subset \mathbb{R}^n\) and a unit vector \(u\), the <em>Steiner symmetrization</em> \(S_u(K)\) of \(K\) with respect to the hyperplane \(u^\perp\) is obtained by replacing each chord of \(K\) parallel to \(u\) with the chord of the same length centered on \(u^\perp\). Formally, for each \(x \in u^\perp\),

\[
S_u(K) \cap (x + \mathbb{R}u) = \text{segment centered at } x \text{ of length } \ell(x),
\]
where \(\ell(x) = \mathcal{H}^1(K \cap (x + \mathbb{R}u))\) is the length of the chord.
</div>

<div class="remark">
<strong>Intuition for Steiner symmetrization.</strong> Imagine projecting a shadow of \(K\) onto the hyperplane \(u^\perp\). For each point \(x\) in the shadow, the slice \(K \cap (x + \mathbb{R}u)\) is a line segment. Steiner symmetrization keeps the length of each such segment but centers it symmetrically around \(u^\perp\). The resulting body is symmetric about \(u^\perp\). Crucially, volume is preserved (we are only translating slices, not rescaling them), but the body becomes "more round."
</div>

<div class="theorem">
<strong>Properties of Steiner Symmetrization.</strong>
<ol>
<li>\(S_u(K)\) is a convex body.</li>
<li>\(\mathrm{Vol}_n(S_u(K)) = \mathrm{Vol}_n(K)\) (volume is preserved).</li>
<li>The diameter satisfies \(\mathrm{diam}(S_u(K)) \leq \mathrm{diam}(K)\).</li>
<li>The surface area does not increase: \(\mathrm{Vol}_{n-1}(\partial S_u(K)) \leq \mathrm{Vol}_{n-1}(\partial K)\).</li>
<li>Repeated Steiner symmetrizations in appropriately chosen directions converge (in Hausdorff metric) to a ball.</li>
</ol>
</div>

<div class="proof">
<em>Convexity of \(S_u(K)\) (proof of property 1).</em> Take two points \(p, q \in S_u(K)\) and write \(p = p_0 + su\) and \(q = q_0 + tu\) where \(p_0, q_0 \in u^\perp\). By definition of Steiner symmetrization, for any \(x_0 \in u^\perp\) and \(r \in [-\ell(x_0)/2, \ell(x_0)/2]\), the point \(x_0 + ru\) belongs to \(S_u(K)\). Consider the point \(\lambda p + (1-\lambda) q = \lambda p_0 + (1-\lambda) q_0 + (\lambda s + (1-\lambda)t) u\) for \(\lambda \in [0,1]\). Let \(x_\lambda = \lambda p_0 + (1-\lambda)q_0 \in u^\perp\) (by convexity of \(u^\perp\)). The original body \(K\) is convex, so the set \(\{r : x_\lambda + ru \in K\}\) contains \(\lambda [a(p_0), b(p_0)] + (1-\lambda)[a(q_0), b(q_0)]\) where \([a(x), b(x)]\) is the interval of the original chord before centering. The length of this set is at least \(\lambda \ell(p_0) + (1-\lambda)\ell(q_0) \geq 0\) by the Brunn–Minkowski inequality in 1D, and it follows that \(\ell(x_\lambda) \geq \lambda \ell(p_0) + (1-\lambda)\ell(q_0)\). In particular, \(|\lambda s + (1-\lambda) t| \leq \ell(x_\lambda)/2\), so the convex combination lies in \(S_u(K)\).
</div>

<div class="definition">
<strong>Schwarz symmetrization.</strong> Given a convex body \(K \subset \mathbb{R}^n\) and a linear subspace \(L\), the <em>Schwarz symmetrization</em> with respect to \(L\) replaces each fiber \(K \cap (x + L^\perp)\) (for \(x \in L\)) with a ball in \(x + L^\perp\) of the same \((\dim L^\perp)\)-dimensional volume, centered at \(x\).
</div>

<div class="remark">
<strong>Steiner vs. Schwarz symmetrization.</strong> Both symmetrizations preserve volume and increase the "roundness" of the body. Steiner symmetrization (replacing segments by centered segments) makes the body symmetric about a hyperplane. Schwarz symmetrization (replacing cross-sections by centered balls) makes the body rotationally symmetric about a line. Schwarz symmetrization appears naturally in the proof of the isoperimetric inequality: any body can be made rotationally symmetric without increasing its surface area, and then the isoperimetric inequality for rotationally symmetric bodies reduces to an ODE problem.
</div>

## 4.4 The Brunn–Minkowski Inequality

The Brunn–Minkowski inequality is the central inequality of convex geometry, and arguably the single deepest theorem in the subject. Minkowski discovered it around 1887 in the context of mixed volumes; Brunn had proved the concavity of cross-sectional volumes slightly earlier. Together their work revealed that volume behaves "like a linear function" when \(1/n\)-th powers are taken — a profound geometric-analytic statement that encodes the isoperimetric inequality, the AM–GM inequality, log-concavity of measures, and much more.

The inequality has the form of a **concavity statement**: the function \(t \mapsto \mathrm{Vol}((1-t)A + tB)^{1/n}\) is concave. This is what makes convex bodies "well-behaved" under mixing: as you interpolate between two bodies, the volume (properly normalized) does not drop below the linear interpolation of the endpoint volumes. The normalization \(1/n\) is forced by homogeneity — it is the unique power that makes the inequality scale-invariant.

The inequality has been called "the backbone of convex geometry" (by Schneider) and "the most important inequality in geometry" (by numerous authors). It implies:

- The **isoperimetric inequality** (ball minimizes surface area for given volume) — Section 4.5.
- **Brunn's theorem** on log-concavity of cross-sectional volumes — Section 5.3.
- The **Prékopa–Leindler inequality** (or is equivalent to it) — Section 5.2.
- The **Shannon entropy power inequality** via the Lieb–Sobolev connection.
- **AM–GM** as a special case in dimension 1.

The Brunn–Minkowski inequality is the central inequality of convex geometry. It quantifies the relationship between volumes of convex bodies and their Minkowski combinations. Its importance is difficult to overstate: it implies the isoperimetric inequality, log-concavity of the volume of cross-sections, and serves as the geometric foundation for entropy inequalities, the Prékopa–Leindler inequality, and optimal transport.

<div class="theorem">
<strong>Brunn–Minkowski Inequality.</strong> For nonempty compact sets \(A, B \subseteq \mathbb{R}^n\):

\[
\mathrm{Vol}_n(A + B)^{1/n} \geq \mathrm{Vol}_n(A)^{1/n} + \mathrm{Vol}_n(B)^{1/n}.
\]
Equivalently, for \(t \in \left[0, 1\right]\):

\[
\mathrm{Vol}_n((1-t)A + tB)^{1/n} \geq (1-t)\mathrm{Vol}_n(A)^{1/n} + t\mathrm{Vol}_n(B)^{1/n}.
\]
Equality holds if and only if \(A\) and \(B\) are homothetic convex bodies (one is a scaled translate of the other).
</div>

<div class="remark">
<strong>Geometric interpretation.</strong> The Brunn–Minkowski inequality says that the function \(t \mapsto \mathrm{Vol}_n((1-t)A + tB)^{1/n}\) is concave on \([0,1]\). In other words, the \(n\)-th root of volume is a concave function of the interpolation parameter. This is the multidimensional generalization of the obvious fact that interpolating between two intervals on the real line gives a length that varies linearly (and hence concavely).

The \(1/n\) power is the right normalization: it makes the inequality dimensionally homogeneous (scaling \(A\) by \(\lambda\) multiplies the left side by \(\lambda\) and the right side by \(\lambda\) as well). If we used volume directly instead of its \(n\)-th root, the inequality would fail for non-homothetic sets.
</div>

<div class="proof">
We sketch the classical proof via the one-dimensional Brunn–Minkowski inequality and induction on dimension.

<em>Step 1.</em> In dimension 1, for non-empty intervals \(A = \left[a_1, a_2\right]\) and \(B = \left[b_1, b_2\right]\), the Minkowski sum is \(A + B = \left[a_1 + b_1, a_2 + b_2\right]\), so \(|A + B| = |A| + |B|\), confirming equality.

<em>Step 2.</em> For boxes (rectangular parallelepipeds) \(A\) and \(B\) in \(\mathbb{R}^n\), write \(A = \prod_{i=1}^n \left[0, a_i\right]\) and \(B = \prod_{i=1}^n \left[0, b_i\right]\). Then

\[
\mathrm{Vol}(A + B) = \prod_i (a_i + b_i).
\]
By the AM–GM inequality applied to \(\prod_i \frac{a_i}{a_i + b_i} \leq \left(\frac{1}{n}\sum_i \frac{a_i}{a_i+b_i}\right)^n\), one shows \(\prod_i (a_i + b_i) \geq \left(\prod_i a_i^{1/n} + \prod_i b_i^{1/n}\right)^n\), giving the Brunn–Minkowski inequality for boxes.

<em>Step 3.</em> For finite unions of boxes and then by approximation for arbitrary compact sets, one uses induction on the number of boxes via a "bisection" argument: any compact set can be approximated by finite unions of boxes, and the inequality is preserved in the limit by the continuity of the volume functional.

<em>Step 4.</em> Equality analysis shows that equality forces \(A/\mathrm{Vol}(A)^{1/n}\) and \(B/\mathrm{Vol}(B)^{1/n}\) to be translates of each other, i.e., \(A\) and \(B\) are homothetic.
</div>

<div class="proof">
<em>Alternative proof for convex bodies: the Hadwiger–Ohmann approach.</em> This elegant argument applies when \(A\) and \(B\) are convex bodies and gives a clean induction on dimension.

We prove \(\mathrm{Vol}_n(A + B)^{1/n} \geq \mathrm{Vol}_n(A)^{1/n} + \mathrm{Vol}_n(B)^{1/n}\).

By homogeneity, we may normalize so that \(\mathrm{Vol}_n(A) = \mathrm{Vol}_n(B) = 1\) and show \(\mathrm{Vol}_n(A+B) \geq 2^n\). (If the normalized result holds, the general result follows by scaling.) Actually, it is cleaner to prove the equivalent form: for \(t \in [0,1]\), \(\mathrm{Vol}_n((1-t)A + tB) \geq 1\), when \(\mathrm{Vol}(A) = \mathrm{Vol}(B) = 1\). This is equivalent by the substitution \(C = (1-t)A + tB\).

The Hadwiger–Ohmann proof uses the following bisection idea. By translating \(A\) and \(B\), we may assume a hyperplane \(H = \{x_n = 0\}\) bisects both \(A\) and \(B\) simultaneously (a single hyperplane can bisect any two bodies by the ham sandwich theorem; for the Brunn–Minkowski proof we use a simpler version — choose \(H\) so that \(\mathrm{Vol}(A \cap \{x_n \geq 0\}) = \frac{1}{2}\mathrm{Vol}(A)\), then translate \(B\) along the \(x_n\)-axis so the same hyperplane bisects \(B\) as well).

Now \(A = A^+ \cup A^-\) (positive and negative halves) and \(B = B^+ \cup B^-\). Since \(A^+ + B^+ \subseteq (A+B)^+\) and \(A^- + B^- \subseteq (A+B)^-\) (where the superscripts denote the half-spaces), and \((A+B)^+\) and \((A+B)^-\) are disjoint:

\[
\mathrm{Vol}_n(A+B) \geq \mathrm{Vol}_n(A^+ + B^+) + \mathrm{Vol}_n(A^- + B^-).
\]
Applying the inductive hypothesis (dimension \(n-1\) applied to the cross-sections, or alternatively induction on the bisection depth) to each half, and using \(\mathrm{Vol}(A^\pm) = \frac{1}{2}\mathrm{Vol}(A)\) and \(\mathrm{Vol}(B^\pm) = \frac{1}{2}\mathrm{Vol}(B)\), one obtains the inequality by a clean induction. The details require careful bookkeeping of the half-space volumes but the idea is transparent: each bisection step reduces to smaller bodies, and the inequality propagates upward.
</div>

<div class="remark">
<strong>The 1D case as the foundation.</strong> The entire proof ultimately rests on the one-dimensional case: for compact sets \(A, B \subset \mathbb{R}\), \(|A + B| \geq |A| + |B|\). This is because if \(A \subseteq [a_1, a_2]\) and \(B \subseteq [b_1, b_2]\), then \(A + B \subseteq [a_1+b_1, a_2+b_2]\), but in fact: for any \(x \in A\) and \(y \in B\), \(x + y \in A+B\). Since \(A\) and \(B\) are at fixed locations (say \(A = [0, |A|]\) and \(B = [|A|, |A|+|B|]\) by translation, so they are disjoint on the number line), the Minkowski sum \(A+B\) has length \(|A|+|B|\) (it spans from \(0+|A|\) to \(|A|+|A|+|B|\), a length of \(|A|+|B|\)). Actually more directly: translate so \(\max A = \min B\); then \(A + B \supseteq A \cup B\) after re-centering, and \(|A \cup B| = |A| + |B|\) since they're disjoint. But the simplest 1D statement is: \(|A+B| \geq |A|+|B|\) with equality iff \(A\) and \(B\) are both intervals (connected). This is the entire 1D inequality.
</div>

<div class="example">
<strong>Worked Example: Brunn–Minkowski for a triangle and a square.</strong> Let \(A\) be the unit equilateral triangle in \(\mathbb{R}^2\) (area \(\frac{\sqrt{3}}{4}\)) and \(B = [-0.5, 0.5]^2\) be the unit square (area 1). By Brunn–Minkowski:

\[
\mathrm{Area}(A + B)^{1/2} \geq \mathrm{Area}(A)^{1/2} + \mathrm{Area}(B)^{1/2} = \left(\frac{\sqrt{3}}{4}\right)^{1/2} + 1 \approx 0.659 + 1 = 1.659.
\]
So \(\mathrm{Area}(A + B) \geq 2.75\). The Minkowski sum \(A + B\) is a hexagon with rounded corners (each vertex of the triangle rounded by a square corner), and its actual area can be computed to be larger than 2.75, confirming the inequality.
</div>

<div class="remark">
<strong>Connections to entropy.</strong> The Brunn–Minkowski inequality has an information-theoretic analogue: Shannon's entropy power inequality states that for independent random vectors \(X\) and \(Y\) in \(\mathbb{R}^n\),

\[
e^{2h(X+Y)/n} \geq e^{2h(X)/n} + e^{2h(Y)/n},
\]
where \(h(\cdot)\) denotes differential entropy. This is structurally identical to Brunn–Minkowski, with volume replaced by \(e^h\) (the "entropy power"). The analogy is not coincidental: there is a precise relationship via the Gaussian distributions (where the entropy power equals the volume of the ball of the same covariance).
</div>

## 4.4b Equality Cases in Brunn–Minkowski

The equality conditions in the Brunn–Minkowski inequality are as important as the inequality itself.

<div class="theorem">
<strong>Equality in Brunn–Minkowski.</strong> For compact sets \(A, B \subset \mathbb{R}^n\) with \(\mathrm{Vol}(A), \mathrm{Vol}(B) > 0\):

\[
\mathrm{Vol}(A+B)^{1/n} = \mathrm{Vol}(A)^{1/n} + \mathrm{Vol}(B)^{1/n}
\]
if and only if \(A\) and \(B\) are homothetic convex bodies: there exist a convex body \(K\), a scalar \(\lambda > 0\), and vectors \(a, b\) such that \(A = \lambda K + a\) and \(B = K + b\) (or the other way, with \(B = \mu K + b\) and \(A = K + a\)).
</div>

<div class="remark">
<strong>Why the equality condition is non-trivial.</strong> The equality condition rules out many natural cases:
<ul>
<li>A cube \(A = [-1,1]^3\) and a ball \(B = \mathbb{B}^3\) are NOT homothetic (one is polyhedral, one is smooth). So the inequality is strict for this pair.</li>
<li>A cube \(A = [-1,1]^3\) and a rescaled cube \(B = [-r,r]^3\) ARE homothetic (both are scaled copies of the same convex body). So equality holds.</li>
<li>Two simplices of different shapes (one equilateral, one right-angled) in \(\mathbb{R}^2\) are NOT homothetic unless they have the same proportions. Equality fails for most pairs of simplices.</li>
</ul>
The equality condition characterizes the "extremal pairs" for the Brunn–Minkowski inequality — the pairs for which the inequality is tightest. In an optimization context, if you want to find the pair \((A, B)\) that makes the Brunn–Minkowski inequality binding, you must take \(A\) and \(B\) to be scaled copies of the same convex body.

In the isoperimetric inequality (which follows from Brunn–Minkowski), the equality condition corresponds to the ball being the unique extremal shape — the body that saturates the isoperimetric inequality is the ball, and the equality in Brunn–Minkowski (with \(B = \varepsilon\mathbb{B}^n\)) becomes tight only when \(A\) is itself a ball.
</div>

<div class="example">
<strong>Brunn–Minkowski with intervals.</strong> In \(\mathbb{R}^1\), for compact sets \(A = [a_1, a_2]\) and \(B = [b_1, b_2]\), \(A+B = [a_1+b_1, a_2+b_2]\), so \(|A+B| = (a_2+b_2)-(a_1+b_1) = |A|+|B|\) — equality always. This confirms: in 1D, all intervals are homothetic (they are all scaled translates of \([0,1]\)), so the Brunn–Minkowski inequality is always equality for intervals.

Now take \(A = \{0\} \cup \{1\} = \{0,1\}\) (two points, a non-convex set) and \(B = [0,1]\). Then \(A+B = [0,1] \cup [1,2] = [0,2]\), so \(|A+B| = 2 > 1 + 1 = |A| + |B|\)... but wait: \(|A| = 0\) (two points have measure zero). The inequality gives \(|A+B|^1 \geq |A|^1 + |B|^1 = 0 + 1 = 1\), and indeed \(|A+B| = 2 \geq 1\). But since \(A\) is not a convex body (it has no interior), the equality condition doesn't apply.
</div>

## 4.5 Isoperimetric and Isodiametric Inequalities

<div class="theorem">
<strong>Isoperimetric Inequality.</strong> Among all compact sets in \(\mathbb{R}^n\) with given volume, the ball has the least surface area. Equivalently, if \(K \subset \mathbb{R}^n\) is a convex body and \(\mathbb{B}^n\) is the unit ball with \(\omega_n = \mathrm{Vol}_n(\mathbb{B}^n)\) and \(\sigma_{n-1} = \mathrm{Vol}_{n-1}(\partial \mathbb{B}^n) = n \omega_n\), then:

\[
\frac{\mathrm{Vol}_{n-1}(\partial K)^n}{\mathrm{Vol}_n(K)^{n-1}} \geq \frac{\sigma_{n-1}^n}{\omega_n^{n-1}} = n^n \omega_n.
\]
Equivalently, \(\mathrm{Vol}_{n-1}(\partial K) \geq n \omega_n^{1/n} \cdot \mathrm{Vol}_n(K)^{(n-1)/n}\), with equality if and only if \(K\) is a ball.
</div>

<div class="proof">
The isoperimetric inequality follows from the Brunn–Minkowski inequality by taking \(A = K\), \(B = \varepsilon \mathbb{B}^n\), and differentiating the Steiner formula at \(\varepsilon = 0\). Specifically, the Steiner formula gives:

\[
\mathrm{Vol}_n(K + \varepsilon \mathbb{B}^n) = \mathrm{Vol}_n(K) + \varepsilon \mathrm{Vol}_{n-1}(\partial K) + O(\varepsilon^2).
\]
The Brunn–Minkowski inequality gives:

\[
\mathrm{Vol}_n(K + \varepsilon \mathbb{B}^n)^{1/n} \geq \mathrm{Vol}_n(K)^{1/n} + \varepsilon \omega_n^{1/n}.
\]
Expanding both sides to first order in \(\varepsilon\) and comparing coefficients yields the isoperimetric inequality.

Let us carry out the comparison in detail. Let \(V = \mathrm{Vol}_n(K)\) and \(S = \mathrm{Vol}_{n-1}(\partial K)\). The Steiner formula gives \(\mathrm{Vol}_n(K + \varepsilon \mathbb{B}^n) = V + S\varepsilon + O(\varepsilon^2)\). Taking \(n\)-th roots:

\[
\mathrm{Vol}_n(K + \varepsilon \mathbb{B}^n)^{1/n} = V^{1/n} \left(1 + \frac{S\varepsilon}{V} + O(\varepsilon^2)\right)^{1/n} = V^{1/n} + \frac{S \varepsilon}{n V^{(n-1)/n}} + O(\varepsilon^2).
\]
Brunn–Minkowski gives \(\mathrm{Vol}(K + \varepsilon B^n)^{1/n} \geq V^{1/n} + \varepsilon \omega_n^{1/n}\). Comparing the coefficients of \(\varepsilon\):

\[
\frac{S}{n V^{(n-1)/n}} \geq \omega_n^{1/n}.
\]
Rearranging: \(S \geq n \omega_n^{1/n} V^{(n-1)/n}\). This is the isoperimetric inequality. Squaring (or raising to power \(n\)) and using \(n^n \omega_n = \sigma_{n-1}^n / \omega_n^{n-1}\) (from the relation \(\sigma_{n-1} = n\omega_n\)):

\[
S^n \geq n^n \omega_n V^{n-1} = \frac{\sigma_{n-1}^n}{\omega_n^{n-1}} V^{n-1}.
\]
Equality holds iff equality holds in Brunn–Minkowski, which requires \(K\) and \(\varepsilon\mathbb{B}^n\) to be homothetic — i.e., \(K\) is itself a ball.
</div>

<div class="remark">
<strong>Historical context.</strong> The isoperimetric problem is one of the oldest in mathematics: which curve of given length encloses the most area? In \(\mathbb{R}^2\), the answer is the circle. The problem was solved rigorously by Schwarz in 1884 (using his symmetrization) and by Minkowski using the Steiner formula approach. The modern Brunn–Minkowski approach unifies both methods.
</div>

<div class="example">
<strong>Worked Example: Isoperimetric ratio for the cube vs. the ball.</strong> In \(\mathbb{R}^3\), compare the unit cube \([0,1]^3\) (volume 1, surface area 6) with the ball \(B_r\) of the same volume (\(r = (3/4\pi)^{1/3} \approx 0.620\), surface area \(4\pi r^2 \approx 4.836\)). Indeed the ball has smaller surface area than the cube (4.836 vs. 6), confirming the isoperimetric inequality. More precisely, the isoperimetric ratio \(S^3/V^2\) equals \(6^3/1^2 = 216\) for the cube and \((4\pi r^2)^3 / (\frac{4}{3}\pi r^3)^2 = 36\pi \approx 113.1\) for the ball. The cube's ratio exceeds the ball's, confirming it is "less round."
</div>

<div class="theorem">
<strong>Isodiametric Inequality.</strong> Among all compact sets in \(\mathbb{R}^n\) with diameter at most \(d\), the ball of diameter \(d\) has the greatest volume:

\[
\mathrm{Vol}_n(K) \leq \omega_n \left(\frac{\mathrm{diam}(K)}{2}\right)^n.
\]
</div>

<div class="proof">
By Steiner symmetrization, the volume does not decrease (actually is preserved) while the diameter does not increase. By repeatedly symmetrizing in all coordinate directions and passing to a limit, \(K\) converges to a ball of the same volume but smaller or equal diameter. This shows the ball maximizes volume for given diameter.
</div>

---

# Chapter 5: Functional Inequalities

Convexity has deep implications for functions and measures, not just sets. The study of log-concave functions and measures is one of the most active areas of modern probability theory and analysis, with applications ranging from random sampling algorithms (the ball-walk, the logistic diffusion) to central limit theorems for convex bodies (the KLS conjecture).

## 5.0 Motivation: Why Log-Concavity?

Log-concavity occupies a central place in modern analysis and probability for the following reason: it is the natural class of functions and measures that are "close to Gaussian" while not requiring any specific parametric form. The Gaussian distribution is log-concave (with \(\log f(x) = -\|x\|^2/2\) concave), as are all uniform distributions on convex bodies, all exponential family distributions with concave log-partition functions, and many combinatorial sequences.

The fundamental theorem motivating the study of log-concave measures is:

<div class="theorem">
<strong>Prékopa–Leindler (functional Brunn–Minkowski).</strong> Log-concave measures are closed under marginals, i.e., projections. Equivalently, the class of log-concave measures on \(\mathbb{R}^n\) is closed under the operation of integrating out variables.
</div>

This is the content of Prékopa's theorem (Section 5.2). Its significance: the Gaussian measure is log-concave, and the class of measures with properties similar to the Gaussian is exactly the log-concave class. Every theorem about Gaussians (concentration, CLT, entropy bounds) has a generalization to log-concave measures — and those generalizations often require the Brunn–Minkowski/Prékopa–Leindler framework.

## 5.1 Log-Concave Functions and Measures

<div class="definition">
<strong>Log-concave function.</strong> A non-negative measurable function \(f : \mathbb{R}^n \to \left[0, \infty\right)\) is <em>log-concave</em> if for all \(x, y\) and \(t \in \left[0, 1\right]\):

\[
f((1-t)x + ty) \geq f(x)^{1-t} f(y)^t.
\]
Equivalently, \(\log f\) is concave (where we set \(\log 0 = -\infty\)). A Borel measure \(\mu\) on \(\mathbb{R}^n\) is <em>log-concave</em> if for all nonempty compact sets \(A, B\) and \(t \in \left[0, 1\right]\):

\[
\mu((1-t)A + tB) \geq \mu(A)^{1-t} \mu(B)^t.
\]
</div>

<div class="remark">
<strong>Why log-concavity is natural.</strong> Log-concavity is precisely the condition that ensures the convexity of level sets (since \(\{f \geq c\} = \{-\log f \leq -\log c\}\) is a sublevel set of the convex function \(-\log f\), hence convex). Log-concave functions arise naturally in probability (Gaussian densities, uniform distributions on convex bodies, the Beta distribution), in combinatorics (binomial coefficients, Stirling numbers, characteristic polynomials of matroids), and in statistical physics (partition functions at high temperature).

The class of log-concave measures is the natural class for proving concentration of measure, isoperimetric inequalities, and central limit theorems. The Bobkov–Madiman inequality, the KLS conjecture (now nearly resolved), and the central limit theorem for convex bodies all concern log-concave measures.
</div>

<div class="example">
<strong>Examples of log-concave functions.</strong>
<ul>
<li>The standard Gaussian \(f(x) = e^{-\|x\|^2/2}\) is log-concave: \(\log f(x) = -\|x\|^2/2\), which is strictly concave.</li>
<li>The uniform distribution \(f = \mathbf{1}_C\) on a convex set \(C\) is log-concave: for \(x, y \in C\), any convex combination \((1-t)x + ty \in C\) as well, so \(f\) takes value 1 at the convex combination, satisfying the inequality.</li>
<li>Products of log-concave functions are log-concave: if \(f\) and \(g\) are log-concave, so is \(fg\) (take logarithms).</li>
<li>The function \(f(x) = e^{-\|x\|}\) (Laplace distribution) is log-concave. The function \(e^{-|x|^p}\) is log-concave for \(p \geq 1\) and log-convex for \(p \leq 1\).</li>
<li>The binomial coefficient \(\binom{n}{k}\) as a function of \(k\) is log-concave: \(\binom{n}{k}^2 \geq \binom{n}{k-1}\binom{n}{k+1}\) (the sequence rises then falls, always with log-concavity).</li>
</ul>
</div>

<div class="theorem">
<strong>Prékopa's Theorem.</strong> If \(f : \mathbb{R}^{n+m} \to \left[0, \infty\right)\) is log-concave, then its marginal

\[
g(x) = \int_{\mathbb{R}^m} f(x, y) \, dy
\]
is log-concave on \(\mathbb{R}^n\).
</div>

<div class="remark">
<strong>Significance of Prékopa's theorem.</strong> This theorem says that "projecting out variables preserves log-concavity." As an immediate corollary: if \(K \subset \mathbb{R}^n\) is a convex body and \(K_t = \{x \in \mathbb{R}^{n-1} : (x, t) \in K\}\) are the cross-sections, then the function \(t \mapsto \mathrm{Vol}_{n-1}(K_t)\) is log-concave. This is Brunn's theorem! The proof comes from applying Prékopa's theorem to the indicator function \(\mathbf{1}_K\), which is log-concave (as the indicator of a convex set).
</div>

## 5.2 The Prékopa–Leindler Inequality

The Prékopa–Leindler inequality is a functional version of the Brunn–Minkowski inequality. It is in some sense more general and can be used to derive Brunn–Minkowski as a corollary.

<div class="theorem">
<strong>Prékopa–Leindler Inequality.</strong> Let \(t \in (0, 1)\) and let \(f, g, h : \mathbb{R}^n \to \left[0, \infty\right)\) be measurable functions satisfying

\[
h((1-t)x + ty) \geq f(x)^{1-t} g(y)^t \quad \text{for all } x, y \in \mathbb{R}^n.
\]
Then:

\[
\int_{\mathbb{R}^n} h \geq \left(\int_{\mathbb{R}^n} f\right)^{1-t} \left(\int_{\mathbb{R}^n} g\right)^t.
\]
</div>

<div class="remark">
<strong>How Brunn–Minkowski follows.</strong> Take \(f = \mathbf{1}_A\), \(g = \mathbf{1}_B\), and \(h = \mathbf{1}_{(1-t)A + tB}\). The hypothesis \(h((1-t)x+ty) \geq f(x)^{1-t} g(y)^t\) is satisfied: if \(x \in A\) and \(y \in B\), then \((1-t)x + ty \in (1-t)A + tB\). The Prékopa–Leindler inequality then gives \(\mathrm{Vol}_n((1-t)A + tB) \geq \mathrm{Vol}_n(A)^{1-t} \mathrm{Vol}_n(B)^t\), which (by AM-GM) implies \(\mathrm{Vol}_n((1-t)A+tB)^{1/n} \geq (1-t)\mathrm{Vol}(A)^{1/n} + t\mathrm{Vol}(B)^{1/n}\). So Prékopa–Leindler is strictly stronger than Brunn–Minkowski.
</div>

<div class="proof">
We prove the one-dimensional case; the general case follows by induction using Fubini.

<em>One-dimensional case.</em> For \(n = 1\), let \(F(s) = |\{x : f(x) > s\}|\) and \(G(s) = |\{y : g(y) > s\}|\) denote the distribution functions (here \(|\cdot|\) is Lebesgue measure). For any level \(s\), set \(A_s = \{x : f(x) > s\}\) and \(B_s = \{y : g(y) > s\}\). By hypothesis on \(h\), if \(f(x) > s\) and \(g(y) > s\), then \(h((1-t)x + ty) > s\) (since \(f(x)^{1-t} g(y)^t > s\)). Thus \((1-t)A_s + tB_s \subseteq \{z : h(z) > s\}\), and the one-dimensional Brunn–Minkowski inequality gives:

\[
|\{z : h(z) > s\}| \geq (1-t)|A_s| + t|B_s| \geq (1-t)F(s) + tG(s).
\]
Integrating over \(s \geq 0\) (using the layer-cake formula \(\int f = \int_0^\infty F(s)\,ds\)):

\[
\int h \geq (1-t)\int f + t\int g.
\]
But the arithmetic-geometric mean inequality gives \((1-t)\alpha + t\beta \geq \alpha^{1-t}\beta^t\), completing the one-dimensional proof.

The \(n\)-dimensional case proceeds by applying Fubini iteratively: apply the 1D case to the innermost integral variable, then Prékopa's theorem ensures the resulting function in the remaining variables still satisfies the hypothesis, allowing induction.
</div>

## 5.2b Prékopa–Leindler: A Second Proof and Deeper Understanding

The Prékopa–Leindler inequality has a beautiful "transportation" interpretation that connects it to optimal transport theory.

<div class="remark">
<strong>The displacement interpolation perspective.</strong> The Prékopa–Leindler inequality can be understood via optimal transport. Given measures \(\mu\) and \(\nu\) on \(\mathbb{R}^n\) (with densities \(f\) and \(g\)), the "interpolated measure" at time \(t\) is the pushforward of the coupling \(\pi\) (optimal transport plan) under the map \((x,y) \mapsto (1-t)x + ty\). If \(\mu\) and \(\nu\) are log-concave, the interpolated measures are also log-concave, and their densities \(h_t\) satisfy the Prékopa–Leindler condition.

This transport perspective was developed by McCann (1997) and gives a clean proof of Brunn–Minkowski: the volume of the interpolated body \((1-t)A + tB\) is the "mass" of the interpolated measure between uniform distributions on \(A\) and \(B\). Convexity of the displacement path (guaranteed by the convexity of \(A\) and \(B\)) then directly gives the Brunn–Minkowski inequality.
</div>

<div class="example">
<strong>Worked Example: Prékopa–Leindler for Gaussians.</strong> Let \(f(x) = e^{-\|x\|^2/2}\) and \(g(y) = e^{-\|y\|^2/2}\) (unnormalized Gaussians). For \(t = 1/2\), the Prékopa–Leindler condition requires: \(h(z) \geq f(x)^{1/2} g(y)^{1/2} = e^{-(\|x\|^2+\|y\|^2)/4}\) whenever \(z = (x+y)/2\).

Take \(h(z) = e^{-\|z\|^2/2}\). Then \(h((x+y)/2) = e^{-\|x+y\|^2/8}\). We need \(e^{-\|x+y\|^2/8} \geq e^{-(\|x\|^2+\|y\|^2)/4}\), i.e., \(\|x+y\|^2/8 \leq (\|x\|^2+\|y\|^2)/4\), i.e., \(\|x+y\|^2 \leq 2(\|x\|^2+\|y\|^2)\). This is the parallelogram law! Indeed \(\|x+y\|^2 + \|x-y\|^2 = 2\|x\|^2 + 2\|y\|^2\), so \(\|x+y\|^2 = 2(\|x\|^2+\|y\|^2) - \|x-y\|^2 \leq 2(\|x\|^2+\|y\|^2)\). The Prékopa–Leindler inequality then gives:

\[
\int e^{-\|z\|^2/2}\,dz \geq \left(\int e^{-\|x\|^2/2}\,dx\right)^{1/2} \left(\int e^{-\|y\|^2/2}\,dy\right)^{1/2}.
\]
Since all three integrals equal \((2\pi)^{n/2}\), we get \((2\pi)^{n/2} \geq (2\pi)^{n/2}\) — equality, as expected since the Gaussian is self-similar under interpolation.
</div>

## 5.3 Applications: Log-Concavity of Volumes

<div class="theorem">
<strong>Brunn's Principle (Brunn's Concavity Theorem).</strong> Let \(K \subset \mathbb{R}^n\) be a convex body and let \(K_t = K \cap \{x_n = t\}\) be the cross-section at height \(t\). Then the function \(t \mapsto \mathrm{Vol}_{n-1}(K_t)^{1/(n-1)}\) is concave on its support.
</div>

<div class="proof">
For \(s < t < u\), write \(t = (1-\lambda)s + \lambda u\) where \(\lambda = (t-s)/(u-s)\). Any point in \(K_t\) can be written as a convex combination \((1-\lambda)x + \lambda y\) where \(x \in K_s\) and \(y \in K_u\) (by the convexity of \(K\)), so \(K_t \supseteq (1-\lambda)K_s + \lambda K_u\). Applying the Brunn–Minkowski inequality in \(\mathbb{R}^{n-1}\):

\[
\mathrm{Vol}_{n-1}(K_t)^{1/(n-1)} \geq \mathrm{Vol}_{n-1}((1-\lambda)K_s + \lambda K_u)^{1/(n-1)} \geq (1-\lambda)\mathrm{Vol}_{n-1}(K_s)^{1/(n-1)} + \lambda\mathrm{Vol}_{n-1}(K_u)^{1/(n-1)}.
\]
</div>

<div class="remark">
Brunn's principle is historically the precursor to the Brunn–Minkowski inequality: Brunn proved the concavity of cross-sectional volumes, and Minkowski recognized that this implied a volumetric inequality.
</div>

<div class="example">
<strong>Worked Example: Brunn's principle for the unit ball.</strong> The unit ball \(\mathbb{B}^3\) has cross-sections at height \(t \in [-1,1]\) equal to disks of radius \(\sqrt{1-t^2}\) and area \(\pi(1-t^2)\). So \(\mathrm{Area}(K_t)^{1/2} = \sqrt{\pi} \cdot \sqrt{1-t^2}\). Is this concave in \(t\)? Its second derivative is \(-\sqrt{\pi}(1-t^2)^{-1/2}[(1-t^2)^{-1}t^2 + 1] / (1-t^2) < 0\)... actually let us just check: at \(t = 0\), the value is \(\sqrt{\pi}\); at \(t = \pm 1\), it is 0; the midpoint between \(t=-1\) and \(t=1\) is \(t=0\), and \(\sqrt{\pi} \geq \frac{1}{2}(0 + 0) = 0\). Concavity holds — and in fact the function \(t \mapsto \sqrt{\pi(1-t^2)}\) is strictly concave on \([-1,1]\), with a maximum at \(t=0\) (the equatorial disk), as expected.
</div>

---

# Chapter 6: Convex Functions

Convex functions are to convex geometry what linear maps are to linear algebra — they are the morphisms that respect the structure. Every convex set determines a characteristic function (the indicator), a gauge function (Minkowski functional), and a support function, all of which are convex or concave. Conversely, every convex function determines a convex set (its epigraph). This chapter develops the theory of convex functions in parallel with the geometric theory of convex sets.

## 6.0 Motivation: Why Convex Functions?

Convex functions are to analysis what linear functions are to algebra — they are the simplest, most well-behaved class of functions, and understanding them completely is already a rich and non-trivial task. The key properties that make convex functions tractable are:

**No false minima.** Every local minimum of a convex function is a global minimum. This is the property that makes convex optimization problems tractable: any algorithm that finds a local minimum has in fact found the global minimum. For non-convex functions, gradient descent can get stuck in local minima and the problem is generally NP-hard.

**Unique minima for strictly convex functions.** A strictly convex function has at most one minimizer. This ensures well-posedness of optimization problems: the solution (if it exists) is unique, and numerical algorithms converge to a definite answer.

**Epigraph characterization.** A function is convex if and only if its epigraph is a convex set. This converts functional analysis questions (about functions) into geometric questions (about sets), allowing all the machinery of convex geometry to apply.

**Subgradients everywhere.** At every point in the interior of its domain, a convex function has at least one subgradient — a slope of a supporting hyperplane to the epigraph. This provides a "calculus" for non-smooth functions, enabling optimization algorithms even when the function has kinks.

**Jensen's inequality.** Convex functions satisfy \(f(\mathbb{E}[X]) \leq \mathbb{E}[f(X)]\), an inequality with countless applications in probability, information theory, and analysis.

The higher-dimensional setting introduces new phenomena not present in 1D: convex functions on \(\mathbb{R}^n\) can fail to be differentiable on sets of positive measure (unlike 1D where non-differentiability is at most countable), and the subdifferential is a compact convex set rather than just an interval.

## 6.1 Definitions and Basic Properties

<div class="definition">
<strong>Convex function.</strong> A function \(f : C \to \mathbb{R}\) defined on a convex set \(C \subseteq \mathbb{R}^n\) is <em>convex</em> if for all \(x, y \in C\) and \(t \in \left[0, 1\right]\):

\[
f((1-t)x + ty) \leq (1-t)f(x) + tf(y).
\]
The function is <em>strictly convex</em> if the inequality is strict whenever \(x \neq y\) and \(t \in (0, 1)\). A function \(f\) is <em>concave</em> if \(-f\) is convex.
</div>

<div class="definition">
<strong>Epigraph characterization.</strong> The <em>epigraph</em> of \(f : C \to \mathbb{R} \cup \{+\infty\}\) is

\[
\mathrm{epi}(f) = \{(x, r) \in C \times \mathbb{R} : f(x) \leq r\}.
\]
A function \(f\) (possibly extended real-valued) is convex if and only if \(\mathrm{epi}(f)\) is a convex subset of \(C \times \mathbb{R}\).
</div>

This epigraph characterization is powerful: it converts questions about convex functions into questions about convex sets, allowing all the geometric machinery to apply.

<div class="remark">
<strong>Why the epigraph characterization is useful.</strong> The epigraph of a convex function is a convex set that "lives above the graph." The supporting hyperplane theorem applied to the epigraph says: at any point \((x_0, f(x_0))\) on the graph, there is a hyperplane in \(C \times \mathbb{R}\) supporting the epigraph from below. The slope of such a hyperplane is exactly a subgradient of \(f\) at \(x_0\). So the entire theory of subgradients follows geometrically from the epigraph picture.

Dually, the sublevel set \(\{x : f(x) \leq c\}\) is a convex set for every \(c\) (since it is the projection of the convex set \(\mathrm{epi}(f) \cap \{r \leq c\}\)). This is why convex programs (minimizing a convex function over a convex set) have convex feasible regions.
</div>

<div class="example">
Common convex functions on \(\mathbb{R}^n\):
<ul>
<li>Any linear function \(f(x) = \langle a, x \rangle + b\).</li>
<li>Any norm \(f(x) = \|x\|\).</li>
<li>The function \(f(x) = \|x\|^2\) (strictly convex).</li>
<li>The negative entropy \(f(x) = \sum_i x_i \log x_i\) on the positive orthant.</li>
<li>The log-sum-exp function \(f(x_1, \ldots, x_n) = \log\left(\sum_i e^{x_i}\right)\).</li>
</ul>
</div>

<div class="example">
<strong>Worked Example: Verifying convexity via the epigraph.</strong> Consider \(f(x) = x^2\) on \(\mathbb{R}\). Its epigraph is the set \(\{(x, r) : x^2 \leq r\}\), which is the closed region above the parabola \(r = x^2\). Is this convex? Take two points \((x_1, r_1)\) and \((x_2, r_2)\) with \(r_i \geq x_i^2\). Their convex combination is \(((1-t)x_1 + tx_2, (1-t)r_1 + tr_2)\). We need \((1-t)r_1 + tr_2 \geq ((1-t)x_1 + tx_2)^2\). Expanding: \((1-t)r_1 + tr_2 \geq (1-t)x_1^2 + tx_2^2 \geq ((1-t)x_1 + tx_2)^2\), where the first inequality uses \(r_i \geq x_i^2\) and the second is the AM–GM/Cauchy–Schwarz inequality \((1-t)a^2 + tb^2 \geq ((1-t)a + tb)^2\) for \(t \in [0,1]\). This confirms the epigraph is convex.
</div>

<div class="example">
<strong>Operations preserving convexity.</strong>
<ul>
<li><em>Positive scaling:</em> If \(f\) is convex and \(\alpha \geq 0\), then \(\alpha f\) is convex.</li>
<li><em>Sum:</em> If \(f\) and \(g\) are convex, so is \(f + g\).</li>
<li><em>Maximum:</em> If \(f\) and \(g\) are convex, so is \(\max(f,g)\). More generally, the pointwise supremum of any family of convex functions is convex (even uncountable families).</li>
<li><em>Composition with affine:</em> If \(f\) is convex and \(A\) is a linear map and \(b\) is a vector, then \(x \mapsto f(Ax + b)\) is convex.</li>
<li><em>Composition with non-decreasing convex scalar function:</em> If \(f : \mathbb{R}^n \to \mathbb{R}\) is convex and \(g : \mathbb{R} \to \mathbb{R}\) is convex and non-decreasing, then \(g \circ f\) is convex.</li>
</ul>
</div>

## 6.1b Operations Preserving Convexity: A Complete Reference

The following lists all fundamental operations that preserve convexity of functions. These are the building blocks from which convex functions are constructed in practice.

<div class="theorem">
<strong>Operations preserving convexity of functions (complete list).</strong>
<ol>
<li><em>Non-negative linear combination:</em> \(\alpha f + \beta g\) is convex for \(\alpha, \beta \geq 0\).</li>
<li><em>Pointwise supremum (possibly uncountable):</em> \(\sup_\alpha f_\alpha\) is convex if each \(f_\alpha\) is convex. This is the key property for minimax problems.</li>
<li><em>Affine composition:</em> \(f(Ax + b)\) is convex if \(f\) is convex. In particular, restrictions to affine subspaces preserve convexity.</li>
<li><em>Perspective function:</em> \(g(x,t) = t f(x/t)\) for \(t > 0\) is convex if \(f\) is convex. The perspective operation connects convexity to projective geometry.</li>
<li><em>Infimal convolution:</em> \((f \Box g)(x) = \inf_y (f(y) + g(x-y))\) is convex if \(f\) and \(g\) are convex. This operation "smears" one function with another and is the convex analogue of Minkowski sum.</li>
<li><em>Partial minimization:</em> \(h(x) = \inf_y f(x,y)\) is convex in \(x\) if \(f(x,y)\) is jointly convex and the infimum is finite for all \(x\). This is the convex version of marginalizing out a variable.</li>
</ol>
</div>

## 6.2 Jensen's Inequality

<div class="theorem">
<strong>Jensen's Inequality.</strong> Let \(f : C \to \mathbb{R}\) be convex and \(X\) a random vector taking values in \(C\) with finite expectation. Then:

\[
f(\mathbb{E}\left[X\right]) \leq \mathbb{E}\left[f(X)\right].
\]
In the discrete setting with weights \(\lambda_i \geq 0\), \(\sum \lambda_i = 1\):

\[
f\!\left(\sum_{i=1}^k \lambda_i x_i\right) \leq \sum_{i=1}^k \lambda_i f(x_i).
\]
</div>

<div class="proof">
For the discrete case, proceed by induction on \(k\). The base case \(k = 1\) and \(k = 2\) are immediate from the definition of convexity. For the inductive step, write \(\sum_{i=1}^k \lambda_i x_i = (1-\lambda_k)\left(\sum_{i=1}^{k-1} \frac{\lambda_i}{1-\lambda_k} x_i\right) + \lambda_k x_k\). The inner sum has weights summing to 1. Applying the convexity definition and the inductive hypothesis:

\[
f\!\left(\sum_{i=1}^k \lambda_i x_i\right) \leq (1-\lambda_k) f\!\left(\sum_{i=1}^{k-1} \frac{\lambda_i}{1-\lambda_k} x_i\right) + \lambda_k f(x_k) \leq (1-\lambda_k) \sum_{i=1}^{k-1} \frac{\lambda_i}{1-\lambda_k} f(x_i) + \lambda_k f(x_k) = \sum_{i=1}^k \lambda_i f(x_i).
\]
</div>

<div class="remark">
Jensen's inequality has profound applications in probability theory (e.g., the convexity of \(e^x\) gives the AM–GM inequality), information theory (data processing inequality), and analysis. It also immediately gives the AM–GM inequality: for \(f(x) = -\log x\), Jensen gives \(-\log(\sum \lambda_i x_i) \leq -\sum \lambda_i \log x_i\), i.e., the weighted geometric mean does not exceed the weighted arithmetic mean.
</div>

<div class="example">
<strong>Worked Example: Jensen and information theory.</strong> Fix a discrete probability distribution \(p = (p_1, \ldots, p_n)\) with \(p_i > 0\) and \(\sum p_i = 1\). The Shannon entropy is \(H(p) = -\sum_i p_i \log p_i\). Applying Jensen's inequality to the concave function \(f(x) = -x \log x\) (or equivalently to \(\log x\) with weights \(p_i\)):

\[
H(p) = \sum_i p_i \cdot (-\log p_i) = \mathbb{E}[-\log p_i] \leq -\log \mathbb{E}[p_i] = -\log\!\left(\frac{1}{n} \cdot \sum_i p_i \cdot \frac{1}{p_i} \cdot p_i\right),
\]
hmm — more cleanly: by Jensen applied to the concave function \(\log\),

\[
H(p) = \sum_i p_i \log \frac{1}{p_i} \leq \log \sum_i p_i \cdot \frac{1}{p_i} = \log n,
\]
with equality iff all \(p_i = 1/n\) (the uniform distribution). This gives the maximum entropy principle: the uniform distribution maximizes entropy.
</div>

<div class="example">
<strong>Worked Example: AM-GM via Jensen.</strong> The function \(f(x) = -\log x\) is strictly convex on \((0,\infty)\) (since \(f''(x) = 1/x^2 > 0\)). By Jensen applied to the equal-weight discrete distribution on \(\{x_1, \ldots, x_n\}\):

\[
-\log\!\left(\frac{x_1 + \cdots + x_n}{n}\right) = f\!\left(\frac{1}{n}\sum x_i\right) \leq \frac{1}{n}\sum f(x_i) = \frac{1}{n}\sum(-\log x_i) = -\log(x_1 \cdots x_n)^{1/n}.
\]
Negating: \(\log\!\left(\frac{x_1 + \cdots + x_n}{n}\right) \geq \log(x_1 \cdots x_n)^{1/n}\), i.e., the arithmetic mean is at least the geometric mean.
</div>

<div class="example">
<strong>Worked Example: Jensen and the exponential — \(e^{\mathbb{E}[X]} \leq \mathbb{E}[e^X]\).</strong> The function \(f(x) = e^x\) is convex (its second derivative is \(e^x > 0\)). By Jensen:

\[
e^{\mathbb{E}[X]} = e^{f^{-1}(\mathbb{E}[e^X])} \leq \mathbb{E}[e^X],
\]
that is, \(e^{\mathbb{E}[X]} \leq \mathbb{E}[e^X]\). This inequality is fundamental in probability theory: it says the moment-generating function (MGF) \(\mathbb{E}[e^X]\) is always at least \(e^{\mathbb{E}[X]}\). Equality holds iff \(X\) is almost surely constant. In statistics, this implies that the maximum likelihood estimator (MLE) of the mean satisfies certain optimality properties.

More generally, for any convex \(g\), Jensen gives \(g(\mathbb{E}[X]) \leq \mathbb{E}[g(X)]\). Applying this with \(g(x) = x^2\) gives \((\mathbb{E}[X])^2 \leq \mathbb{E}[X^2]\), i.e., \(\mathrm{Var}(X) = \mathbb{E}[X^2] - (\mathbb{E}[X])^2 \geq 0\) — a tautology, but a useful consistency check. Applying with \(g = |\cdot|^p\) for \(p \geq 1\) gives the power-mean inequality \(|\mathbb{E}[X]|^p \leq \mathbb{E}[|X|^p]\).
</div>

## 6.3 Subdifferentials

For convex functions that need not be differentiable, the subdifferential generalizes the gradient.

<div class="definition">
<strong>Subgradient and subdifferential.</strong> Let \(f : \mathbb{R}^n \to \mathbb{R} \cup \{+\infty\}\) be convex. A vector \(v \in \mathbb{R}^n\) is a <em>subgradient</em> of \(f\) at a point \(x_0\) in the domain of \(f\) if

\[
f(x) \geq f(x_0) + \langle v, x - x_0 \rangle \quad \text{for all } x \in \mathbb{R}^n.
\]
The set of all subgradients at \(x_0\) is the <em>subdifferential</em> \(\partial f(x_0)\).
</div>

<div class="remark">
<strong>Geometric interpretation of the subdifferential.</strong> The condition \(f(x) \geq f(x_0) + \langle v, x - x_0 \rangle\) says that the affine function \(x \mapsto f(x_0) + \langle v, x - x_0 \rangle\) is a global affine minorant of \(f\) touching \(f\) at \(x_0\). In the epigraph picture, a subgradient \(v\) at \(x_0\) corresponds to a hyperplane supporting \(\mathrm{epi}(f)\) at the point \((x_0, f(x_0))\). The subdifferential is the set of all slopes of such supporting hyperplanes — the "normal cone" of the epigraph at the boundary point \((x_0, f(x_0))\).
</div>

<div class="theorem">
<strong>Properties of subdifferentials.</strong>
<ol>
<li>\(\partial f(x)\) is a nonempty, compact convex set for every \(x\) in the interior of the domain of \(f\).</li>
<li>If \(f\) is differentiable at \(x\), then \(\partial f(x) = \{\nabla f(x)\}\).</li>
<li>\(x^*\) is a global minimum of \(f\) if and only if \(0 \in \partial f(x^*)\).</li>
<li>The subdifferential map \(x \mapsto \partial f(x)\) is monotone: \(\langle v - w, x - y \rangle \geq 0\) whenever \(v \in \partial f(x)\) and \(w \in \partial f(y)\).</li>
</ol>
</div>

<div class="proof">
<em>Proof of nonemptiness (property 1).</em> Let \(x_0\) be in the interior of \(\mathrm{dom}(f)\). The point \((x_0, f(x_0))\) is a boundary point of \(\mathrm{epi}(f)\) (it is on the "lower boundary" of the epigraph). By the supporting hyperplane theorem, there exists a nonzero vector \((v, -\alpha) \in \mathbb{R}^n \times \mathbb{R}\) such that \(\langle (v, -\alpha), (x, r) - (x_0, f(x_0)) \rangle \leq 0\) for all \((x,r) \in \mathrm{epi}(f)\). This gives \(\langle v, x - x_0 \rangle - \alpha(r - f(x_0)) \leq 0\). Taking \(r \to \infty\) shows \(\alpha \geq 0\). If \(\alpha = 0\), then \(\langle v, x - x_0 \rangle \leq 0\) for all \(x \in \mathrm{dom}(f)\), which contradicts \(x_0\) being in the interior. So \(\alpha > 0\), and dividing by \(\alpha\) gives \(\frac{1}{\alpha}\langle v, x-x_0\rangle \leq r - f(x_0)\) for all \((x,r) \in \mathrm{epi}(f)\). Setting \(r = f(x)\): \(f(x) - f(x_0) \geq \langle v/\alpha, x - x_0\rangle\), so \(v/\alpha \in \partial f(x_0)\).

<em>Proof that \(0 \in \partial f(x^*)\) iff \(x^*\) is a global minimum.</em> By definition, \(0 \in \partial f(x^*)\) means \(f(x) \geq f(x^*) + \langle 0, x - x^* \rangle = f(x^*)\) for all \(x\), i.e., \(x^*\) is a global minimum.
</div>

<div class="example">
For \(f(x) = |x|\) on \(\mathbb{R}\):
<ul>
<li>\(\partial f(x) = \{\mathrm{sgn}(x)\} = \{1\}\) for \(x > 0\), and \(\{-1\}\) for \(x < 0\).</li>
<li>\(\partial f(0) = \left[-1, 1\right]\).</li>
</ul>
For \(f(x) = \|x\|\) on \(\mathbb{R}^n\): \(\partial f(x) = \{x/\|x\|\}\) for \(x \neq 0\), and \(\partial f(0) = \mathbb{B}^n\) (the unit ball).
</div>

<div class="example">
<strong>Worked Example: Subdifferential of the max function.</strong> Let \(f(x) = \max(0, x)^2\) on \(\mathbb{R}\) (the "hinge squared"). For \(x > 0\): \(f(x) = x^2\), smooth, so \(\partial f(x) = \{2x\}\). For \(x < 0\): \(f(x) = 0\), smooth, so \(\partial f(x) = \{0\}\). At \(x = 0\): any subgradient \(v\) must satisfy \(f(x) \geq v \cdot x\) for all \(x\). For \(x < 0\): \(0 \geq vx\), so \(v \geq 0\). For \(x > 0\): \(x^2 \geq vx\), so \(v \leq x\) for all \(x > 0\), giving \(v \leq 0\). So \(v = 0\) and \(\partial f(0) = \{0\}\). The function is differentiable at 0 with derivative 0, consistent with property 2.
</div>

<div class="example">
<strong>Worked Example: Computing subdifferentials of the \(\ell^1\) norm in \(\mathbb{R}^2\).</strong> Let \(f(x_1, x_2) = |x_1| + |x_2|\). At a general point \((x_1, x_2)\) with both components nonzero, \(f\) is smooth and \(\nabla f = (\mathrm{sgn}(x_1), \mathrm{sgn}(x_2))\). On the axis \(x_1 = 0\) with \(x_2 \neq 0\): \(f\) is smooth in the \(x_2\)-direction (\(\partial f/\partial x_2 = \mathrm{sgn}(x_2)\)) but has a kink in the \(x_1\)-direction. A subgradient \((g_1, g_2)\) must satisfy \(|x_1| + |x_2| \geq |x_1'| + |x_2'| + g_1(x_1'-0) + g_2(x_2'-x_2)\) for all \((x_1', x_2')\). This forces \(g_2 = \mathrm{sgn}(x_2)\) and \(|g_1| \leq 1\). So \(\partial f(0, x_2) = [-1,1] \times \{\mathrm{sgn}(x_2)\}\).

At the origin \((0,0)\): any subgradient \((g_1, g_2)\) must satisfy \(|x_1| + |x_2| \geq g_1 x_1 + g_2 x_2\) for all \((x_1, x_2)\). This holds for all \((x_1,x_2)\) iff \(|g_1| + |g_2| \leq 1\), i.e., \((g_1, g_2)\) is in the unit \(\ell^1\) ball: \(\partial f(0,0) = \{(g_1,g_2) : |g_1| + |g_2| \leq 1\} = \mathcal{C}_2\). The subdifferential at the "most non-smooth" point (the origin) is the polar body of the unit ball of the norm itself — a precise duality between the function and its conjugate.
</div>

<div class="remark">
<strong>First-order optimality and subgradients — the key principle.</strong> The most important property of subdifferentials for optimization is this: \(x^*\) is a global minimizer of a convex function \(f\) if and only if \(0 \in \partial f(x^*)\). This is both simple and profound.

In one direction: if \(0 \in \partial f(x^*)\), then by definition, \(f(x) \geq f(x^*) + \langle 0, x - x^* \rangle = f(x^*)\) for all \(x\) — so \(x^*\) is a global minimum. In the other direction: if \(x^*\) is a global minimum, then for any direction \(d\), the directional derivative \(f'(x^*; d) = \lim_{t \downarrow 0} (f(x^* + td) - f(x^*))/t \geq 0\) (since \(x^*\) is a minimum). For a convex function, this means the zero vector is a subgradient.

This principle unifies all of calculus optimization:
- <strong>Smooth unconstrained:</strong> \(0 = \nabla f(x^*)\) (since \(\partial f = \{\nabla f\}\) when differentiable).
- <strong>Non-smooth unconstrained:</strong> \(0 \in \partial f(x^*)\), e.g., \(f(x) = |x|\) is minimized at \(x^* = 0\) since \(0 \in [-1,1] = \partial|x|(0)\).
- <strong>Constrained optimization:</strong> For \(\min f(x)\) subject to \(x \in C\), define \(f_C(x) = f(x) + \mathbf{1}_C(x)\) (adding \(+\infty\) outside \(C\)). Then \(0 \in \partial f_C(x^*) = \partial f(x^*) + N_C(x^*)\), where \(N_C(x^*)\) is the normal cone to \(C\) at \(x^*\). This is the generalized KKT condition.
</div>

<div class="remark">
<strong>Subdifferentials in optimization.</strong> The condition \(0 \in \partial f(x^*)\) generalizes the classical first-order optimality condition \(\nabla f(x^*) = 0\) to non-smooth functions. This is the basis of subgradient methods in optimization: at each step, pick any \(v_k \in \partial f(x_k)\) and update \(x_{k+1} = x_k - \alpha_k v_k\). Unlike gradient descent, the subgradient method does not decrease the objective at every step, but it converges to the minimum for appropriately chosen step sizes \(\alpha_k\).

In convex optimization, the KKT conditions for \(\min f(x) \text{ s.t. } g(x) \leq 0\) can be written as \(0 \in \partial f(x^*) + \lambda^* \partial g(x^*)\) (for optimal \(\lambda^* \geq 0\)), a direct generalization using subdifferentials.
</div>

## 6.4 Convexity and Differentiability

<div class="remark">
<strong>The regularity of convex functions: a hierarchy.</strong> Convex functions enjoy an automatically high degree of regularity, even without assumptions. The hierarchy is:
<ol>
<li><strong>Measurable \(\Rightarrow\) continuous</strong> (locally, on the interior of the domain). Unlike for general functions, a measurable convex function on an open convex set is automatically locally Lipschitz continuous. This is because convexity imposes a strong geometric constraint: the epigraph is a convex set, and the "sharp corners" that prevent continuity cannot exist in the interior.</li>
<li><strong>Continuous \(\Rightarrow\) locally Lipschitz</strong> (on compact subsets of the interior). For any compact subset \(C'\) of the interior of the domain, there is a Lipschitz constant \(L\) such that \(|f(x) - f(y)| \leq L\|x-y\|\) for \(x, y \in C'\).</li>
<li><strong>Locally Lipschitz \(\Rightarrow\) differentiable a.e.</strong> by Rademacher's theorem.</li>
<li><strong>Differentiable + convex \(\Rightarrow\) \(C^1\) on the interior</strong> (the gradient is continuous).</li>
<li><strong>Twice differentiable + convex \(\iff\) \(D^2 f \succeq 0\)</strong> everywhere.</li>
</ol>
Steps (1)–(2) are special to convex functions; steps (3)–(5) apply more generally. The key point is that convexity does automatic work: you get far more regularity "for free" than you would for a general function.
</div>

<div class="theorem">
<strong>Differentiability of convex functions.</strong> A convex function \(f : \mathbb{R}^n \to \mathbb{R}\) is locally Lipschitz continuous. Moreover, by Rademacher's theorem, \(f\) is differentiable almost everywhere. At points of differentiability, the gradient \(\nabla f\) is the unique subgradient.
</div>

<div class="remark">
<strong>Where can a convex function fail to be differentiable?</strong> In 1D, a convex function on \(\mathbb{R}\) is differentiable everywhere except possibly on a countable set (the "kinks"). The function \(|x|\) has a kink at \(x = 0\). In higher dimensions, the non-differentiability set can be more complex but is always a set of measure zero (by Rademacher's theorem). The extreme case is the function \(f(x) = \max(0, x_1, \ldots, x_n)\), which has a non-differentiability set of positive (hyper)surface measure (the boundary of the orthant where the max is achieved).
</div>

<div class="theorem">
<strong>Second-order characterization.</strong> A twice continuously differentiable function \(f : U \to \mathbb{R}\) (on an open convex domain \(U\)) is convex if and only if its Hessian \(D^2 f(x)\) is positive semidefinite for all \(x \in U\). It is strictly convex if the Hessian is positive definite everywhere.
</div>

<div class="remark">
The positive semidefiniteness of the Hessian is often the quickest way to verify convexity in practice. For example, \(f(x) = \|x\|^2\) has \(D^2 f = 2I\), which is positive definite. For a general quadratic \(f(x) = x^T A x + b^T x + c\), convexity holds if and only if \(A\) is positive semidefinite.
</div>

<div class="example">
<strong>Worked Example: Convexity of the log-sum-exp.</strong> Let \(f(x) = \log(\sum_{i=1}^n e^{x_i})\). We compute the Hessian. Let \(p_i = e^{x_i} / \sum_j e^{x_j}\) (the softmax). Then:

\[
\frac{\partial f}{\partial x_i} = p_i, \qquad \frac{\partial^2 f}{\partial x_i \partial x_j} = p_i(\delta_{ij} - p_j).
\]
The Hessian is \(D^2 f = \mathrm{diag}(p) - pp^T\). For any vector \(v\):

\[
v^T D^2 f \, v = \sum_i p_i v_i^2 - \left(\sum_i p_i v_i\right)^2 = \mathbb{E}[v_i^2] - (\mathbb{E}[v_i])^2 = \mathrm{Var}(v_i) \geq 0,
\]
where the expectation is over the distribution \(p\). So \(D^2 f \succeq 0\) everywhere, confirming that log-sum-exp is convex.
</div>

## 6.5 Convex Conjugates: Computations and Geometric Interpretation

The Legendre–Fenchel transform (treated in depth in Chapter 8) is already motivated by the subdifferential theory of convex functions. Here we develop the connection.

<div class="remark">
<strong>The Legendre transform as a "slope ↔ value" duality.</strong> For a strictly convex differentiable function \(f\), the Legendre transform can be computed by the classical Legendre procedure:
<ol>
<li>At each point \(x\), the gradient \(\nabla f(x) = y\) tells us the "slope" (direction of steepest ascent).</li>
<li>The Legendre transform \(f^*(y) = \langle x, y\rangle - f(x)\) where \(x = (\nabla f)^{-1}(y)\) is the point with slope \(y\).</li>
</ol>
For strictly convex \(f\), the gradient map \(x \mapsto \nabla f(x)\) is a bijection from \(\mathbb{R}^n\) to \(\mathbb{R}^n\), and the Legendre transform is the composition \(f^* = (\text{intercept function}) \circ (\nabla f)^{-1}\). The dual variable \(y\) is the slope, and \(f^*(y)\) is the negative \(y\)-intercept of the tangent line to the graph of \(f\) with slope \(y\).

This is exactly the classical Legendre transform from mechanics and thermodynamics. In thermodynamics, the internal energy \(U(S, V)\) (entropy, volume) is Legendre-transformed to the Helmholtz free energy \(F(T, V) = \sup_S(TS - U(S,V))\), where temperature \(T = \partial U/\partial S\) is the "slope" dual to entropy.
</div>

<div class="example">
<strong>Legendre transform of \(f(x) = x^p/p\).</strong> For \(p > 1\) and \(x \geq 0\):

\[
f^*(y) = \sup_{x \geq 0}(xy - x^p/p).
\]
Differentiating in \(x\): \(y - x^{p-1} = 0\), so \(x^* = y^{1/(p-1)} = y^{q/p}\) where \(q = p/(p-1)\) is the Hölder conjugate. Then:

\[
f^*(y) = y \cdot y^{q/p} - (y^{q/p})^p/p = y^{1+q/p} - y^q/p = y^q - y^q/p = y^q(1 - 1/p) = y^q/q.
\]
So \((x^p/p)^* = y^q/q\). This is the Hölder duality: the conjugate of \(x^p/p\) is \(y^q/q\). The Young–Fenchel inequality \(xy \leq x^p/p + y^q/q\) is exactly the statement that \(y \in \partial f(x) \iff x \in \partial f^*(y)\), and in this smooth case it becomes the classical Young inequality.
</div>

<div class="example">
<strong>Legendre transform and the entropy function.</strong> Consider \(f(p) = \sum_{i=1}^n p_i \log p_i\) on the probability simplex \(\Delta = \{p : p_i \geq 0, \sum p_i = 1\}\). This is the negative entropy (or KL divergence from the uniform measure). Its Legendre conjugate on \(\mathbb{R}^n\):

\[
f^*(\theta) = \sup_{p \in \Delta} \left(\sum_i \theta_i p_i - \sum_i p_i \log p_i\right) = \log \sum_i e^{\theta_i}.
\]
This is the log-partition function (or log-sum-exp)! The computation: maximizing \(\sum_i p_i(\theta_i - \log p_i - 1)\) over the simplex (with Lagrange multiplier for \(\sum p_i = 1\)) gives \(p_i^* = e^{\theta_i} / \sum_j e^{\theta_j}\) (the softmax), and substituting:

\[
f^*(\theta) = \sum_i \frac{e^{\theta_i}}{\sum_j e^{\theta_j}} \cdot \theta_i - \sum_i \frac{e^{\theta_i}}{\sum_j e^{\theta_j}} \log \frac{e^{\theta_i}}{\sum_j e^{\theta_j}} = \log \sum_j e^{\theta_j}.
\]
This is the fundamental duality in exponential family statistics: the negative entropy and the log-partition function are Legendre duals. The optimal \(p^* = \mathrm{softmax}(\theta)\) is the maximum entropy distribution with moment constraints \(\mathbb{E}_{p}[\phi_i] = \theta_i\).
</div>

---

# Chapter 7: Rearrangement Inequalities

Rearrangement inequalities concern the question: when is an integral \(\int fg\) maximized or minimized? The answer involves replacing \(f\) and \(g\) by their "rearrangements" — functions that have the same distribution but are sorted in the same or opposite order. This theory, developed by Hardy, Littlewood, and Pólya in the 1920s–30s and extended by many others, has deep connections to convexity, majorization, and the geometry of function spaces.

## 7.0 Motivation: What is a Rearrangement and Why Should We Care?

A "rearrangement" of a function is a way to restructure it to be "nicer" — typically more symmetric or more sorted — while preserving its distribution. The key insight is that many important functionals of a function (integrals, norms, energy) are not changed by rearrangement, or are improved by it. Rearrangement inequalities then say: the "nicest" rearrangement (the symmetric decreasing one) maximizes or minimizes various functionals.

The physical motivation: the symmetric decreasing rearrangement of a density concentrates mass toward the origin. Physical systems often minimize energy by concentrating mass (gravitational collapse, electron orbitals). So rearrangement inequalities describe the ground states of physical systems — they encode which configurations are energetically optimal.

The probabilistic motivation: if \(X\) and \(Y\) are random variables, the integral \(\int f(x) g(x)\, dx\) is maximized (for fixed marginal distributions of \(X\) and \(Y\)) when \(X\) and \(Y\) are "comonotone" — large values of \(X\) occur with large values of \(Y\). The Hardy–Littlewood inequality formalizes this: to maximize \(\mathbb{E}[f(X)g(X)]\), make \(f\) and \(g\) both decreasing (or both increasing) functions of \(x\).

## 7.1 Symmetric Decreasing Rearrangements

<div class="definition">
<strong>Symmetric decreasing rearrangement.</strong> For a measurable function \(f : \mathbb{R}^n \to \left[0, \infty\right)\) vanishing at infinity (i.e., all level sets \(\{f > t\}\) have finite measure), the <em>symmetric decreasing rearrangement</em> \(f^* : \mathbb{R}^n \to \left[0, \infty\right)\) is the unique function satisfying:
<ol>
<li>\(f^*\) is radially symmetric: \(f^*(x)\) depends only on \(\|x\|\).</li>
<li>\(f^*\) is non-increasing as a function of \(\|x\|\).</li>
<li>\(f^*\) is equimeasurable with \(f\): \(|\{f^* > t\}| = |\{f > t\}|\) for all \(t \geq 0\).</li>
</ol>
Concretely, \(f^*(x) = \int_0^\infty \mathbf{1}_{B(0,\, r_t)}(x)\,dt\) where \(r_t\) is the radius of the ball with volume \(|\{f > t\}|\), i.e., \(r_t = \left(\frac{|\{f>t\}|}{\omega_n}\right)^{1/n}\).
</div>

<div class="remark">
Equimeasurability means \(f\) and \(f^*\) have the same distribution function, hence \(\int \phi(f) = \int \phi(f^*)\) for any non-negative measurable \(\phi\). In particular, all \(L^p\) norms are preserved: \(\|f\|_{L^p} = \|f^*\|_{L^p}\).
</div>

<div class="example">
<strong>Worked Example: Rearrangement of a step function.</strong> Let \(f : \mathbb{R}^2 \to [0, \infty)\) be defined by \(f = 2 \cdot \mathbf{1}_{R_1} + 1 \cdot \mathbf{1}_{R_2}\) where \(R_1\) is a rectangle of area 4 and \(R_2\) is a rectangle of area 9 (disjoint from \(R_1\)). The level sets are \(\{f > 2\} = \emptyset\), \(\{f > 1\} = R_1 \cup R_2\) (area 13), \(\{f > 0\} = R_1 \cup R_2\) (same). Wait — \(\{f > 2\} = \emptyset\), \(\{1 < f \leq 2\} = R_1\) (area 4), \(\{0 < f \leq 1\} = R_2\) (area 9). The rearrangement \(f^*\) satisfies: for \(t \in (1, 2]\), \(\{f^* > t\}\) is a disk of area 4, so radius \(r_t = \sqrt{4/\pi} = 2/\sqrt{\pi}\). For \(t \in (0, 1]\), \(\{f^* > t\}\) is a disk of area 13, so radius \(\sqrt{13/\pi}\). Thus \(f^*(x) = 2 \cdot \mathbf{1}_{B(0, 2/\sqrt{\pi})} + 1 \cdot \mathbf{1}_{B(0, \sqrt{13/\pi}) \setminus B(0, 2/\sqrt{\pi})}\) — the original step function replaced by concentric annular disks of the same areas.
</div>

## 7.1b Rearrangements and Sobolev Inequalities

One of the most important applications of the symmetric decreasing rearrangement is to Sobolev inequalities — inequalities that bound the \(L^p\) norm of a function by the \(L^p\) norm of its gradient.

<div class="theorem">
<strong>Rearrangement decreases the Dirichlet energy.</strong> For a non-negative function \(f \in H^1(\mathbb{R}^n)\) (Sobolev space with one derivative in \(L^2\)):

\[
\int |\nabla f^*(x)|^2\,dx \leq \int |\nabla f(x)|^2\,dx.
\]
In other words, the symmetric decreasing rearrangement decreases (or preserves) the Dirichlet energy.
</div>

<div class="remark">
<strong>Consequence: Sobolev inequality is attained by radial functions.</strong> The Sobolev inequality \(\|f\|_{L^{2^*}} \leq C_n \|\nabla f\|_{L^2}\) (where \(2^* = 2n/(n-2)\) for \(n \geq 3\)) has equality iff \(f\) is a multiple of a Aubin–Talenti function \(f(x) = (1+\|x\|^2)^{-(n-2)/2}\) — a radially symmetric function. The proof: by rearrangement, the optimal function can be taken radial (rearrangement preserves \(L^p\) norms and decreases the Dirichlet energy, so the optimizer must be rearrangement-invariant, hence radial). Once radial, the Sobolev inequality reduces to a 1D problem that can be solved explicitly.

This pattern — reduce to a symmetric case by rearrangement, then solve — appears throughout the calculus of variations and PDE theory.
</div>

## 7.2 The Hardy–Littlewood Inequality

<div class="theorem">
<strong>Hardy–Littlewood Rearrangement Inequality.</strong> For non-negative measurable functions \(f\) and \(g\) on \(\mathbb{R}^n\) vanishing at infinity:

\[
\int_{\mathbb{R}^n} f(x) g(x) \, dx \leq \int_{\mathbb{R}^n} f^<em>(x) g^</em>(x) \, dx.
\]
Moreover, the inner product is minimized when one function is rearranged in the reverse order of the other.
</div>

<div class="proof">
Using the layer-cake representation \(f = \int_0^\infty \mathbf{1}_{\{f>s\}}\,ds\) and similarly for \(g\):

\[
\int f g = \int_0^\infty \int_0^\infty \left|\{f > s\} \cap \{g > t\}\right| ds\,dt.
\]
For each \(s, t > 0\), the sets \(A_s = \{f > s\}\) and \(B_t = \{g > t\}\) are rearranged to balls \(A_s^* = \{f^* > s\}\) and \(B_t^* = \{g^* > t\}\) with the same measures. Among all sets of given measure, two concentric balls have the largest overlap: \(|A_s \cap B_t| \leq |A_s^* \cap B_t^*|\). Integrating over \(s, t\) gives the inequality.
</div>

<div class="remark">
<strong>Intuition.</strong> The Hardy–Littlewood inequality says: to maximize \(\int fg\), align the large values of \(f\) with the large values of \(g\). Rearranging both to be decreasing functions of the radius (so large values are at the center) achieves this alignment. This is the continuous analogue of the discrete inequality: if \(a_1 \geq \cdots \geq a_n\) and \(b_1 \geq \cdots \geq b_n\), then \(\sum a_i b_i \geq \sum a_i b_{\sigma(i)}\) for any permutation \(\sigma\) (this is the rearrangement inequality for sequences).
</div>

<div class="example">
<strong>Application: The Riesz rearrangement inequality.</strong> For non-negative functions \(f, g, h\) on \(\mathbb{R}^n\):

\[
\int \int f(x) g(x-y) h(y) \, dx\, dy \leq \int \int f^<em>(x) g^</em>(x-y) h^*(y)\, dx\, dy.
\]
This says: the convolution integral is maximized when all three functions are replaced by their rearrangements. The Riesz inequality implies the Hardy–Littlewood inequality (take \(g = \delta_0\)) and many classical functional inequalities (Sobolev, Hardy–Littlewood–Sobolev).
</div>

## 7.3 Majorization and the Hardy–Littlewood–Pólya Theorem

<div class="definition">
<strong>Majorization.</strong> For vectors \(x, y \in \mathbb{R}^n\), write \(x_{[1]} \geq x_{[2]} \geq \cdots \geq x_{[n]}\) for the decreasing rearrangement of coordinates. We say \(x\) is <em>majorized</em> by \(y\) (written \(x \prec y\)) if

\[
\sum_{i=1}^k x_{[i]} \leq \sum_{i=1}^k y_{[i]} \quad \text{for all } k = 1, \ldots, n-1, \quad \text{and} \quad \sum_{i=1}^n x_i = \sum_{i=1}^n y_i.
\]
</div>

<div class="remark">
<strong>Intuition for majorization.</strong> Majorization captures the idea that \(y\) is "more spread out" (more unequal) than \(x\). For example, \((n-1, 1, 0, \ldots, 0)\) majorizes all vectors with the same sum — it is maximally concentrated in the first coordinate. The uniform vector \((\bar{x}, \bar{x}, \ldots, \bar{x})\) (where \(\bar{x} = \frac{1}{n}\sum x_i\)) is majorized by every vector with the same sum — it is maximally spread out. The statement "\(x\) is majorized by \(y\)" can be read as "\(x\) is more equal than \(y\)."
</div>

<div class="theorem">
<strong>Hardy–Littlewood–Pólya Theorem.</strong> For \(x, y \in \mathbb{R}^n\), the following are equivalent:
<ol>
<li>\(x \prec y\) (i.e., \(x\) is majorized by \(y\)).</li>
<li>\(x = Dy\) for some doubly stochastic matrix \(D\).</li>
<li>\(\sum_{i=1}^n \phi(x_i) \leq \sum_{i=1}^n \phi(y_i)\) for all convex functions \(\phi : \mathbb{R} \to \mathbb{R}\).</li>
</ol>
</div>

<div class="remark">
Majorization captures the notion that \(x\) is "more spread out" or "more uniform" than \(y\). Convex functions are precisely those that increase under spreading. The theorem is fundamental in optimization, statistics, and quantum information theory (where majorization appears as a necessary and sufficient condition for state convertibility under unitary operations).
</div>

## 7.4 The Birkhoff–von Neumann Theorem

<div class="theorem">
<strong>Birkhoff–von Neumann Theorem.</strong> The set of doubly stochastic \(n \times n\) matrices (those with non-negative entries and all row sums and column sums equal to 1) is a convex polytope. Its extreme points are precisely the permutation matrices.
</div>

<div class="proof">
Let \(\mathcal{D}_n\) denote the set of doubly stochastic matrices. It is clearly convex and compact (closed and bounded). Permutation matrices are doubly stochastic, and they are extreme (since they have only 0-1 entries, any convex combination with another matrix in \(\mathcal{D}_n\) must equal that matrix).

For the converse, take any doubly stochastic matrix \(D\) that is not a permutation matrix. By the Frobenius theorem (or Hall's marriage theorem applied to the bipartite graph of nonzero entries), there exists a permutation \(\sigma\) such that \(D_{i,\sigma(i)} > 0\) for all \(i\). Let \(\lambda = \min_i D_{i,\sigma(i)} > 0\). Then \(D' = (D - \lambda P_\sigma)/(1-\lambda)\) is again doubly stochastic, so \(D = \lambda P_\sigma + (1-\lambda) D'\). This decomposes \(D\) as a convex combination, showing it is not extreme. By induction, any doubly stochastic matrix is a convex combination of permutation matrices.
</div>

<div class="remark">
<strong>Connection to the Hardy–Littlewood–Pólya theorem.</strong> The Birkhoff–von Neumann theorem provides the equivalence (1) \(\Leftrightarrow\) (2) in the Hardy–Littlewood–Pólya theorem: if \(x = Dy\) for a doubly stochastic \(D\), then \(D = \sum_\sigma \lambda_\sigma P_\sigma\), so \(x = \sum_\sigma \lambda_\sigma P_\sigma y\) — a convex combination of permutations of \(y\). This directly shows that \(x\) is majorized by \(y\) (the sum conditions are satisfied because each permutation preserves partial sums up to rearrangement).
</div>

## 7.4b Applications of Majorization: Entropy and Quantum Mechanics

Majorization connects convexity, entropy, and the foundations of quantum mechanics in a unified framework.

<div class="remark">
<strong>Majorization and entropy.</strong> The Shannon entropy \(H(p) = -\sum_i p_i \log p_i\) is a Schur-concave function: if \(p \prec q\) (i.e., \(p\) is majorized by \(q\), meaning \(p\) is "more equal"), then \(H(p) \geq H(q)\). This is a direct consequence of the Hardy–Littlewood–Pólya theorem: \(H\) can be written as \(H(p) = -\sum_i \phi(p_i)\) with \(\phi(t) = t\log t\) convex, so \(p \prec q\) implies \(\sum \phi(p_i) \leq \sum \phi(q_i)\), i.e., \(H(p) \geq H(q)\).

The uniform distribution \(p^* = (1/n, \ldots, 1/n)\) satisfies \(p \prec p^*\) for all probability vectors \(p\) with \(\sum p_i = 1\), since \(p^*\) has all components equal (it is "maximally flat"). Therefore \(H(p) \leq H(p^*) = \log n\) for all probability distributions — the maximum entropy principle from Jensen's inequality (Section 6.2) is a special case of Schur-concavity.
</div>

<div class="remark">
<strong>Majorization in quantum mechanics: Nielsen's theorem.</strong> In quantum information theory, the state of a quantum system is described by a density matrix \(\rho\) (a positive semidefinite matrix with trace 1). The eigenvalues \(\lambda = (\lambda_1, \ldots, \lambda_n)\) of \(\rho\) form a probability vector. A quantum state \(\rho\) can be converted to another state \(\sigma\) by a unitary operation (i.e., reversible quantum operation) if and only if the eigenvalue vectors satisfy \(\lambda(\rho) = \lambda(\sigma)\). But for conversions by <strong>LOCC</strong> (local operations and classical communication) in bipartite systems, the condition is:

Nielsen's theorem (1999): A bipartite pure quantum state \(|\psi\rangle\) can be converted to \(|\phi\rangle\) by LOCC if and only if the Schmidt coefficient vector of \(|\psi\rangle\) is majorized by that of \(|\phi\rangle\). This is the quantum mechanical manifestation of majorization — and it is proved using the Birkhoff–von Neumann theorem (doubly stochastic matrices = convex combinations of permutations) applied to the density matrix algebra.
</div>

<div class="example">
<strong>Worked example: Majorization and mixing.</strong> Consider two distributions: \(p = (0.5, 0.3, 0.2)\) and \(q = (0.6, 0.3, 0.1)\). Is \(p \prec q\)?

Decreasing rearrangements: \(p_{[1]} = 0.5, p_{[2]} = 0.3, p_{[3]} = 0.2\) (already sorted); \(q_{[1]} = 0.6, q_{[2]} = 0.3, q_{[3]} = 0.1\).

Check: \(p_{[1]} = 0.5 \leq 0.6 = q_{[1]}\) ✓. \(p_{[1]}+p_{[2]} = 0.8 \leq 0.9 = q_{[1]}+q_{[2]}\) ✓. \(\sum p_i = \sum q_i = 1\) ✓. So \(p \prec q\). This means \(p\) is "more equal" than \(q\) — and indeed \(H(p) = -0.5\log0.5 - 0.3\log0.3 - 0.2\log0.2 \approx 1.485\) bits, while \(H(q) = -0.6\log0.6 - 0.3\log0.3 - 0.1\log0.1 \approx 1.417\) bits — confirming \(H(p) > H(q)\) as predicted by Schur-concavity of entropy.

By Hardy–Littlewood–Pólya, \(p = Dq\) for some doubly stochastic matrix \(D\). Equivalently, by Birkhoff, \(p\) is a convex combination of permutations of \(q\). One such combination: \(p = \frac{1}{6}(q_1, q_2, q_3) + \frac{1}{6}(q_1, q_3, q_2) + \frac{1}{6}(q_2, q_1, q_3) + \ldots\) (mixing over all permutations of \(q\) recovers a uniform distribution, not exactly \(p\) — but we can construct \(D\) explicitly from the majorization conditions).
</div>

## 7.5 The Krein–Milman Theorem

<div class="theorem">
<strong>Krein–Milman Theorem.</strong> Let \(V\) be a locally convex topological vector space and \(C \subseteq V\) a nonempty compact convex set. Then \(C\) is the closed convex hull of its extreme points:

\[
C = \overline{\mathrm{conv}}(\mathrm{ext}(C)).
\]
</div>

<div class="proof">
We give the proof for the finite-dimensional case \(V = \mathbb{R}^n\).

<em>Existence of extreme points.</em> Among all faces of \(C\) (intersections with supporting hyperplanes), choose a minimal face \(F\). Any point in the relative interior of \(F\) must be an extreme point: if \(p = (x+y)/2\) with \(x, y \in C\), then both \(x, y \in F\) (minimality), and since \(F\) is minimal, \(x = y = p\). So \(\mathrm{ext}(C) \neq \emptyset\).

<em>Density.</em> Suppose for contradiction that \(\overline{\mathrm{conv}}(\mathrm{ext}(C)) \subsetneq C\). Then there exists \(p \in C \setminus \overline{\mathrm{conv}}(\mathrm{ext}(C))\). By the separation theorem, there is a linear functional \(\ell\) such that \(\ell(p) > \max_{x \in \overline{\mathrm{conv}}(\mathrm{ext}(C))} \ell(x)\). But the maximum of \(\ell\) over the compact set \(C\) is attained at some face \(F'\) of \(C\), and every extreme point of \(F'\) is an extreme point of \(C\), hence lies in \(\overline{\mathrm{conv}}(\mathrm{ext}(C))\). This contradicts \(\ell(p) > \max \ell\) over \(C\).
</div>

<div class="remark">
The Krein–Milman theorem provides an integral representation: every point \(p\) of a compact convex set \(C\) can be written as a barycenter

\[
p = \int_{\mathrm{ext}(C)} x \, d\mu(x)
\]
for some probability measure \(\mu\) supported on \(\mathrm{ext}(C)\). This generalizes the fact that every point in a polytope is a convex combination of its vertices (Carathéodory's theorem). Choquet's theorem refines this to a canonical measure on the extreme points.
</div>

<div class="example">
<strong>Application: Extreme points of the unit ball in \(C([0,1])\).</strong> In infinite-dimensional spaces, the Krein–Milman theorem reveals surprising structure. The unit ball \(\mathcal{B}\) of the space \(C([0,1])\) of continuous functions on \([0,1]\) with the supremum norm: the extreme points of \(\mathcal{B}\) are precisely those functions \(f\) with \(|f(t)| = 1\) for all \(t \in [0,1]\). This is a much smaller set than the unit sphere. By Krein–Milman, the closed convex hull of these extreme points is the entire unit ball — a non-trivial fact about the geometry of the Banach space \(C([0,1])\).
</div>

## 7.6 Proximal Operators and Moreau Envelopes

The proximal operator is the key tool bridging convex analysis and algorithms. It provides a computationally tractable way to handle non-smooth convex functions.

<div class="definition">
<strong>Proximal operator.</strong> For a convex function \(f : \mathbb{R}^n \to \mathbb{R} \cup \{+\infty\}\) and parameter \(\lambda > 0\), the <em>proximal operator</em> is:

\[
\mathrm{prox}_{\lambda f}(x) = \arg\min_{z} \left(f(z) + \frac{1}{2\lambda}\|z - x\|^2\right).
\]
The <em>Moreau envelope</em> is the function:

\[
M_\lambda f(x) = \min_z \left(f(z) + \frac{1}{2\lambda}\|z - x\|^2\right) = f(\mathrm{prox}_{\lambda f}(x)) + \frac{1}{2\lambda}\|\mathrm{prox}_{\lambda f}(x) - x\|^2.
\]
</div>

<div class="remark">
<strong>The proximal operator as a "generalized projection."</strong> When \(f = \mathbf{1}_C\) (indicator of a convex set \(C\)), the proximal operator \(\mathrm{prox}_{\lambda f}(x) = \Pi_C(x)\) is the projection onto \(C\) (independent of \(\lambda\)). The proximal operator generalizes projection from sets to functions: it finds the "closest point" to \(x\) that also has small \(f\)-value.

The Moreau envelope \(M_\lambda f\) is always differentiable (even if \(f\) is not), with gradient:

\[
\nabla M_\lambda f(x) = \frac{1}{\lambda}(x - \mathrm{prox}_{\lambda f}(x)).
\]
Moreover, \(M_\lambda f(x) \nearrow f(x)\) as \(\lambda \searrow 0\) (the Moreau envelope approaches \(f\) from below). The Moreau envelope is thus a smooth approximation to \(f\), and the proximal operator provides a "step" in the direction of the approximation's gradient.
</div>

<div class="example">
<strong>Proximal operator of the \(\ell^1\) norm: soft thresholding.</strong> For \(f(x) = \|x\|_1 = \sum_i |x_i|\):

\[
\mathrm{prox}_{\lambda f}(x) = S_\lambda(x),
\]
where \(S_\lambda(x)_i = \mathrm{sgn}(x_i) \cdot \max(|x_i| - \lambda, 0)\) is the soft-thresholding operator. This is computed by solving \(\min_z (\|z\|_1 + \frac{1}{2\lambda}\|z-x\|^2)\), which decouples into \(n\) independent problems (one per coordinate): \(\min_{z_i} (|z_i| + \frac{1}{2\lambda}(z_i - x_i)^2)\). Each 1D problem has solution \(z_i^* = S_\lambda(x_i)\) (soft threshold: push \(x_i\) toward zero by \(\lambda\), setting to zero if \(|x_i| \leq \lambda\)).

Soft thresholding is the core operation in the LASSO, compressed sensing, and wavelet denoising. The fact that it is the proximal operator of \(\|\cdot\|_1\) explains why LASSO can be solved efficiently by iterative soft-thresholding algorithms.
</div>

<div class="example">
<strong>Moreau identity.</strong> For any convex function \(f\) and its Fenchel conjugate \(f^*\):

\[
\mathrm{prox}_{\lambda f}(x) + \lambda \mathrm{prox}_{f^*/\lambda}(x/\lambda) = x.
\]
This "Moreau decomposition" says that projecting onto \(f\) and onto \(f^*\) (with appropriate scaling) gives a partition of the identity. For \(f = \|\cdot\|_1\) and \(f^* = \mathbf{1}_{\|\cdot\|_\infty \leq 1}\): \(\mathrm{prox}_{\lambda\|\cdot\|_1}(x) + \lambda\Pi_{\|\cdot\|_\infty \leq 1}(x/\lambda) = x\), i.e., soft-thresholding + projection onto the \(\ell^\infty\) ball = identity. This is a deep algebraic identity between the two dual norms.
</div>

## 7.7 Strongly Convex Functions

Strong convexity is a quantitative strengthening of convexity that gives faster convergence for optimization algorithms.

<div class="definition">
<strong>Strong convexity.</strong> A function \(f : \mathbb{R}^n \to \mathbb{R}\) is <em>\(\mu\)-strongly convex</em> (for \(\mu > 0\)) if \(f(x) - \frac{\mu}{2}\|x\|^2\) is convex, equivalently if for all \(x, y\) and \(t \in [0,1]\):

\[
f((1-t)x + ty) \leq (1-t)f(x) + tf(y) - \frac{\mu}{2}t(1-t)\|x-y\|^2.
\]
Equivalently (for twice-differentiable \(f\)): \(D^2 f(x) \succeq \mu I\) for all \(x\).
</div>

<div class="remark">
<strong>Strong convexity and the Legendre transform.</strong> A function \(f\) is \(\mu\)-strongly convex if and only if its Legendre conjugate \(f^*\) is \((1/\mu)\)-smooth (i.e., \(\nabla f^*\) is \((1/\mu)\)-Lipschitz, equivalently \(D^2 f^* \preceq (1/\mu)I\)). This is the precise "curvature duality" under the Legendre transform: strong convexity (high curvature, tight lower bounds) of \(f\) corresponds to smoothness (low curvature, bounded upper approximation) of \(f^*\).

In optimization: strongly convex functions have unique minimizers, and gradient descent on a \(\mu\)-strongly convex, \(L\)-smooth function converges geometrically with rate \((1 - \mu/L)^k\). The condition number \(\kappa = L/\mu\) is the key parameter — problems with \(\kappa \approx 1\) are "well-conditioned" and converge quickly; problems with large \(\kappa\) are "ill-conditioned" and converge slowly.
</div>

---

# Chapter 8: Duality and the Legendre Transform

Duality is a recurring theme in mathematics: a geometric object has a "dual" object that encodes the same information from a different perspective. In convex geometry, the polar dual of a convex body \(K\) is a body \(K^\circ\) that is "small where \(K\) is large." In convex analysis, the Legendre–Fenchel transform converts a convex function into its "dual" function. These two dualities are deeply connected and together form the foundation of convex optimization theory.

## 8.1 Polar Sets and Support Functions

<div class="definition">
<strong>Polar set.</strong> For a set \(K \subseteq \mathbb{R}^n\) containing the origin, the <em>polar set</em> (or polar body) is

\[
K^\circ = \{y \in \mathbb{R}^n : \langle x, y \rangle \leq 1 \text{ for all } x \in K\}.
\]
</div>

<div class="remark">
<strong>Geometric picture of polarity.</strong> Imagine \(K\) as a "large" body. A vector \(y\) is in \(K^\circ\) if the hyperplane \(\{\langle y, \cdot\rangle = 1\}\) does not "cut into" \(K\) — it stays on the far side of \(K\) from the origin. The condition \(\langle x, y\rangle \leq 1\) for all \(x \in K\) says exactly that the maximum of the linear functional \(\langle y, \cdot\rangle\) on \(K\) is at most 1. Large bodies correspond to small polar bodies (since "all inner products are small" is a strong condition only if \(y\) is small), and vice versa.
</div>

<div class="theorem">
<strong>Properties of polarity.</strong>
<ol>
<li>\(K^\circ\) is always closed, convex, and contains the origin.</li>
<li>If \(K\) is a closed convex set containing the origin, then \((K^\circ)^\circ = K\) (the bipolar theorem).</li>
<li>If \(K \subseteq L\), then \(L^\circ \subseteq K^\circ\) (polarity reverses inclusion).</li>
<li>For the unit ball: \((\mathbb{B}^n)^\circ = \mathbb{B}^n\).</li>
<li>For a polytope \(P = \mathrm{conv}\{v_1, \ldots, v_m\}\), its polar is \(P^\circ = \{y : \langle v_i, y \rangle \leq 1 \text{ for all } i\}\).</li>
</ol>
</div>

<div class="example">
<strong>Worked Example: The cross-polytope and hypercube are polar duals.</strong>

Let \(K = [-1,1]^n\) (the unit hypercube, centered at origin). Its vertices are the \(2^n\) vectors \((\pm 1, \ldots, \pm 1)\). By property 5, the polar is:

\[
K^\circ = \{y : \langle v, y\rangle \leq 1 \text{ for all vertices } v = (\pm 1, \ldots, \pm 1)\} = \left\{y : \sum_i |y_i| \leq 1\right\} = \mathcal{C}_n,
\]
the cross-polytope! The condition \(\langle v, y\rangle \leq 1\) for all sign vectors \(v \in \{-1,+1\}^n\) is equivalent to \(\max_{v \in \{-1,+1\}^n} \sum_i v_i y_i = \sum_i |y_i| \leq 1\).

Conversely, the polar of the cross-polytope \(\mathcal{C}_n = \mathrm{conv}\{\pm e_1, \ldots, \pm e_n\}\) is:

\[
\mathcal{C}_n^\circ = \{y : \langle \pm e_i, y\rangle \leq 1 \text{ for all } i\} = \{y : |y_i| \leq 1 \text{ for all } i\} = [-1,1]^n = K.
\]
So the hypercube and the cross-polytope are indeed polar duals of each other. This is a concrete verification of \((K^\circ)^\circ = K\).

In \(\mathbb{R}^2\): the square \([-1,1]^2\) (4 vertices, 4 edges) is polar dual to the diamond \(\{|x_1| + |x_2| \leq 1\}\) (4 vertices, 4 edges). Notice the number of vertices of one equals the number of facets of the other (in 2D, both have 4 vertices and 4 edges — the square and diamond are combinatorially equivalent, related by a \(45°\) rotation).
</div>

<div class="definition">
<strong>Support function.</strong> For a nonempty compact convex set \(K \subset \mathbb{R}^n\), the <em>support function</em> is

\[
h_K(u) = \max_{x \in K} \langle u, x \rangle, \quad u \in \mathbb{R}^n.
\]
</div>

<div class="remark">
The support function \(h_K\) encodes the full geometry of \(K\). It is positively 1-homogeneous (\(h_K(\lambda u) = \lambda h_K(u)\) for \(\lambda > 0\)) and convex. Conversely, any function that is positively 1-homogeneous and convex is the support function of some convex body. Minkowski addition becomes addition of support functions: \(h_{K+L} = h_K + h_L\). The polar body satisfies \(h_{K^\circ}(u) = \|u\|_{K}\), the gauge (Minkowski functional) of \(K\).
</div>

<div class="example">
<strong>Worked Example: Support function of the ball vs. a polytope.</strong>

\textbf{Unit ball.} For \(K = \mathbb{B}^n\), the maximum of \(\langle u, x\rangle\) over \(\|x\| \leq 1\) is \(\|u\|\) (achieved at \(x = u/\|u\|\)). So \(h_{\mathbb{B}^n}(u) = \|u\|\). The support function of the ball is the Euclidean norm — a smooth function.

\textbf{Square.} For \(K = [-1,1]^2\), the maximum of \(\langle u, x\rangle = u_1 x_1 + u_2 x_2\) over \(|x_i| \leq 1\) is \(|u_1| + |u_2|\) (achieved by setting \(x_i = \mathrm{sgn}(u_i)\)). So \(h_{[-1,1]^2}(u) = |u_1| + |u_2| = \|u\|_1\). The support function of the square is the \(\ell^1\) norm — a piecewise linear function with kinks on the axes.

\textbf{Cross-polytope.} For \(K = \mathcal{C}_2 = \{|x_1|+|x_2| \leq 1\}\) (diamond), the maximum of \(u_1 x_1 + u_2 x_2\) subject to \(|x_1|+|x_2| \leq 1\) is \(\max(|u_1|, |u_2|) = \|u\|_\infty\). So \(h_{\mathcal{C}_2}(u) = \|u\|_\infty\).

This confirms the duality: the support function of \(K^\circ\) is the gauge of \(K\), and we see \(h_{[-1,1]^2}(u) = \|u\|_1\) while the gauge of \([-1,1]^2\) is \(\|u\|_\infty = h_{\mathcal{C}_2}(u)\). The ball is self-dual because the \(\ell^2\) norm is the support function of \(\mathbb{B}^n\) and also its gauge.
</div>

<div class="example">
<strong>Worked Example: Support function of the simplex.</strong> Let \(\Delta_n = \mathrm{conv}\{0, e_1, e_2, \ldots, e_n\}\) be the standard simplex in \(\mathbb{R}^n\). To compute \(h_{\Delta_n}(u) = \max_{x \in \Delta_n} \langle u, x \rangle\):

The maximum of a linear function over a convex polytope is achieved at a vertex. The vertices of \(\Delta_n\) are \(0, e_1, \ldots, e_n\), giving values \(0, u_1, \ldots, u_n\) respectively. So:

\[
h_{\Delta_n}(u) = \max(0, u_1, u_2, \ldots, u_n) = \max(0, \max_i u_i).
\]
This is a piecewise linear function. For \(u = (1, 0, \ldots, 0)\): \(h = 1\) (achieved at \(e_1\)). For \(u = (-1, -1, \ldots, -1)\): \(h = 0\) (achieved at the origin). For \(u = (3, 1, 2)\): \(h = \max(0, 3, 1, 2) = 3\) (achieved at \(e_1\)).
</div>

<div class="example">
<strong>Worked Example: Support function of a single point and a segment.</strong>
<ul>
<li>For \(K = \{x_0\}\) (a single point), \(h_K(u) = \langle u, x_0 \rangle\). The support function of a point is the linear functional that evaluates at that point. This is the "degenerate" case — it is a linear function of \(u\), not merely convex.</li>
<li>For \(K = [a, b]\) (a line segment in \(\mathbb{R}^n\), not just \(\mathbb{R}\)), \(h_K(u) = \max(\langle u, a\rangle, \langle u, b\rangle)\) since the maximum of a linear function over a segment is achieved at an endpoint.</li>
<li>For the box \(K = [-a_1, a_1] \times [-a_2, a_2] \times \cdots \times [-a_n, a_n]\) with \(a_i > 0\): \(h_K(u) = \sum_{i=1}^n a_i |u_i|\). This is an \(\ell^1\)-type expression, weighted by the half-lengths. In particular, for the unit cube \([-1,1]^n\): \(h(u) = \|u\|_1\).</li>
</ul>
</div>

<div class="theorem">
<strong>Minkowski sum ↔ sum of support functions.</strong> For convex bodies \(K\) and \(L\):

\[
h_{K+L}(u) = h_K(u) + h_L(u), \quad h_{\lambda K}(u) = \lambda h_K(u) \text{ for } \lambda \geq 0.
\]
</div>

<div class="proof">
By definition:

\[
h_{K+L}(u) = \max_{z \in K+L} \langle u, z \rangle = \max_{x \in K, y \in L} \langle u, x+y \rangle = \max_{x \in K} \langle u, x\rangle + \max_{y \in L} \langle u, y\rangle = h_K(u) + h_L(u).
\]
The key step is that \(\max_{x \in K, y \in L} \langle u, x+y\rangle = \max_{x\in K}\langle u,x\rangle + \max_{y \in L}\langle u,y\rangle\) because the two maximizations are independent (one over \(K\), one over \(L\), and the objective is additive in \(x\) and \(y\)). For the dilation: \(h_{\lambda K}(u) = \max_{x \in \lambda K}\langle u,x\rangle = \max_{y \in K}\langle u, \lambda y\rangle = \lambda \max_{y \in K}\langle u,y\rangle = \lambda h_K(u)\).
</div>

<div class="remark">
<strong>Why this is powerful.</strong> The support function linearizes the nonlinear geometric operation of Minkowski sum. Adding two convex bodies (a complex geometric operation) becomes simply adding their support functions (a pointwise addition of real-valued functions). This is the main reason support functions appear throughout the Brunn–Minkowski theory. For example, the Alexandrov–Fenchel inequality can be expressed purely in terms of support functions via their mixed volume formula.

Furthermore, every positively 1-homogeneous convex function \(h: \mathbb{R}^n \to \mathbb{R}\) is the support function of some unique convex body — the body \(K = \{x : \langle x, u\rangle \leq h(u) \text{ for all } u \in \mathbb{S}^{n-1}\}\). So the support function parametrizes the space of convex bodies as a convex cone in the space of functions, and Minkowski addition corresponds to addition in this cone.
</div>

<div class="example">
<strong>Worked Example: Support function and Minkowski sum.</strong> We verify \(h_{K+L} = h_K + h_L\). Let \(K = [0,1]^2\) and \(L = \{(r\cos\theta, r\sin\theta) : r \leq 1\} = \mathbb{B}^2\). Then:
<ul>
<li>\(h_K(u_1, u_2) = \max_{(x_1,x_2) \in [0,1]^2}(u_1 x_1 + u_2 x_2) = \max(0, u_1) + \max(0, u_2) = u_1^+ + u_2^+\).</li>
<li>\(h_L(u) = \|u\|\).</li>
<li>\(h_{K+L}(u) = u_1^+ + u_2^+ + \|u\|\).</li>
</ul>
Let us verify: the Minkowski sum \(K + L\) is the unit square shifted to \([0,1]^2\) with a disk of radius 1 added. For \(u = (1, 0)\): \(h_{K+L}(1,0) = \max_{x \in K, y \in L}(x_1 + y_1) = 1 + 1 = 2 = 1^+ + 0^+ + \|(1,0)\| = 1 + 0 + 1 = 2\). For \(u = (1, 1)/\sqrt{2}\): \(h_K = (1 + 1)/\sqrt{2} = \sqrt{2}\), \(h_L = 1\), total \(\sqrt{2} + 1\).
</div>

## 8.1b Polar Duality: Proofs and Further Examples

We now prove the bipolar theorem and work through additional examples of polar duals.

<div class="theorem">
<strong>Bipolar Theorem.</strong> Let \(K \subset \mathbb{R}^n\) be a closed convex set containing the origin. Then:

\[
(K^\circ)^\circ = K.
\]
</div>

<div class="proof">
First, \(K \subseteq (K^\circ)^\circ\): for any \(x \in K\), we have \(\langle x, y\rangle \leq 1\) for all \(y \in K^\circ\) (by definition of \(K^\circ\)), so \(x \in (K^\circ)^\circ\).

For the reverse, suppose \(x_0 \notin K\). Since \(K\) is closed and convex and \(x_0 \notin K\), by the strict separation theorem there exists \(v \in \mathbb{R}^n\) and \(\alpha > \beta\) such that \(\langle v, x_0\rangle > \alpha > \beta \geq \langle v, x\rangle\) for all \(x \in K\). Since \(0 \in K\), we have \(\beta \geq 0\). Let \(\tilde{v} = v/\alpha\); then \(\langle \tilde{v}, x_0\rangle > 1\) and \(\langle \tilde{v}, x\rangle \leq \beta/\alpha \leq 1\) for all \(x \in K\). So \(\tilde{v} \in K^\circ\) but \(\langle \tilde{v}, x_0\rangle > 1\), meaning \(x_0 \notin (K^\circ)^\circ\). This proves \((K^\circ)^\circ \subseteq K\), completing the proof.
</div>

<div class="remark">
<strong>The role of "closed convex containing the origin."</strong> The bipolar theorem requires all three conditions: closed, convex, and containing the origin. If \(K\) is not closed, \((K^\circ)^\circ\) is the closure of \(K\). If \(K\) does not contain the origin, then \(K^\circ\) might be empty or bounded in unusual ways. If \(K\) is not convex, \((K^\circ)^\circ\) is the closed convex hull of \(K\). The polar operation is thus a "closure operation" in the category of closed convex sets containing the origin.
</div>

<div class="theorem">
<strong>The unit ball is self-polar.</strong> \((\mathbb{B}^n)^\circ = \mathbb{B}^n\).
</div>

<div class="proof">
By Cauchy–Schwarz, \(\langle x, y\rangle \leq \|x\|\|y\|\). So if \(\|x\| \leq 1\) and \(\|y\| \leq 1\), then \(\langle x,y\rangle \leq 1\). This shows \(\mathbb{B}^n \subseteq (\mathbb{B}^n)^\circ\). Conversely, if \(y \notin \mathbb{B}^n\), i.e., \(\|y\| > 1\), take \(x = y/\|y\| \in \mathbb{B}^n\): then \(\langle x, y\rangle = \langle y/\|y\|, y\rangle = \|y\| > 1\). So \(y \notin (\mathbb{B}^n)^\circ\). Thus \((\mathbb{B}^n)^\circ = \mathbb{B}^n\).
</div>

<div class="example">
<strong>Polar of an ellipsoid.</strong> Let \(E = \{x : x^T A x \leq 1\}\) be an ellipsoid centered at the origin, where \(A\) is a positive definite matrix. Then \(E^\circ = \{y : y^T A^{-1} y \leq 1\}\) — the polar of an ellipsoid with matrix \(A\) is the ellipsoid with matrix \(A^{-1}\). Proof: \(y \in E^\circ\) iff \(\langle x, y\rangle \leq 1\) for all \(x\) with \(x^T A x \leq 1\). The maximum of \(\langle x, y\rangle\) over this ellipsoid is \(\sqrt{y^T A^{-1} y}\) (by the Cauchy–Schwarz inequality for the \(A\)-inner product: \(\langle x, y\rangle = \langle A^{1/2}x, A^{-1/2}y\rangle \leq \|A^{1/2}x\|\|A^{-1/2}y\| = \sqrt{x^TAx}\sqrt{y^TA^{-1}y}\)). So \(y \in E^\circ\) iff \(\sqrt{y^T A^{-1} y} \leq 1\), i.e., \(y^T A^{-1} y \leq 1\). For the unit ball, \(A = I\), \(A^{-1} = I\), confirming self-duality.
</div>

<div class="remark">
<strong>Polarity reverses size and shape.</strong> The polar operation has a striking "inversion" character: sets that are large (far from the origin) have small polars, and sets that are small have large polars. Formally: if \(\lambda K = \lambda \cdot K\) for scalar \(\lambda > 0\), then \((\lambda K)^\circ = \frac{1}{\lambda} K^\circ\). This scaling relationship confirms that the polar of a "big" body (large \(\lambda\)) is a "small" body (small \(1/\lambda\)).

This inversive relationship is central to John's theorem: the John ellipsoid of \(K\) (maximal volume inscribed ellipsoid) is related to the Loewner ellipsoid of \(K^\circ\) (minimal volume circumscribed ellipsoid), and the Mahler volume \(\mathrm{Vol}(K)\mathrm{Vol}(K^\circ)\) is a key affine invariant (the <strong>Mahler conjecture</strong> asks for its minimum, achieved by the cube and simplex in different senses, but still unresolved for non-symmetric bodies in high dimensions).
</div>

## 8.2 The Legendre–Fenchel Transform

<div class="definition">
<strong>Convex conjugate (Legendre–Fenchel transform).</strong> For a function \(f : \mathbb{R}^n \to \mathbb{R} \cup \{+\infty\}\), the <em>convex conjugate</em> (or <em>Fenchel conjugate</em>) is

\[
f^*(y) = \sup_{x \in \mathbb{R}^n} \left(\langle x, y \rangle - f(x)\right), \quad y \in \mathbb{R}^n.
\]
</div>

<div class="remark">
<strong>Geometric interpretation.</strong> The convex conjugate \(f^*(y)\) is the maximum "gap" between the linear function \(x \mapsto \langle x, y\rangle\) and \(f\). It measures how much the hyperplane with slope \(y\) can exceed \(f\). Equivalently, \(-f^*(y)\) is the \(y\)-intercept of the highest affine function with slope \(y\) that lies below the graph of \(f\). The Legendre–Fenchel transform is thus a duality between functions and their "supporting hyperplanes" — directly analogous to the polar duality between convex bodies and their supporting hyperplanes.
</div>

<div class="example">
<strong>Standard Legendre–Fenchel transforms.</strong>
<ul>
<li>If \(f(x) = \frac{1}{2}\|x\|^2\), then \(f^*(y) = \frac{1}{2}\|y\|^2\). The Gaussian is self-conjugate. Derivation: \(\sup_x (\langle x,y\rangle - \frac{1}{2}\|x\|^2)\). Differentiating in \(x\): \(y - x = 0\), so \(x^* = y\), and \(f^*(y) = \langle y,y\rangle - \frac{1}{2}\|y\|^2 = \frac{1}{2}\|y\|^2\).</li>
<li>If \(f(x) = \frac{1}{2p}\|x\|^{2p}\) for \(p > 1\), then \(f^*(y) = \frac{1}{2q}\|y\|^{2q}\) where \(1/p + 1/q = 1\). This is the Hölder duality for powers: the conjugate of \(x^p/p\) is \(y^q/q\).</li>
<li>If \(f(x) = \|x\|\), then \(f^*(y) = \mathbf{1}_{\mathbb{B}^n}(y)\) (the indicator of the unit ball, zero inside and \(+\infty\) outside). Derivation: \(\sup_x (\langle x,y\rangle - \|x\|) = \sup_x (\langle x,y\rangle - \|x\|)\). If \(\|y\| \leq 1\), then \(\langle x,y\rangle \leq \|x\|\|\y\| \leq \|x\|\), so \(\langle x,y\rangle - \|x\| \leq 0\), achieved at \(x=0\). If \(\|y\| > 1\), take \(x = t y/\|y\|\): then \(\langle x,y\rangle - \|x\| = t\|y\| - t = t(\|y\|-1) \to \infty\) as \(t \to \infty\). So \(f^*(y) = 0\) for \(\|y\| \leq 1\) and \(+\infty\) for \(\|y\| > 1\).</li>
<li>If \(f(x) = e^x\) on \(\mathbb{R}\), then \(f^*(y) = y\log y - y\) for \(y > 0\) (and \(0\) at \(y = 0\), \(+\infty\) for \(y < 0\)). Derivation: \(\sup_x (xy - e^x)\). Differentiating: \(y - e^x = 0\), so \(x^* = \log y\), and \(f^*(y) = y \log y - y\). This conjugate function is the negative entropy — the convex conjugate of the exponential function is the entropy.</li>
<li>If \(f(x) = -\log x\) on \((0,\infty)\), then \(f^*(y) = -1 - \log(-y)\) for \(y < 0\) (and \(+\infty\) for \(y \geq 0\)). Derivation: \(\sup_{x>0}(xy - (-\log x)) = \sup_{x>0}(xy + \log x)\). Differentiating: \(y + 1/x = 0\), so \(x^* = -1/y\) (valid for \(y < 0\)), and \(f^*(y) = y \cdot (-1/y) + \log(-1/y) = -1 + \log(-1/y) = -1 - \log(-y)\).</li>
<li>For a convex body \(K\), the support function \(h_K(u) = \sup_{x \in K} \langle x, u \rangle\) is the Legendre transform of the indicator function \(\mathbf{1}_K\) (which equals 0 on \(K\) and \(+\infty\) off \(K\)).</li>
</ul>
</div>

<div class="remark">
<strong>The table of dual pairs.</strong> The following standard correspondences are worth memorizing:

\[
\begin{array}{lll}
\hline
f(x) & f^*(y) & \text{Notes} \\
\hline
\tfrac{1}{p}|x|^p, \; p > 1 & \tfrac{1}{q}|y|^q, \; \tfrac{1}{p}+\tfrac{1}{q}=1 & \text{Hölder dual pair} \\
e^x & y \log y - y & \text{entropy} \\
-\log x \; (x>0) & -1 - \log(-y) \; (y<0) & \text{log-barrier} \\
\tfrac{1}{2}\|x\|^2 & \tfrac{1}{2}\|y\|^2 & \text{self-dual} \\
\|x\| & \mathbf{1}_{\{{\|y\|\leq 1}\}} & \text{norm ↔ indicator of ball} \\
\mathbf{1}_C(x) & h_C(y) & \text{indicator ↔ support function} \\
\hline
\end{array}
\]
The last row is the fundamental identity connecting convex analysis and convex geometry: the Legendre transform of the indicator of a convex body is its support function.
</div>

<div class="example">
<strong>Worked Example: Conjugate of the quadratic \(f(x) = \frac{1}{2}x^T A x\).</strong> Let \(A\) be a positive definite \(n \times n\) matrix and \(f(x) = \frac{1}{2} x^T A x\). To find \(f^*(y) = \sup_x (\langle x, y\rangle - \frac{1}{2}x^T A x)\), differentiate: \(y - Ax = 0\), so the maximum is at \(x^* = A^{-1} y\). Substituting: \(f^*(y) = \langle A^{-1}y, y\rangle - \frac{1}{2}(A^{-1}y)^T A (A^{-1}y) = y^T A^{-1} y - \frac{1}{2} y^T A^{-1} y = \frac{1}{2} y^T A^{-1} y\). So \(f^*(y) = \frac{1}{2}y^T A^{-1} y\) — the conjugate of a quadratic with matrix \(A\) is the quadratic with inverse matrix \(A^{-1}\).

This illustrates a fundamental principle: the Legendre transform converts "curvature in the \(x\)-space" (captured by \(A\)) into "curvature in the \(y\)-space" (captured by \(A^{-1}\)). High curvature (large eigenvalues of \(A\)) in one space corresponds to low curvature (small eigenvalues of \(A^{-1}\)) in the dual.
</div>

<div class="theorem">
<strong>Properties of the Fenchel conjugate.</strong>
<ol>
<li>\(f^*\) is always convex and lower semicontinuous (even if \(f\) is not).</li>
<li><strong>Young–Fenchel inequality:</strong> \(\langle x, y \rangle \leq f(x) + f^*(y)\) for all \(x, y\).</li>
<li><strong>Fenchel–Moreau biconjugate theorem:</strong> If \(f\) is convex, proper, and lower semicontinuous, then \(f^{**} = (f^*)^* = f\).</li>
<li>The conjugate of a sum (with appropriate domains) satisfies the infimal convolution formula: \((f + g)^*(y) = \inf_{u} (f^*(u) + g^*(y - u))\).</li>
</ol>
</div>

<div class="proof">
<em>Proof of the Fenchel–Moreau theorem.</em> By definition, \(f^{**}(x) = \sup_y (\langle x, y \rangle - f^*(y)) = \sup_y \inf_z (\langle x, y \rangle - \langle z, y \rangle + f(z))\). Since \(\inf_z \sup_y \geq \sup_y \inf_z\) always (minimax inequality), and for convex lsc \(f\) the minimax is attained (by the saddle-point theorem for convex-concave functions), we get \(f^{**}(x) \leq f(x)\).

For the reverse, notice that \(f^{**}(x) = \sup\{l(x) : l \text{ affine}, l \leq f\}\) (supremum over all affine minorants of \(f\)). Since convex lsc functions are pointwise suprema of their affine minorants (by the Hahn–Banach theorem), we get \(f^{**}(x) = f(x)\).

</div>

<div class="remark">
<strong>The Fenchel–Moreau theorem as a perfect duality.</strong> The biconjugate theorem says: "the Legendre transform of the Legendre transform is the identity, for convex lsc functions." This is the analogue of the bipolar theorem \((K^\circ)^\circ = K\) for convex bodies. The condition "convex and lower semicontinuous" is analogous to "closed convex containing the origin" — both are the conditions ensuring that the object is already as "closed" as possible in the appropriate topology.

Geometrically: \(f^{**}(x)\) is the convex lower semicontinuous envelope of \(f\) — the largest convex lsc function below \(f\). If \(f\) is already convex and lsc, this envelope equals \(f\) itself.

</div>

## 8.2b Computing the Legendre Transform: Worked Examples in \(\mathbb{R}^n\)

We collect several more computations of the Legendre transform that are important in applications.

<div class="example">
<strong>Conjugate of the log-sum-exp function.</strong> Let \(f(x) = \log\sum_{i=1}^n e^{x_i}\) (the log-sum-exp or soft maximum). We computed in Section 6.4 that this is convex. Its conjugate:

\[
f^*(y) = \sup_x \left(\langle x, y\rangle - \log\sum_i e^{x_i}\right).
\]
Fixing the constraint \(\sum_i y_i = 1, y_i \geq 0\) (these will be forced), the optimal \(x\) satisfies \(y_i = e^{x_i}/\sum_j e^{x_j}\) (the softmax). Substituting: \(f^*(y) = \sum_i y_i x_i - \log\sum_i e^{x_i} = \sum_i y_i \log y_i\) (using \(x_i = \log y_i + \text{const}\)). So \(f^*(y) = \sum_i y_i \log y_i\) for \(y_i > 0, \sum y_i = 1\) — the negative entropy! And \(f^*(y) = +\infty\) if any \(y_i \leq 0\) or \(\sum y_i \neq 1\).

Summary: \(\text{(log-sum-exp)}^* = \text{(negative entropy on simplex)}\). This is the fundamental duality in optimization and information geometry: the log-partition function and the negative entropy are Legendre duals.
</div>

<div class="example">
<strong>Conjugate of the indicator of a polytope.</strong> Let \(P = \{x : Ax \leq b\}\) be a polytope and \(f = \mathbf{1}_P\) (zero on \(P\), \(+\infty\) off). Then:

\[
f^*(y) = h_P(y) = \sup_{x \in P} \langle x, y\rangle.
\]
This is the support function of \(P\)! So the Legendre conjugate of the indicator of a convex body is its support function. And the support function is always a positively 1-homogeneous convex function. Taking the conjugate again: \((h_P)^* = \mathbf{1}_P\) for a closed convex set containing the origin, recovering the indicator. This is the analytic form of the bipolar theorem.

For a polytope \(P = \{x : Ax \leq b\}\), the support function can be computed by LP: \(h_P(y) = \max\{\langle y, x\rangle : Ax \leq b\}\). By LP duality, \(h_P(y) = \min\{\langle b, \lambda\rangle : A^T\lambda = y, \lambda \geq 0\}\) — so the support function is computed by the dual LP.
</div>

<div class="example">
<strong>Conjugate of a sum.</strong> Suppose \(f(x) = g(x) + h(x)\) where \(g\) and \(h\) are convex. Then:

\[
f^*(y) = \sup_x (\langle y,x\rangle - g(x) - h(x)).
\]
In general, \(f^* \neq g^* + h^*\). The correct formula involves the infimal convolution:

\[
(g + h)^<em>(y) = (g^</em> \Box h^<em>)(y) = \inf_{u+v=y} (g^</em>(u) + h^*(v)),
\]
the infimal convolution of \(g^*\) and \(h^*\). The infimal convolution is the "Minkowski sum" of the epigraphs — it is the operation on functions that corresponds to the Minkowski sum of their epigraphs.

This formula is dual to the fact that the support function of \(K + L\) is \(h_K + h_L\): the Minkowski sum of bodies corresponds to the addition of support functions (which are positively homogeneous convex functions, i.e., "indicators" from a dual perspective).
</div>

## 8.3 Fenchel Duality and Young's Inequality

<div class="theorem">
<strong>Fenchel Duality Theorem.</strong> Let \(f : \mathbb{R}^n \to \mathbb{R} \cup \{+\infty\}\) and \(g : \mathbb{R}^n \to \mathbb{R} \cup \{+\infty\}\) be convex functions with \(\mathrm{dom}(f) \cap \mathrm{dom}(g) \neq \emptyset\) (and a suitable constraint qualification). Then:

\[
\inf_{x \in \mathbb{R}^n} \left(f(x) + g(x)\right) = \sup_{y \in \mathbb{R}^n} \left(-f^<em>(-y) - g^</em>(y)\right),
\]
and the supremum on the right is attained.
</div>

<div class="remark">
<strong>Fenchel duality and LP duality.</strong> When \(f = \mathbf{1}_P\) (indicator of a polyhedron \(P = \{Ax \leq b\}\)) and \(g(x) = c^T x\) (a linear function), the Fenchel dual reduces to the LP dual. The primal problem \(\min_{Ax \leq b} c^T x\) and its dual are obtained by computing \(f^*\) and \(g^*\):

\[
f^<em>(y) = b^T \lambda,\, g^</em>(y) = \mathbf{1}_{c}(y),
\]
and the Fenchel duality theorem gives \(\min_P c^T x = \max_{A^T \lambda = c,\, \lambda \geq 0} -b^T \lambda\), which is exactly LP strong duality. In this sense, Fenchel duality is a vast generalization of LP duality to nonlinear convex programs.
</div>

<div class="theorem">
<strong>Young's Inequality.</strong> For conjugate exponents \(p, q > 1\) with \(1/p + 1/q = 1\) and for \(a, b \geq 0\):

\[
ab \leq \frac{a^p}{p} + \frac{b^q}{q}.
\]
</div>

<div class="proof">
This follows immediately from the Fenchel inequality applied to \(f(x) = x^p/p\) (for \(x \geq 0\)). The conjugate of \(f\) is \(f^*(y) = y^q/q\) (computed by maximizing \(xy - x^p/p\) over \(x \geq 0\)). The Young–Fenchel inequality \(\langle x, y \rangle \leq f(x) + f^*(y)\) then gives exactly \(ab \leq a^p/p + b^q/q\).
</div>

<div class="example">
<strong>Worked Example: Young's inequality implies Hölder's inequality.</strong> For functions \(f \in L^p\) and \(g \in L^q\) (with \(1/p + 1/q = 1\)):

\[
\int |f(x) g(x)|\, dx \leq \int \frac{|f(x)|^p}{p} + \frac{|g(x)|^q}{q}\, dx = \frac{\|f\|_p^p}{p} + \frac{\|g\|_q^q}{q}.
\]
But to get the tight Hölder bound \(\|fg\|_1 \leq \|f\|_p \|g\|_q\), apply Young to the rescaled functions \(f/\|f\|_p\) and \(g/\|g\|_q\):

\[
\int \left|\frac{f}{\|f\|_p}\right| \cdot \left|\frac{g}{\|g\|_q}\right| \leq \int \frac{|f/\|f\|_p|^p}{p} + \frac{|g/\|g\|_q|^q}{q} = \frac{1}{p} + \frac{1}{q} = 1,
\]
giving \(\|fg\|_1 \leq \|f\|_p \|g\|_q\). Hölder's inequality is Young's inequality integrated.
</div>

<div class="remark">
Young's inequality with exponents \(p\) and \(q = p/(p-1)\) (Hölder conjugates) is the basic inequality underlying the Hölder and Minkowski inequalities for \(L^p\) spaces. It also appears in the interpolation theory of Sobolev spaces and in the proof of the Hardy–Littlewood–Sobolev inequality.
</div>

## 8.3b Fenchel Duality in Practice: From Theory to Algorithms

The Fenchel duality theorem is not merely a theoretical curiosity — it is the practical engine behind modern convex optimization solvers.

<div class="remark">
<strong>ADMM and splitting methods.</strong> Many large-scale optimization problems have the form \(\min_{x,z} f(x) + g(z)\) subject to \(Ax + Bz = c\). The Alternating Direction Method of Multipliers (ADMM) exploits the Fenchel duality structure by alternating between minimization over \(x\) (using the conjugate \(f^*\)) and minimization over \(z\) (using \(g^*\)), with a dual variable update. The convergence of ADMM is guaranteed by the strong duality of the Fenchel dual problem, and the convergence rate depends on the strong convexity of \(f\) and \(g\) (equivalently, the smoothness of \(f^*\) and \(g^*\) — since the Legendre transform converts strong convexity into smoothness and vice versa).

This is the practical implementation of the abstract duality theory: the "coordinate splitting" structure of ADMM is exactly the Fenchel duality decomposition of the optimization problem.
</div>

<div class="example">
<strong>Primal-dual algorithm for total variation denoising.</strong> The total variation denoising problem is: given noisy image \(b\), find:

\[
\min_x \frac{1}{2}\|x - b\|_2^2 + \lambda \|\nabla x\|_1,
\]
where \(\|\nabla x\|_1 = \sum_{i,j} |(\nabla x)_{ij}|\) is the total variation. This is a convex problem (sum of smooth convex + non-smooth convex). The Fenchel dual (via the formula \(\|\nabla x\|_1 = \max_{\|p\|_\infty \leq 1} \langle p, \nabla x\rangle = \max_{\|p\|_\infty \leq 1} -\langle \mathrm{div}\, p, x\rangle\)) gives:

\[
\min_x \max_{\|p\|_\infty \leq 1} \frac{1}{2}\|x-b\|_2^2 - \lambda\langle \mathrm{div}\, p, x\rangle.
\]
This primal-dual saddle-point problem is solved efficiently by the Chambolle–Pock algorithm, which alternates primal steps (in \(x\), using the soft-thresholding proximal operator of \(\|\cdot\|_1\)) and dual steps (projecting \(p\) onto \(\|p\|_\infty \leq 1\)). The convergence relies on the Fenchel duality gap going to zero.
</div>

## 8.4 Applications and the Dual Perspective

The Legendre–Fenchel duality framework unifies many inequalities. We record two key applications.

<div class="theorem">
<strong>Dual representation of norms.</strong> For any norm \(\|\cdot\|\) on \(\mathbb{R}^n\), the dual norm is defined by

\[
\|y\|_* = \sup_{\|x\| \leq 1} \langle x, y \rangle.
\]
The original norm is recovered as the dual of the dual: \(\|x\| = \sup_{\|y\|_* \leq 1} \langle x, y \rangle\). The unit ball of \(\|\cdot\|_*\) is the polar body of the unit ball of \(\|\cdot\|\). For the Euclidean norm, the dual norm equals the Euclidean norm (\(\ell^2\) is self-dual). For \(\ell^p\) and \(\ell^q\) with \(1/p + 1/q = 1\), the norms are dual to each other.
</div>

<div class="example">
<strong>Worked Example: The \(\ell^1\)–\(\ell^\infty\) duality.</strong> The unit ball of \(\|\cdot\|_1\) is the cross-polytope \(\mathcal{C}_n\). Its polar is the hypercube \([-1,1]^n\), which is the unit ball of \(\|\cdot\|_\infty\). So \((\ell^1)^* = \ell^\infty\) — the dual norm of \(\ell^1\) is \(\ell^\infty\). Concretely, \(\|y\|_{(\ell^1)^*} = \sup_{\|x\|_1 \leq 1} \sum_i x_i y_i = \max_i |y_i| = \|y\|_\infty\). This is the Cauchy–Schwarz inequality for \(\ell^1\)/\(\ell^\infty\) pairs:

\[
|\langle x, y\rangle| = \left|\sum_i x_i y_i\right| \leq \sum_i |x_i| \cdot \max_j |y_j| = \|x\|_1 \|y\|_\infty.
\]
</div>

<div class="theorem">
<strong>Fenchel's duality and the isoperimetric inequality via optimal transport.</strong> The isoperimetric inequality can be recovered via the Brenier–McCann optimal transport map and Fenchel duality. The Brenier map \(T = \nabla \phi\) (where \(\phi\) is a convex function) pushes one log-concave measure forward to another. The convexity of \(\phi\) and the Monge–Ampère equation \(\det D^2 \phi = \mu_0 / \mu_1 \circ T\) encode the isoperimetric content through the AM–GM inequality applied to the Jacobian.
</div>

<div class="remark">
<strong>The AM-GM proof of the isoperimetric inequality via transport.</strong> Here is a sketch of the optimal transport approach to Brunn–Minkowski. Let \(A\) and \(B\) be compact sets. By Brenier's theorem, there exists a convex function \(\phi : \mathbb{R}^n \to \mathbb{R}\) and a map \(T = \nabla \phi\) such that \(T\) pushes the uniform measure on \(A\) to the uniform measure on \(B\). The Jacobian determinant \(\det D^2\phi\) encodes the "local volume change." Since \(T\) maps \(A\) to \(B\) and \(\nabla \phi(x)\) lies in \(B\) for a.e. \(x \in A\), the midpoint map \(x \mapsto \frac{x + T(x)}{2}\) maps \(A\) into \(\frac{A+B}{2}\). By the AM-GM inequality for the Jacobian determinant:

\[
\mathrm{Vol}\!\left(\frac{A+B}{2}\right)^{1/n} \geq \frac{1}{2}\left[\det D\left(\frac{I + \nabla^2\phi}{2}\right)^{1/n}\right] \cdot \mathrm{Vol}(A)^{1/n} + \cdots \geq \frac{\mathrm{Vol}(A)^{1/n} + \mathrm{Vol}(B)^{1/n}}{2},
\]
recovering the Brunn–Minkowski inequality. This is one of the most elegant modern proofs of Brunn–Minkowski.
</div>

<div class="remark">
The Legendre–Fenchel framework thus connects convex analysis (subdifferentials, conjugate functions), convex geometry (support functions, polar bodies), optimal transport, and functional inequalities in a single coherent duality theory. This perspective, developed by Fenchel, Rockafellar, and their successors, forms the modern foundation for optimization, economics (duality in linear and nonlinear programming), and mathematical physics (Legendre transform in thermodynamics and mechanics).
</div>

---

# Appendix: Connections, Context, and Further Directions

## A.1b Concentration of Measure: The Lévy–Milman Phenomenon

The concentration of measure phenomenon is one of the most striking discoveries of high-dimensional geometry. It says that in high-dimensional spaces, nicely-behaved functions are essentially constant — the measure is so concentrated that deviations from the median are exponentially rare.

<div class="remark">
<strong>The paradox of high dimensions.</strong> In low dimensions, a function on the sphere can vary wildly — think of the coordinate function \(f(x_1, \ldots, x_n) = x_1\), which varies from \(-1\) to \(1\). But on the high-dimensional sphere \(\mathbb{S}^{n-1}\), the measure of the set where \(|x_1| > \varepsilon\) is approximately \(e^{-n\varepsilon^2/2}\) — exponentially small. This means that a "typical" point on the sphere has first coordinate essentially zero. More precisely, for a 1-Lipschitz function \(f : \mathbb{S}^{n-1} \to \mathbb{R}\):

\[
\sigma\!\left(|f - M_f| \geq t\right) \leq 2e^{-(n-2)t^2/2},
\]
where \(M_f\) is the median of \(f\) and \(\sigma\) is the uniform measure on \(\mathbb{S}^{n-1}\). As \(n \to \infty\), the function becomes essentially constant — the concentration is extreme.

The geometric explanation: on the high-dimensional sphere, almost all the measure is concentrated near the equator (the hyperplane perpendicular to any fixed direction). This is the content of the "central limit theorem for projections" — a random projection of a high-dimensional uniform distribution on a sphere looks Gaussian.
</div>

<div class="example">
<strong>Concentration for the cube.</strong> Let \(f : \{-1,1\}^n \to \mathbb{R}\) be any function on the discrete hypercube that is 1-Lipschitz in the Hamming distance. Then by the "bounded differences" method (McDiarmid's inequality, which is a discrete Brunn–Minkowski):

\[
\mathbb{P}(|f - \mathbb{E}[f]| \geq t) \leq 2e^{-2t^2/n}.
\]
For the sum function \(f(x_1, \ldots, x_n) = \frac{1}{\sqrt{n}}\sum_i x_i\): this satisfies a 1-Lipschitz condition with respect to the normalized Hamming distance, and the concentration bound gives Gaussian tails. This is the central limit theorem in the concentration-of-measure language.
</div>

## A.1 Convexity in Optimization Theory

The deepest motivation for studying convex geometry is its role in optimization. When a problem has a convex structure, the landscape of the objective function has no "false minima" — every local minimum is a global minimum. This single property underlies the success of modern optimization algorithms (gradient descent, the simplex method, interior point methods, ADMM) in machine learning, engineering, and economics.

The key dictionary between convex geometry and optimization is:

- **Supporting hyperplane theorem** \(\leftrightarrow\) **KKT conditions:** The KKT (Karush–Kuhn–Tucker) conditions for a constrained convex program are equivalent to the existence of a supporting hyperplane to the feasible set at the optimal point.
- **Separation theorem** \(\leftrightarrow\) **Strong LP duality:** If the primal LP has a feasible optimum and the dual is feasible, they have equal optimal values — the primal and dual feasible sets can be separated.
- **Subdifferential** \(\leftrightarrow\) **Lagrange multipliers:** At the optimal point, the zero subgradient condition \(0 \in \partial f(x^*) + \lambda^* \partial g(x^*)\) generalizes \(\nabla f = \lambda \nabla g\).
- **Fenchel duality** \(\leftrightarrow\) **Lagrangian duality:** The Fenchel dual problem \(\sup_y (-f^*(-y) - g^*(y))\) is the general form of the Lagrangian dual.

<div class="example">
<strong>Example: Lasso regression as a convex program.</strong> The Lasso problem \(\min_x \|Ax - b\|_2^2 + \lambda \|x\|_1\) is convex: \(\|Ax-b\|_2^2\) is convex (smooth, positive semidefinite Hessian) and \(\|x\|_1 = \sum |x_i|\) is convex (sum of norms). The subdifferential of the objective is \(\nabla (\|Ax-b\|_2^2) + \lambda \partial(\|x\|_1)\), and the KKT condition at the optimum \(x^*\) is \(0 \in 2A^T(Ax^*-b) + \lambda \partial\|x^*\|_1\). Since \(\partial|x_i^*| = \{\mathrm{sgn}(x_i^*)\}\) for \(x_i^* \neq 0\) and \([-1,1]\) for \(x_i^* = 0\), this gives the familiar Lasso "soft thresholding" solution.
</div>

## A.1c Convexity in Statistics and Machine Learning

The connection between convexity and statistical inference is fundamental — many of the core algorithms in machine learning are convex optimization problems.

<div class="remark">
<strong>Maximum likelihood estimation as convex optimization.</strong> For exponential family distributions \(p_\theta(x) = \exp(\langle \theta, T(x)\rangle - A(\theta))\), the log-partition function \(A(\theta) = \log \int \exp(\langle\theta,T(x)\rangle)\,dx\) is a convex function of \(\theta\) (it is the Legendre transform of the entropy, as shown in Section 6.5). The negative log-likelihood \(-\ell(\theta) = A(\theta) - \langle\theta, \hat{\mu}\rangle\) (where \(\hat{\mu} = \frac{1}{n}\sum_i T(x_i)\) is the empirical moment) is therefore convex in \(\theta\). The MLE is the unique minimizer of this convex function.

The Hessian of \(A(\theta)\) is the covariance matrix \(\mathrm{Cov}_\theta[T(X)]\) — a positive semidefinite matrix. So the log-partition function is strictly convex, and the MLE is unique whenever the exponential family is regular (full rank). All of this follows from the convexity theory developed in Chapters 6 and 8.
</div>

<div class="remark">
<strong>SVM and the support vector machine as a convex program.</strong> The support vector machine (SVM) for binary classification solves:

\[
\min_{w, b, \xi} \frac{1}{2}\|w\|^2 + C\sum_i \xi_i \quad \text{s.t.} \quad y_i(\langle w, x_i\rangle + b) \geq 1 - \xi_i, \quad \xi_i \geq 0.
\]
This is a quadratic program (convex objective, linear constraints). The dual problem (via Fenchel duality / Lagrangian duality) is:

\[
\max_\alpha \sum_i \alpha_i - \frac{1}{2}\sum_{i,j}\alpha_i\alpha_j y_i y_j \langle x_i, x_j\rangle \quad \text{s.t.} \quad \sum_i \alpha_i y_i = 0, \quad 0 \leq \alpha_i \leq C.
\]
The "kernel trick" replaces \(\langle x_i, x_j\rangle\) by \(k(x_i, x_j)\) (a positive definite kernel), and the dual problem is still a convex quadratic program. The support vectors are the training points \(x_i\) with \(\alpha_i > 0\) — those on the margin boundary. The Krein–Milman theorem (in infinite dimensions) implies the optimal classifier is determined by the support vectors (the "extreme points" of the training set in the appropriate sense).

The geometric interpretation: the SVM finds the maximum-margin hyperplane separating the two classes. This is exactly the supporting hyperplane theorem applied to the convex hulls of the two class point clouds — the optimal separating hyperplane is the one that maximizes the distance between the two convex hulls.
</div>

## A.2 John's Ellipsoid and the Banach–Mazur Distance

A fundamental question in convex geometry is: "how round is a convex body?" The theory of John's ellipsoid provides a quantitative answer.

<div class="theorem">
<strong>John's Theorem.</strong> Every convex body \(K \subset \mathbb{R}^n\) contains a unique ellipsoid \(E\) of maximal volume (the John ellipsoid). This ellipsoid satisfies \(E \subseteq K \subseteq n E\). For symmetric convex bodies (\(K = -K\)), the sharper bound \(E \subseteq K \subseteq \sqrt{n} E\) holds.
</div>

<div class="remark">
<strong>Geometric meaning.</strong> The John ellipsoid is the "best-fit ellipsoid" inside \(K\). It is unique and its existence follows from the compactness of the set of ellipsoids of volume at most \(\mathrm{Vol}(K)\). The bound \(K \subseteq nE\) says that the body never extends more than \(n\) times farther from the center than the John ellipsoid. For the cube \([-1,1]^n\), the John ellipsoid is the inscribed ball of radius 1, and the cube extends to the corners at distance \(\sqrt{n}\) — showing the bound \(\sqrt{n}\) (for symmetric bodies) is sharp.
</div>

<div class="definition">
<strong>Banach–Mazur distance.</strong> For two \(n\)-dimensional normed spaces \(X\) and \(Y\) (or convex bodies), the Banach–Mazur distance is

\[
d_{\mathrm{BM}}(X, Y) = \inf\{\|T\| \cdot \|T^{-1}\| : T : X \to Y \text{ invertible linear map}\}.
\]
It measures how much one space needs to be "stretched" to be isomorphic to the other.
</div>

<div class="remark">
John's theorem implies that every \(n\)-dimensional normed space has Banach–Mazur distance at most \(\sqrt{n}\) from Euclidean space \(\ell^2^n\). This is one of the central results of asymptotic geometric analysis: in high dimensions, every convex body is "not too far" from an ellipsoid, with a quantitative bound depending only on the dimension.
</div>

## A.2b Volume of Convex Bodies and the Curse of Dimensionality

A key aspect of high-dimensional geometry is that volumes behave very differently from low-dimensional intuition.

<div class="remark">
<strong>Volume of the unit ball in high dimensions.</strong> The volume of the unit ball \(\omega_n = \mathrm{Vol}(\mathbb{B}^n)\) satisfies:

\[
\omega_n = \frac{\pi^{n/2}}{\Gamma(n/2 + 1)}.
\]
For even \(n = 2k\): \(\omega_{2k} = \pi^k/k!\). For odd \(n = 2k+1\): \(\omega_{2k+1} = 2^{k+1}\pi^k/(2k+1)!!\). Some values:

\[
\omega_1 = 2, \quad \omega_2 = \pi, \quad \omega_3 = \frac{4\pi}{3}, \quad \omega_4 = \frac{\pi^2}{2}, \quad \omega_5 = \frac{8\pi^2}{15}.
\]
By Stirling's formula, as \(n \to \infty\):

\[
\omega_n \sim \frac{1}{\sqrt{n\pi}}\left(\frac{2\pi e}{n}\right)^{n/2} \to 0.
\]
The unit ball becomes exponentially small in volume as the dimension grows. This is the "curse of dimensionality" in geometric form: the volume of the unit ball concentrates near its boundary as \(n \to \infty\). A random point in the unit ball lies near the sphere with high probability: \(\mathbb{P}(\|X\| \geq 1 - \varepsilon) \to 1\) exponentially fast in \(n\).
</div>

<div class="remark">
<strong>The cube contains exponentially more volume than the ball.</strong> The unit cube \([-1,1]^n\) has volume \(2^n\). The inscribed unit ball has volume \(\omega_n \to 0\). Their ratio:

\[
\frac{\mathrm{Vol}([-1,1]^n)}{\omega_n} = \frac{2^n}{\omega_n} \sim \sqrt{n\pi} \cdot \left(\frac{n}{2\pi e}\right)^{n/2} \to \infty.
\]
In high dimensions, the unit ball occupies a negligible fraction of the unit cube — almost all volume is in the "corners" of the cube, far from the center. This phenomenon is responsible for the poor performance of many naive algorithms in high dimensions.

By contrast, for the cross-polytope \(\mathcal{C}_n = \{x : \|x\|_1 \leq 1\}\), the volume is \(\mathrm{Vol}(\mathcal{C}_n) = 2^n/n!\), even smaller than the ball. So in high dimensions: cross-polytope \(\ll\) ball \(\ll\) cube (in volume), even though all three have "radius" 1 in their respective norms.
</div>

<div class="example">
<strong>Volume formula for the simplex.</strong> The standard simplex \(\Delta_n = \{x \in \mathbb{R}^n : x_i \geq 0, \sum x_i \leq 1\}\) has volume \(\mathrm{Vol}_n(\Delta_n) = 1/n!\). This follows from the iterated integral:

\[
\int_0^1 \int_0^{1-x_1} \cdots \int_0^{1-x_1-\cdots-x_{n-1}} dx_n \cdots dx_1 = \frac{1}{n!}.
\]
As \(n \to \infty\), \(1/n!\) decreases super-exponentially fast — far faster than the ball. The regular simplex in \(\mathbb{R}^n\) is in some sense the "most extreme" convex body: it has the worst John ratio (ratio of circumscribed to inscribed ball radii = \(n\)), the smallest Mahler volume (among non-symmetric bodies, conjectured), and the most extreme combinatorial structure.
</div>

## A.3 Log-Concavity in Combinatorics and Probability

Log-concavity appears throughout combinatorics in the sequences of binomial and multinomial coefficients, in characteristic polynomials of matroids, and in the generating functions of many combinatorial objects. The following is a brief tour.

<div class="remark">
<strong>Log-concavity of binomial coefficients.</strong> The sequence \(\binom{n}{0}, \binom{n}{1}, \ldots, \binom{n}{n}\) is log-concave: \(\binom{n}{k}^2 \geq \binom{n}{k-1}\binom{n}{k+1}\). This follows from the identity \(\binom{n}{k}^2 - \binom{n}{k-1}\binom{n}{k+1} = \binom{n}{k}^2 \cdot \frac{k(n-k+1) - (k-1)(n-k)}{k(n-k+1)} > 0\). More generally, the convolution of log-concave sequences is log-concave (a discrete analogue of Prékopa's theorem).
</div>

<div class="remark">
<strong>Mason–Welsh conjecture and the Heron–Rota–Welsh conjecture.</strong> It was conjectured by Mason (1972) and proved by June Huh and collaborators (2012–2022) using algebraic geometry, Hodge theory on matroids, and connections to the Alexandrov–Fenchel inequalities, that the sequence of Whitney numbers of a matroid is log-concave. The proof uses the "Hodge–Riemann bilinear relations" in the Chow ring of the matroid, directly inspired by the mixed volume inequalities of convex geometry. This is one of the most striking recent connections between convex geometry and combinatorics.
</div>

<div class="remark">
<strong>Log-concavity in probability.</strong> A random variable \(X\) with a log-concave density (e.g., Gaussian, uniform on an interval, exponential) satisfies remarkably strong concentration properties. The Bobkov isoperimetric inequality, the Cheeger-type inequality for log-concave measures, and the thin-shell conjecture (KLS conjecture) all concern the behavior of high-dimensional log-concave distributions. Roughly: a log-concave measure in high dimensions behaves like a Gaussian, and the mass is concentrated in a thin shell around the mean.
</div>

## A.3b Connections to Information Theory: The Entropy Power Inequality

The analogy between the Brunn–Minkowski inequality and information theory is deep and precise.

<div class="remark">
<strong>The entropy power inequality.</strong> Shannon (1948) proved that for independent random vectors \(X\) and \(Y\) in \(\mathbb{R}^n\):

\[
e^{2h(X+Y)/n} \geq e^{2h(X)/n} + e^{2h(Y)/n},
\]
where \(h(X)\) is the differential entropy \(h(X) = -\int f \log f\,dx\) of the density \(f\) of \(X\). This is structurally identical to Brunn–Minkowski with volume replaced by "entropy power" \(e^{2h/n}\).

The analogy is not coincidental:
<ul>
<li>Volume \(\mathrm{Vol}(K)^{1/n}\) corresponds to entropy power \(e^{h(X)/n}\).</li>
<li>Minkowski sum \(K + L\) corresponds to convolution \(X + Y\) (independent sum of random variables).</li>
<li>Indicator function \(\mathbf{1}_K\) corresponds to density \(f\).</li>
<li>Ball (maximizes volume for given "spread") corresponds to Gaussian (maximizes entropy for given variance).</li>
</ul>
The precise connection (Lieb 1978): both inequalities follow from the Prékopa–Leindler inequality. For the entropy power inequality, take \(f\) and \(g\) to be the densities of \(X\) and \(Y\), and \(h\) to be the density of the convolution. The Prékopa–Leindler condition is satisfied, and the inequality gives the entropy power inequality. The two inequalities are "the same" at different levels of abstraction.
</div>

<div class="remark">
<strong>Fisher information and convexity.</strong> The Fisher information of a distribution with density \(f\) is:

\[
I(f) = \int \frac{|\nabla f|^2}{f}\,dx = \int f \left|\nabla \log f\right|^2\,dx.
\]
The de Bruijn identity states: \(\frac{d}{dt}h(X + \sqrt{t}Z) = \frac{1}{2}I(X + \sqrt{t}Z)\), where \(Z\) is a standard Gaussian independent of \(X\). This connects entropy to Fisher information through a "heat flow" interpretation: adding Gaussian noise (smoothing) increases entropy, and the rate is proportional to Fisher information.

The Cramér–Rao inequality \(\mathrm{Var}(\hat{\theta}) \geq 1/I(\theta)\) (variance of any unbiased estimator is at least the reciprocal of Fisher information) is a direct consequence of the Cauchy–Schwarz inequality applied to the score function, connecting convexity (Cauchy–Schwarz is a consequence of the AM–GM/Jensen framework) to statistical estimation.
</div>

## A.4 The Brunn–Minkowski–Lusternik and Concentration of Measure

The Brunn–Minkowski inequality and its functional analogue the Prékopa–Leindler inequality are the foundations of the "concentration of measure" phenomenon in high-dimensional geometry. The key result is:

<div class="theorem">
<strong>Concentration of measure on the sphere.</strong> For any 1-Lipschitz function \(f : \mathbb{S}^{n-1} \to \mathbb{R}\) (where the sphere has unit radius), and for any \(t > 0\):

\[
\mathbb{P}\left(|f - \mathrm{median}(f)| \geq t\right) \leq 2 e^{-(n-1)t^2/2}.
\]
</div>

<div class="remark">
<strong>Geometric meaning.</strong> In high dimensions, the sphere is so "thin" that any reasonable function is almost constant. This is the spherical version of the phenomenon that in \(\mathbb{R}^n\) with \(n\) large, most of the volume of the ball \(\mathbb{B}^n\) is concentrated in a thin shell near the boundary. The proof uses the isoperimetric inequality on the sphere (a consequence of the Brunn–Minkowski theory) and the Gaussian comparison principle.

The concentration of measure principle has profound implications for randomized algorithms (random projections nearly preserve distances), compressed sensing (random matrices satisfy the restricted isometry property), and machine learning (the "blessing of dimensionality" — in high dimensions, random samples are approximately equidistant from each other and from the center).
</div>

## A.4b Worked Problems: Connecting All the Themes

The following worked problems synthesize material from across the course.

<div class="example">
<strong>Problem 1: Support function determines the body.</strong>
Let \(K\) and \(L\) be compact convex sets in \(\mathbb{R}^n\). Show that \(K = L\) if and only if \(h_K = h_L\).

<em>Solution.</em> If \(K = L\), clearly \(h_K(u) = \max_{x\in K}\langle u,x\rangle = \max_{x\in L}\langle u,x\rangle = h_L(u)\) for all \(u\).

Conversely, suppose \(h_K = h_L\). Any compact convex set \(K\) can be recovered from its support function as:

\[
K = \bigcap_{u \in \mathbb{S}^{n-1}} \{x : \langle u, x\rangle \leq h_K(u)\}.
\]
(The intersection of all supporting half-spaces is the set itself, for closed convex sets.) Since \(h_K = h_L\), the two families of half-spaces are identical, so \(K = L\).

This shows the support function is a "complete invariant" of compact convex sets. It is the basis for all support function-based proofs in the Brunn–Minkowski theory.
</div>

<div class="example">
<strong>Problem 2: Subdifferential of a composition.</strong>
Let \(f(x) = g(Ax)\) where \(A : \mathbb{R}^m \to \mathbb{R}^n\) is linear and \(g : \mathbb{R}^n \to \mathbb{R}\) is convex. Show that \(\partial f(x) = A^T \partial g(Ax)\).

<em>Solution.</em> By definition, \(v \in \partial f(x)\) iff \(f(y) \geq f(x) + \langle v, y-x\rangle\) for all \(y\), i.e., \(g(Ay) \geq g(Ax) + \langle v, y-x\rangle\).

Setting \(z = Ay\) and \(z_0 = Ax\): \(g(z) \geq g(z_0) + \langle v, A^{-1}(z-z_0)\rangle\). But \(A^{-1}\) may not exist; instead, write \(\langle v, y-x\rangle = \langle A^T(\cdot), y-x\rangle\) — we need \(\langle w, z - z_0\rangle = \langle v, y-x\rangle\) where \(z - z_0 = A(y-x)\), so \(w = v\) pulled back through \(A^T\): \(\langle v, y-x\rangle = \langle A^T w, y-x\rangle\) requires \(v = A^T w\) for some \(w \in \partial g(Ax)\).

More precisely: \(v \in \partial f(x)\) iff for all \(y\), \(g(Ay) \geq g(Ax) + \langle v, y-x\rangle\). Let \(w \in \partial g(Ax)\): then \(g(z) \geq g(Ax) + \langle w, z-Ax\rangle\) for all \(z\). Setting \(z = Ay\): \(g(Ay) \geq g(Ax) + \langle w, Ay - Ax\rangle = g(Ax) + \langle A^T w, y-x\rangle\). So \(A^T w \in \partial f(x)\). This gives \(A^T \partial g(Ax) \subseteq \partial f(x)\). The reverse inclusion follows by noting that any \(v \in \partial f(x)\) satisfies the inequality, and back-solving for \(w \in \partial g(Ax)\) with \(v = A^T w\) (using the identification of subgradients with supporting hyperplanes of the epigraph, composed with \(A\)).
</div>

<div class="example">
<strong>Problem 3: When does the Brunn–Minkowski inequality reduce to AM–GM?</strong>
In \(\mathbb{R}^1\), Brunn–Minkowski for intervals \(A = [0,a]\) and \(B = [0,b]\) gives \(|A+B| = a+b = |A|+|B|\) — equality. What is the connection to AM–GM?

<em>Solution.</em> The AM–GM inequality \((ab)^{1/2} \leq (a+b)/2\) can be derived from Brunn–Minkowski in \(\mathbb{R}^n\) by taking \(A = \varepsilon \mathbb{B}^n\) and \(B = \delta \mathbb{B}^n\). Then \(A + B = (\varepsilon + \delta)\mathbb{B}^n\), and the BM inequality:

\[
(\varepsilon+\delta)^n \omega_n \geq (\varepsilon^n\omega_n)^{1/n}\cdot n + (\delta^n\omega_n)^{1/n}\cdot n = n\omega_n^{1/n}(\varepsilon + \delta),
\]
which is equality (since \(A\) and \(B\) are homothetic). But more interestingly: for two boxes \(A = [0, a_1] \times \cdots \times [0,a_n]\) and \(B = [0, b_1] \times \cdots \times [0,b_n]\):

\[
\mathrm{Vol}(A+B)^{1/n} \geq \mathrm{Vol}(A)^{1/n} + \mathrm{Vol}(B)^{1/n},
\]
i.e., \(\prod_i(a_i+b_i)^{1/n} \geq \prod_i a_i^{1/n} + \prod_i b_i^{1/n}\). This is a multivariable form of AM–GM: apply AM–GM to \(\frac{a_i}{a_i+b_i}\) and \(\frac{b_i}{a_i+b_i}\):

\[
\prod_i \frac{a_i}{a_i+b_i} \leq \left(\frac{1}{n}\sum_i \frac{a_i}{a_i+b_i}\right)^n, \quad \prod_i \frac{b_i}{a_i+b_i} \leq \left(\frac{1}{n}\sum_i \frac{b_i}{a_i+b_i}\right)^n.
\]
Adding: \(\prod_i^{1/n}\frac{a_i}{a_i+b_i} + \prod_i^{1/n}\frac{b_i}{a_i+b_i} \leq \frac{1}{n}\sum_i\frac{a_i}{a_i+b_i} + \frac{1}{n}\sum_i\frac{b_i}{a_i+b_i} = 1\). This is exactly the BM inequality for boxes, confirming that AM–GM is the "1D engine" driving Brunn–Minkowski.
</div>

## A.4c The Geometry of Duality: A Synthesis

The following remarks connect the duality theory of Chapter 8 with the geometric results of Chapters 1–5.

<div class="remark">
<strong>Three faces of duality.</strong> In this course, we have encountered duality in three forms:

1. <strong>Set-level duality</strong>: The polar body \(K^\circ\) is dual to \(K\). Large bodies have small polars; the ball is self-dual. The bipolar theorem \((K^\circ)^\circ = K\) shows this is a perfect involution on closed convex bodies containing the origin.

2. <strong>Function-level duality</strong>: The Legendre–Fenchel conjugate \(f^*\) is dual to \(f\). The biconjugate theorem \(f^{**} = f\) (for convex lsc \(f\)) mirrors the bipolar theorem. The Young–Fenchel inequality \(\langle x,y\rangle \leq f(x) + f^*(y)\) mirrors the defining property of the polar body.

3. <strong>Norm-level duality</strong>: The dual norm \(\|y\|_* = \sup_{\|x\|\leq 1}\langle x,y\rangle\) is the support function of the unit ball. The Cauchy–Schwarz inequality \(\langle x,y\rangle \leq \|x\|\|y\|_*\) is the Young–Fenchel inequality applied to homogeneous functions.

These three are not separate — they are three facets of a single algebraic structure. Set-level polarity is the "indicator function" version: \(\mathbf{1}_K^\star = h_K\) (Legendre transform of indicator = support function), and \(h_K^\star = \mathbf{1}_{K}^{\circ\circ} = \mathbf{1}_K\) (the Legendre transform of a support function is the indicator of the polar body). The norm duality is the "one-homogeneous" version.
</div>

<div class="remark">
<strong>Duality and the Brunn–Minkowski theory.</strong> The Alexandrov–Fenchel inequalities (Chapter 4) have a dual interpretation via the "dual Brunn–Minkowski theory" (Lutwak's theory of dual quermassintegrals and dual mixed volumes). In the dual theory, Minkowski sums are replaced by "radial sums" (adding radial functions), and the dual Brunn–Minkowski inequality goes in the opposite direction. The two theories (classical and dual) are related by polarity: the classical theory concerns outer measures (support functions, surface area), while the dual theory concerns inner measures (radial functions, chord lengths).

Lutwak's \(L^p\) Brunn–Minkowski theory (1990s) unifies the classical and dual theories by introducing a parameter \(p \in [-\infty, \infty]\), with \(p=1\) giving classical Brunn–Minkowski and \(p=-1\) giving the dual theory. The extension to \(p \neq 1\) involves new geometric operations and new inequalities that are active areas of current research.
</div>

<div class="remark">
<strong>Duality in the space of convex bodies.</strong> The space of convex bodies \(\mathcal{K}^n\) (compact convex sets with nonempty interior) is a metric space under the Hausdorff metric \(d_H(K, L) = \max(h_{K-L}(0), h_{L-K}(0))\). The Minkowski sum gives \(\mathcal{K}^n\) the structure of a commutative monoid (addition without inverse). The support function embedding \(K \mapsto h_K\) realizes \(\mathcal{K}^n\) as a convex cone in the Banach space \(C(\mathbb{S}^{n-1})\) of continuous functions on the sphere.

The Blaschke selection theorem (compactness): any sequence of convex bodies in a bounded region has a convergent subsequence (in Hausdorff metric). This is used in existence proofs (John's ellipsoid, Minkowski's theorem) — the optimizer exists because we can extract a convergent subsequence from a minimizing sequence.
</div>

## A.5 Glossary of Key Concepts

For quick reference, here is a summary of the principal concepts introduced in this course:

- **Affine hull** \(\mathrm{aff}(S)\): the smallest affine subspace containing \(S\).
- **Convex hull** \(\mathrm{conv}(S)\): the smallest convex set containing \(S\); all convex combinations of points in \(S\).
- **Extreme point** of \(C\): a point that cannot be expressed as a nontrivial convex combination within \(C\).
- **Supporting hyperplane**: a hyperplane touching the boundary of a convex set with the set on one side.
- **Minkowski sum** \(A + B\): the set of all sums \(a + b\) with \(a \in A\), \(b \in B\).
- **Steiner formula**: \(\mathrm{Vol}(K + \varepsilon B^n) = \sum_k \binom{n}{k} W_k(K) \varepsilon^k\).
- **Mixed volume** \(V(K_1, \ldots, K_n)\): the multilinear coefficient in the expansion of \(\mathrm{Vol}(\sum t_i K_i)\).
- **Quermassintegrals** \(W_k(K)\): the coefficients in the Steiner formula; include volume, surface area, mean width.
- **Brunn–Minkowski inequality**: \(\mathrm{Vol}(A+B)^{1/n} \geq \mathrm{Vol}(A)^{1/n} + \mathrm{Vol}(B)^{1/n}\).
- **Support function** \(h_K(u) = \max_{x \in K} \langle u, x\rangle\): encodes the geometry of \(K\); \(h_{A+B} = h_A + h_B\).
- **Polar body** \(K^\circ = \{y : \langle x, y\rangle \leq 1 \,\forall x \in K\}\): duality reversing inclusion; \((K^\circ)^\circ = K\).
- **Legendre–Fenchel transform** \(f^*(y) = \sup_x (\langle x,y\rangle - f(x))\): functional analogue of polarity; \(f^{**} = f\) for convex lsc \(f\).
- **Subdifferential** \(\partial f(x_0)\): the set of subgradients (slopes of supporting affine minorants) at \(x_0\).
- **Log-concave function**: \(f((1-t)x + ty) \geq f(x)^{1-t} f(y)^t\); equivalently, \(\log f\) is concave.
- **Prékopa–Leindler inequality**: the functional Brunn–Minkowski; marginals of log-concave functions are log-concave.
- **Carathéodory's theorem**: every point of \(\mathrm{conv}(S)\) is a convex combination of \(\leq n+1\) points of \(S\).
- **Radon's theorem**: any \(n+2\) points admit a partition with intersecting convex hulls.
- **Helly's theorem**: if every \(n+1\) of \(m\) convex sets intersect, all \(m\) sets intersect.
- **Krein–Milman theorem**: every compact convex set is the closed convex hull of its extreme points.
- **Birkhoff–von Neumann theorem**: doubly stochastic matrices are convex combinations of permutation matrices.
- **John's ellipsoid**: the maximal-volume ellipsoid inside \(K\); satisfies \(E \subseteq K \subseteq \sqrt{n} E\) for symmetric \(K\).
- **Proximal operator**: \(\mathrm{prox}_{\lambda f}(x) = \arg\min_z (f(z) + \frac{1}{2\lambda}\|z-x\|^2)\); generalizes projection onto a convex set.
- **Moreau envelope**: \(M_\lambda f(x) = \min_z(f(z) + \frac{1}{2\lambda}\|z-x\|^2)\); always differentiable, with gradient \(\frac{1}{\lambda}(x - \mathrm{prox}_{\lambda f}(x))\).
- **Strong convexity**: \(f\) is \(\mu\)-strongly convex if \(D^2 f \succeq \mu I\); equivalent to \(f^*\) being \((1/\mu)\)-smooth.
- **Log-partition function**: \(A(\theta) = \log\int e^{\langle\theta,T(x)\rangle}dx\); convex in \(\theta\), Legendre dual of the negative entropy.
- **Mahler volume**: \(\mathcal{M}(K) = \mathrm{Vol}(K)\mathrm{Vol}(K^\circ)\); affine invariant, maximized by the ball (Santaló), conjectured minimized by the cube (Mahler conjecture).
- **Normal fan**: partition of \(\mathbb{R}^n\) into cones \(N_P(F)\) for each face \(F\) of a polytope \(P\); encodes the face structure in terms of optimizing directions.
- **Mixed discriminant**: the symmetric multilinear form associated to the permanent, dual to mixed volumes; appears in the proof of the Alexandrov–Fenchel inequality.
- **Dual norm**: \(\|y\|_* = \sup_{\|x\|\leq 1}\langle x,y\rangle\); the support function of the unit ball; satisfies \(\|x\|^{**} = \|x\|\) (self-duality of duality).
- **Concentration of measure**: for 1-Lipschitz functions on \(\mathbb{S}^{n-1}\), \(\mathbb{P}(|f - M_f| \geq t) \leq 2e^{-(n-1)t^2/2}\); functions are essentially constant in high dimensions.
- **Dvoretzky's theorem**: every convex body in \(\mathbb{R}^n\) has a \(k\)-dimensional section that is \((1+\varepsilon)\)-close to an ellipsoid, with \(k \geq c(\varepsilon)\log n\).
- **KLS conjecture**: the Poincaré constant of any log-concave measure is \(O(\log n)\) (Chen 2021); the conjecture that it is \(O(1)\) is open.

---

---

## A.6 Index of Major Results

For quick reference, here are the major theorems with their locations:

- **Carathéodory's theorem** (§2.1): every point of \(\mathrm{conv}(S)\) in \(\mathbb{R}^n\) is a convex combination of \(\leq n+1\) points.
- **Radon's theorem** (§2.2): any \(n+2\) points in \(\mathbb{R}^n\) admit a Radon partition.
- **Helly's theorem** (§2.3): pairwise \((n+1)\)-fold intersection implies global intersection.
- **Kirchberger's theorem** (§2.4): separability is determined by \((n+2)\)-subsets.
- **Supporting hyperplane theorem** (§1.3): every boundary point has a supporting hyperplane.
- **Strict separation theorem** (§1.3): compact convex and closed convex (disjoint) can be strictly separated.
- **Krein–Milman theorem** (§7.5): compact convex set = closed convex hull of its extreme points.
- **Birkhoff–von Neumann theorem** (§7.4): doubly stochastic matrices = convex hull of permutation matrices.
- **Hardy–Littlewood–Pólya** (§7.3): majorization characterized by doubly stochastic matrices and convex sums.
- **Steiner formula** (§4.1): \(\mathrm{Vol}(K+\varepsilon\mathbb{B}) = \sum_k \binom{n}{k} W_k(K)\varepsilon^k\).
- **Brunn–Minkowski inequality** (§4.4): \(\mathrm{Vol}(A+B)^{1/n} \geq \mathrm{Vol}(A)^{1/n} + \mathrm{Vol}(B)^{1/n}\).
- **Prékopa–Leindler inequality** (§5.2): functional Brunn–Minkowski; implies BM as special case.
- **Isoperimetric inequality** (§4.5): ball minimizes surface area for given volume; proved via BM.
- **Prékopa's theorem** (§5.1): marginals of log-concave functions are log-concave.
- **Alexandrov–Fenchel inequality** (§4.2): \(V(K_1,K_2,K_3,\ldots)^2 \geq V(K_1,K_1,K_3,\ldots)\cdot V(K_2,K_2,K_3,\ldots)\).
- **Bipolar theorem** (§8.1b): \((K^\circ)^\circ = K\) for closed convex sets containing origin.
- **Fenchel–Moreau theorem** (§8.2): \(f^{**} = f\) for convex lower semicontinuous \(f\).
- **Fenchel duality theorem** (§8.3): \(\inf(f+g) = \sup(-f^*(-\cdot)-g^*(\cdot))\).
- **John's theorem** (§A.2): maximal inscribed ellipsoid satisfies \(E \subseteq K \subseteq \sqrt{n}E\) (symmetric \(K\)).
- **Santaló inequality** (§9.2): \(\mathrm{Vol}(K)\mathrm{Vol}(K^\circ) \leq \omega_n^2\), with equality for ellipsoids.
- **Dvoretzky's theorem** (§9.3): every convex body has nearly Euclidean sections of dimension \(\sim \log n\).

*End of notes.*

---

# Chapter 9: Convex Bodies, Volumes, and the Geometry of High Dimensions

The final chapter takes a broader perspective, exploring how the theory developed in the preceding chapters illuminates the geometry of high-dimensional convex bodies. The key themes are: how convex bodies can be approximated by ellipsoids (John's theorem), how their volumes behave (the Santaló inequality), and what the "typical" convex body looks like (the concentration of measure phenomenon).

## 9.1 John's Theorem: The Best-Fit Ellipsoid

We gave John's theorem in the appendix; here we develop it more fully, with the characterization conditions and applications.

<div class="theorem">
<strong>John's Theorem (full statement).</strong> Let \(K \subset \mathbb{R}^n\) be a convex body. There exists a unique ellipsoid \(E_J(K)\) of maximum volume contained in \(K\), called the <em>John ellipsoid</em>. Moreover:
<ol>
<li>\(E_J(K) \subseteq K \subseteq n \cdot E_J(K)\) (where \(n \cdot E_J\) denotes dilation by \(n\) about the center of \(E_J\)).</li>
<li>If \(K\) is centrally symmetric (\(K = -K\)), the bound improves to \(E_J(K) \subseteq K \subseteq \sqrt{n} \cdot E_J(K)\).</li>
<li>The ellipsoid \(E_J(K) = \mathbb{B}^n\) (the unit ball) if and only if there exist contact points \(u_1, \ldots, u_m \in \partial \mathbb{B}^n \cap \partial K\) and positive weights \(c_1, \ldots, c_m > 0\) such that:

\[
\sum_{i=1}^m c_i u_i = 0 \quad \text{and} \quad \sum_{i=1}^m c_i u_i \otimes u_i = I_n.
\]
(Here \(u_i \otimes u_i\) denotes the rank-1 matrix \(u_i u_i^T\).)
</li>
</ol>
</div>

<div class="remark">
<strong>Geometric interpretation of the contact conditions.</strong> The conditions \(\sum c_i u_i = 0\) and \(\sum c_i u_i u_i^T = I_n\) say that the contact points \(u_i\) are "balanced" in both a first-moment and a second-moment sense. The first condition says the weighted centroid of the contact points is the center of the ball. The second condition says the contact points span all directions equally — the weighted sum of their outer products (their "average direction" in the PSD order) is the identity.

For the cube \(K = [-1,1]^n\), the John ellipsoid is the inscribed ball of radius 1. The contact points are the \(2n\) points \(\pm e_i\), each with weight \(c_i = 1/n\). Check: \(\sum_{i=1}^n \frac{1}{n}(e_i \otimes e_i + (-e_i) \otimes (-e_i)) = \sum \frac{2}{n} e_i e_i^T = \frac{2}{n} I_n\)... actually with the \(2n\) points \(\pm e_i\) and weights \(c_i = 1/(2n)\) for each: \(\sum_{i=1}^n \frac{1}{2n} \cdot 2 e_i e_i^T = \sum_i \frac{1}{n} e_i e_i^T = \frac{1}{n} I\). Rescaling so the total weight is 1 is a normalization convention. The cube extends to corners at distance \(\sqrt{n}\) from the origin, confirming the bound \(K \subseteq \sqrt{n} E_J(K) = \sqrt{n} \mathbb{B}^n\).
</div>

<div class="example">
<strong>John's theorem for the simplex.</strong> The standard simplex \(\Delta_n = \mathrm{conv}\{e_1, \ldots, e_{n+1}\} \subset \mathbb{R}^{n+1}\) (restricted to the hyperplane \(\sum x_i = 1\)) has John ellipsoid centered at the centroid \(\bar{x} = \frac{1}{n+1}(1,\ldots,1)\) with radius \(r_J = \sqrt{\frac{n}{n+1}} \cdot \frac{1}{\sqrt{n}} = \frac{1}{\sqrt{n+1}}\). The circumscribed ellipsoid (the Loewner ellipsoid) has radius \(r_L = \frac{n}{\sqrt{n+1}}\). The ratio is \(r_L/r_J = n\), confirming the bound \(K \subseteq n E_J\) is sharp (achieved by the simplex).

This explains why linear programming over a simplex can require exponentially many simplex method iterations in the worst case: the simplex is the "least round" convex body (in the sense of the John ratio), and the simplex method follows the edges of the simplex, which can wind around the full \(n\)-dimensional simplex.
</div>

## 9.2 The Santaló Inequality and the Mahler Conjecture

<div class="definition">
<strong>Mahler volume.</strong> For a symmetric convex body \(K \subset \mathbb{R}^n\) (with \(K = -K\) and \(0 \in \mathrm{int}(K)\)), the <em>Mahler volume</em> (or volume product) is:

\[
\mathcal{M}(K) = \mathrm{Vol}_n(K) \cdot \mathrm{Vol}_n(K^\circ).
\]
This is an affine invariant: \(\mathcal{M}(TK) = \mathcal{M}(K)\) for any invertible linear map \(T\) (since \((TK)^\circ = (T^{-1})^T K^\circ\) and volumes transform by \(|\det T|\) and \(|\det T^{-1}|\) respectively, which cancel).
</div>

<div class="theorem">
<strong>Santaló Inequality.</strong> For any symmetric convex body \(K \subset \mathbb{R}^n\):

\[
\mathcal{M}(K) = \mathrm{Vol}(K) \cdot \mathrm{Vol}(K^\circ) \leq \omega_n^2,
\]
with equality if and only if \(K\) is an ellipsoid. Here \(\omega_n = \mathrm{Vol}(\mathbb{B}^n)\).
</div>

<div class="remark">
<strong>Santaló and the upper bound.</strong> The Santaló inequality says the ball maximizes the Mahler volume. Equivalently, among all ellipsoids \(E\) centered at the origin, \(\mathrm{Vol}(E)\mathrm{Vol}(E^\circ) = \omega_n^2\) (since \(E^\circ\) is also an ellipsoid, and the product of volumes is always \(\omega_n^2\) for ellipsoids — this can be verified directly for the coordinate ellipsoid \(E = \{x : \sum x_i^2/a_i^2 \leq 1\}\), which has \(\mathrm{Vol}(E) = \omega_n \prod a_i\) and \(E^\circ = \{y : \sum a_i^2 y_i^2 \leq 1\}\) with \(\mathrm{Vol}(E^\circ) = \omega_n / \prod a_i\), so \(\mathrm{Vol}(E)\mathrm{Vol}(E^\circ) = \omega_n^2\)).

The Santaló inequality is proved using Steiner symmetrization (each symmetrization increases both volumes in a controlled way, and the maximum is achieved at the ball).
</div>

<div class="remark">
<strong>The Mahler conjecture — the open problem.</strong> The Santaló inequality gives an upper bound on the Mahler volume. The corresponding lower bound question is:

\[
\mathcal{M}(K) \geq \text{???}
\]
Mahler conjectured that the minimum Mahler volume for symmetric convex bodies is achieved by the hypercube \([-1,1]^n\) (and, by duality, the cross-polytope \(\mathcal{C}_n\)), with \(\mathcal{M}([-1,1]^n) = 4^n/n!\). This is one of the outstanding open problems in convex geometry, proved only in dimensions 2 (1986, Mahler himself for \(n=2\); rigorous proof by Reisner 1986 for all zonotopes including the cube) and in special cases. The conjecture is open for general symmetric convex bodies in dimensions \(n \geq 4\).

For non-symmetric bodies, the conjectured minimizer is the simplex \(\Delta_n\), with \(\mathcal{M}(\Delta_n) = (n+1)^{n+1}/(n!)^2\).
</div>

## 9.3 Dvoretzky's Theorem: Almost Spherical Sections

One of the most remarkable theorems of high-dimensional convex geometry is that every high-dimensional convex body has a nearly spherical low-dimensional section.

<div class="theorem">
<strong>Dvoretzky's Theorem.</strong> For any \(\varepsilon > 0\) and any convex body \(K \subset \mathbb{R}^n\) (with \(n\) sufficiently large), there exists a \(k\)-dimensional central section \(K \cap E\) (where \(E\) is a \(k\)-dimensional subspace) that is \((1+\varepsilon)\)-close to an ellipsoid in the Banach–Mazur distance, where:

\[
k \geq c(\varepsilon) \cdot \log n.
\]
More precisely, there exists a \(k\)-dimensional subspace \(E\) and an ellipsoid \(\mathcal{E} \subset E\) such that \(\mathcal{E} \subseteq K \cap E \subseteq (1+\varepsilon)\mathcal{E}\).
</div>

<div class="remark">
<strong>What Dvoretzky's theorem says.</strong> No matter how "spiky" or "box-like" a convex body looks in high dimensions, it always has a substantial collection of cross-sections that look like balls. The dimension of these "almost Euclidean" sections grows logarithmically with the ambient dimension.

The theorem is closely related to the concentration of measure phenomenon: a random \(k\)-dimensional subspace, for \(k = O(\log n/\varepsilon^2)\), gives a good spherical section with positive probability. Milman's proof of Dvoretzky's theorem (1971) uses the Lipschitz concentration of the norm function on the sphere — the key is that any norm on \(\mathbb{R}^n\), restricted to a random subspace, is close to a multiple of the Euclidean norm.

Dvoretzky's theorem is one of the founding results of asymptotic geometric analysis and has applications in approximation theory, compressed sensing, and quantum information.
</div>

## 9.4 The Central Limit Theorem for Convex Bodies

A striking recent development is that log-concave probability measures satisfy a "central limit theorem" even without independence.

<div class="theorem">
<strong>Central Limit Theorem for Convex Bodies (informal).</strong> Let \(\mu\) be a log-concave probability measure on \(\mathbb{R}^n\) (e.g., the uniform measure on a convex body). For a random unit vector \(\theta \in \mathbb{S}^{n-1}\), the 1-dimensional marginal \(\langle X, \theta\rangle\) (where \(X \sim \mu\)) is approximately Gaussian, with the approximation improving as \(n \to \infty\) for most directions \(\theta\).
</div>

<div class="remark">
<strong>The KLS conjecture.</strong> The Kannan–Lovász–Simonovits (KLS) conjecture (1995) asserts that for any log-concave measure \(\mu\) on \(\mathbb{R}^n\), the Poincaré constant (the inverse of the spectral gap) is of order 1/variance of any linear functional. Formally, there exists an absolute constant \(C > 0\) such that for any log-concave measure \(\mu\) and any smooth function \(f\):

\[
\mathrm{Var}_\mu(f) \leq C \cdot \mathbb{E}_\mu[\|\nabla f\|^2].
\]
This would imply the CLT for convex bodies and sharp mixing-time bounds for random walks on convex bodies. The KLS conjecture was recently nearly resolved by Yuansi Chen (2021), who proved the Poincaré constant is \(O(\log n)\) rather than \(O(1)\), a major breakthrough.
</div>

## 9.5 The Log-Concave Sampling Problem and Connections to Computer Science

The study of log-concave measures is deeply connected to algorithms. The fundamental problem is: given access to a log-concave density \(f\) (e.g., the uniform distribution on a convex body given by an oracle), how quickly can we sample from it?

<div class="remark">
<strong>Ball walk and hit-and-run.</strong> The classical algorithm is the "ball walk": start at a point \(x_0\) inside the convex body, and at each step move to a uniformly random point in a ball of radius \(\delta\) around the current point, accepting the move if the new point is inside the body. The mixing time (number of steps to get close to the uniform distribution) is a polynomial in the dimension \(n\) and the "roundness" of the body (measured by the ratio of outer to inner ellipsoid radii — exactly the John ratio).

The fastest known algorithms (hit-and-run, Dikin walk) mix in time \(\tilde{O}(n^2)\) to \(\tilde{O}(n^3)\) steps, and the KLS conjecture would imply the ball walk mixes in \(\tilde{O}(n^2)\) steps. The theory of Markov chain mixing for log-concave distributions is one of the most active intersections of convex geometry and theoretical computer science.
</div>

---

# Chapter 10: Advanced Topics and Open Problems

This final chapter collects several advanced topics and major open problems, connecting the material of the course to the frontiers of current research.

## 10.1 The Alexandrov-Fenchel Inequality: Full Statement and Proof Sketch

We stated the Alexandrov–Fenchel inequalities in Chapter 4. Here we give more detail.

<div class="theorem">
<strong>Alexandrov–Fenchel Inequality (restated).</strong> For convex bodies \(K_1, K_2, K_3, \ldots, K_n \in \mathbb{R}^n\):

\[
V(K_1, K_2, K_3, \ldots, K_n)^2 \geq V(K_1, K_1, K_3, \ldots, K_n) \cdot V(K_2, K_2, K_3, \ldots, K_n).
\]
</div>

<div class="remark">
<strong>Special cases.</strong>
<ul>
<li>Taking \(K_3 = K_4 = \cdots = K_n = \mathbb{B}^n\) and using \(V(\underbrace{K,\ldots,K}_{n-k},\underbrace{\mathbb{B}^n,\ldots,\mathbb{B}^n}_{k}) \propto W_k(K)\) (quermassintegrals), the Alexandrov–Fenchel inequality specializes to the isoperimetric inequalities \(W_k(K)^2 \geq W_{k-1}(K) W_{k+1}(K)\) — log-concavity of the sequence of quermassintegrals.</li>
<li>Taking \(K_1 = K_2 = K\) and \(K_3 = \cdots = K_n = L\), we get \(V(K,L,L,\ldots,L)^2 \geq V(K,K,L,\ldots,L) \cdot V(L,L,\ldots,L)\), which is the Brunn–Minkowski inequality in its mixed-volume form.</li>
<li>The log-concavity of the sequence \(W_0(K), W_1(K), \ldots, W_n(K)\) specializes to the classical isoperimetric inequality \(W_1(K)^n \geq W_0(K)^{n-1} W_n(K) \cdot \text{(constant)}\) — the surface area raised to a power bounds the volume.</li>
</ul>
</div>

<div class="remark">
<strong>Proof strategy.</strong> Alexandrov's original proof (1937–1938) uses the theory of mixed discriminants and the geometry of the space of convex bodies. A more modern approach (due to Gromov, and later Alesker, Bernstein, and others) uses the theory of mixed Hodge structures and the Hard Lefschetz theorem for intersection cohomology of polytopes — a deep connection to algebraic geometry. The Alexandrov–Fenchel inequality for polytopes is equivalent to the Hard Lefschetz theorem for the corresponding toric variety. This connection, discovered in the 1980s–1990s, is one of the most striking examples of the unity of mathematics.
</div>

## 10.2 The Busemann Intersection Inequality and Dual Brunn–Minkowski

Just as the Brunn–Minkowski inequality governs Minkowski sums, there is a "dual" theory for intersection bodies.

<div class="definition">
<strong>Intersection body.</strong> For a star-shaped body \(K \subset \mathbb{R}^n\) containing the origin, the \emph{intersection body} \(IK\) is the star-shaped body whose radial function satisfies:

\[
\rho_{IK}(u) = \mathrm{Vol}_{n-1}(K \cap u^\perp),
\]
where \(u^\perp = \{x : \langle x, u\rangle = 0\}\) is the hyperplane perpendicular to \(u\).
</div>

<div class="theorem">
<strong>Busemann Intersection Inequality.</strong> For any convex body \(K \subset \mathbb{R}^n\) symmetric about the origin:

\[
\mathrm{Vol}_n(IK) \geq \frac{\omega_n^2}{\omega_{n-1}^2} \cdot \mathrm{Vol}_n(K)^{n-1}/\mathrm{Vol}_n(K).
\]
More precisely, \(\mathrm{Vol}(IK)/\omega_n \geq (\mathrm{Vol}(K)/\omega_n)^{n-1}\), with equality iff \(K\) is an ellipsoid.
</div>

<div class="remark">
<strong>The Busemann–Petty problem.</strong> A natural question: if \(K\) and \(L\) are origin-symmetric convex bodies in \(\mathbb{R}^n\) such that every central hyperplane section of \(K\) is smaller than the corresponding section of \(L\), must \(\mathrm{Vol}(K) \leq \mathrm{Vol}(L)\)? This is the Busemann–Petty problem. The answer is: yes for \(n \leq 4\), no for \(n \geq 5\). The solution used the theory of intersection bodies (the answer is yes iff the unit ball can be written as an intersection body in \(\mathbb{R}^n\), which holds for \(n \leq 4\) but fails for \(n \geq 5\)). This is one of the most celebrated solved problems in convex geometry (completed by Gardner–Koldobsky–Schlumprecht in 1999).
</div>

## 10.3 The Reverse Isoperimetric Inequality and Rogers-Shephard

<div class="theorem">
<strong>Rogers–Shephard Inequality.</strong> For any convex body \(K \subset \mathbb{R}^n\) containing the origin:

\[
\mathrm{Vol}_n(K - K) \leq \binom{2n}{n} \mathrm{Vol}_n(K),
\]
where \(K - K = \{x - y : x, y \in K\}\) is the difference body of \(K\). Equality holds when \(K\) is a simplex.
</div>

<div class="remark">
<strong>Why the difference body matters.</strong> The difference body \(K - K\) is always symmetric (since \(K - K = -(K-K)\)). The Rogers–Shephard inequality says: the volume of the symmetric "spread" of a convex body is at most \(\binom{2n}{n}\) times the volume of the body itself. Since \(\binom{2n}{n} \sim 4^n/\sqrt{\pi n}\), this is an exponential bound — which is tight for the simplex.

The inequality has applications in the geometry of numbers (bounding the number of lattice points in a body), in additive combinatorics (the Freiman–Ruzsa theorem concerns analogous bounds for sumsets), and in the study of covering numbers of convex bodies.
</div>

## 10.3b The Geometry of Convex Position: Erdős–Szekeres and Combinatorial Convexity

The combinatorial side of convex geometry includes beautiful results about point configurations in "convex position."

<div class="definition">
<strong>Convex position.</strong> A finite set of points \(S = \{p_1, \ldots, p_m\}\) in \(\mathbb{R}^2\) is in <em>convex position</em> if no point of \(S\) is in the interior of the convex hull of the others. Equivalently, every point of \(S\) is a vertex of the convex hull of \(S\).
</div>

<div class="theorem">
<strong>Erdős–Szekeres Theorem (Happy Ending Problem).</strong> For any integer \(n \geq 3\), there exists a smallest integer \(ES(n)\) such that any set of at least \(ES(n)\) points in general position in \(\mathbb{R}^2\) contains \(n\) points in convex position. The "happy ending" name comes from the 1935 paper by Esther Klein, Paul Erdős, and George Szekeres, inspired by Klein's observation that any 5 points in general position contain 4 in convex position. (The "ending" is happy because Klein and Szekeres married after working on the problem together.)
</div>

<div class="remark">
<strong>Connection to Ramsey theory and the combinatorial theorems.</strong> The Erdős–Szekeres theorem is a geometric Ramsey theorem: any sufficiently large point set contains a "structured" subset in convex position. The proof uses the Erdős–Szekeres lemma on sequences (any sequence of length \((r-1)(s-1)+1\) contains a monotone subsequence of length \(r\) or \(s\)), applied in a coordinate system. The precise value of \(ES(n)\) is not known; it is conjectured to equal \(2^{n-2}+1\).

The connection to Helly's theorem is deep: both theorems say "small-scale conditions force global structure." Helly says "pairwise \((n+1)\)-fold intersections force global intersection." Erdős–Szekeres says "no three collinear and large enough point set forces convex position." Both are quantitative manifestations of the principle that convexity is a rigid constraint in finite dimensions.
</div>

<div class="remark">
<strong>The First Selection Lemma.</strong> A related result: for any \(m\) points in \(\mathbb{R}^2\), there exists a point \(p \in \mathbb{R}^2\) contained in at least \(\binom{m}{3}/4 + O(m^2)\) of the \(\binom{m}{3}\) triangles formed by the \(m\) points. More generally, in \(\mathbb{R}^n\), there is a "selection lemma" ensuring a point is covered by a constant fraction of the simplices. This is proved using Carathéodory's theorem and a probabilistic argument — it is the quantitative version of Carathéodory, and it is central to discrepancy theory and epsilon-nets in computational geometry.
</div>

## 10.4 Open Problems in Convex Geometry

To conclude, we list several major open problems:

<div class="remark">
<strong>1. The Mahler conjecture.</strong> For symmetric convex bodies, is the minimum Mahler volume \(\mathcal{M}(K) = \mathrm{Vol}(K)\mathrm{Vol}(K^\circ)\) achieved by the cube \([-1,1]^n\)? Known for \(n \leq 3\) and for zonotopes; open in general.
</div>

<div class="remark">
<strong>2. The Bourgain–Milman Reverse Santaló.</strong> The inverse Santaló inequality \(\mathcal{M}(K) \geq (c/n)^n\) for some absolute constant \(c > 0\) was proved by Bourgain and Milman (1987). The sharp constant is the content of the Mahler conjecture.
</div>

<div class="remark">
<strong>3. The KLS conjecture.</strong> As discussed in Section 9.4, the Kannan–Lovász–Simonovits conjecture on the Poincaré constant of log-concave measures is nearly resolved (Chen 2021: \(O(\log n)\) rather than the conjectured \(O(1)\)).
</div>

<div class="remark">
<strong>4. The hyperplane conjecture (slicing problem).</strong> Is there an absolute constant \(c > 0\) such that every convex body \(K \subset \mathbb{R}^n\) of volume 1 has a cross-section with \((n-1)\)-dimensional volume at least \(c\)? Known up to \(O(n^{1/4})\) (Bourgain 1991) and more recently \(O((\log n)^{1/2})\) (Chen 2021). The conjecture is that the constant can be taken independent of \(n\).
</div>

<div class="remark">
<strong>5. Alexandrov-Fenchel for non-convex bodies.</strong> Can the Alexandrov–Fenchel inequality be extended to non-convex (but "nice") sets? Partial extensions exist (e.g., for pseudomanifolds, using Hodge theory), but a complete picture is not known.
</div>
