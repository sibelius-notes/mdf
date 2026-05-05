---
made_up: true
title: "PMATH 856: Geometric Measure Theory"
subjects: "PMATH"
---

*These notes synthesize material from L. Simon's Introduction to Geometric Measure Theory, F. Morgan's Geometric Measure Theory: A Beginner's Guide, L.C. Evans and R.F. Gariepy's Measure Theory and Fine Properties of Functions, and F. Maggi's Sets of Finite Perimeter and Geometric Variational Problems, enriched with material from C. De Lellis's lecture notes and T. De Pauw's survey articles.*

---

## Chapter 1: Hausdorff Measure and Dimension

The classical Lebesgue measure in \(\mathbb{R}^n\) assigns an \(n\)-dimensional volume to measurable subsets of Euclidean space, but it is fundamentally an \(n\)-dimensional tool: it cannot distinguish the "size" of lower-dimensional objects living inside \(\mathbb{R}^n\). A smooth curve in \(\mathbb{R}^3\), for instance, has zero Lebesgue measure, yet clearly has a well-defined length. Felix Hausdorff's groundbreaking 1918 construction remedied this deficiency by introducing a one-parameter family of outer measures \(\mathcal{H}^s\), indexed by a real parameter \(s \geq 0\), that can detect sets of any fractional "dimension." This framework not only subsumes Lebesgue measure and classical notions of length, area, and volume, but also provides the correct language for measuring the size of fractal sets, rectifiable sets, and the singular sets that arise in the calculus of variations.

### 1.1 Outer Measures and Carathéodory's Criterion

We begin by recalling the general framework of outer measures, which provides the foundation for all measure-theoretic constructions in geometric measure theory.

<div class="definition">
An <strong>outer measure</strong> on \(\mathbb{R}^n\) is a function \(\mu^* : \mathcal{P}(\mathbb{R}^n) \to [0, \infty]\) satisfying:
<ol>
<li>\(\mu^*(\varnothing) = 0\),</li>
<li>(Monotonicity) If \(A \subseteq B\), then \(\mu^*(A) \leq \mu^*(B)\),</li>
<li>(Countable subadditivity) For any sequence \(\{A_j\}_{j=1}^\infty\) of subsets of \(\mathbb{R}^n\),

\[
\mu^*\!\left(\bigcup_{j=1}^\infty A_j\right) \leq \sum_{j=1}^\infty \mu^*(A_j).
\]
</li>
</ol>
</div>

Not every subset of \(\mathbb{R}^n\) need be "well-behaved" with respect to an outer measure. Carathéodory's criterion identifies those sets for which the outer measure enjoys full additivity.

<div class="definition">
Let \(\mu^*\) be an outer measure on \(\mathbb{R}^n\). A set \(A \subseteq \mathbb{R}^n\) is said to be <strong>\(\mu^*\)-measurable</strong> (in the sense of Carathéodory) if for every set \(E \subseteq \mathbb{R}^n\),

\[
\mu^*(E) = \mu^*(E \cap A) + \mu^*(E \setminus A).
\]
</div>

<div class="theorem">
<strong>Carathéodory's Theorem.</strong> Let \(\mu^*\) be an outer measure on \(\mathbb{R}^n\). Then the collection \(\mathcal{M}\) of all \(\mu^*\)-measurable sets forms a \(\sigma\)-algebra, and the restriction \(\mu = \mu^*|_{\mathcal{M}}\) is a complete measure.
</div>

A crucial refinement is that outer measures constructed from metric notions automatically render all Borel sets measurable.

<div class="definition">
An outer measure \(\mu^*\) on a metric space \((X, d)\) is called a <strong>metric outer measure</strong> (or a <strong>Borel regular outer measure</strong>) if

\[
\mu^*(A \cup B) = \mu^*(A) + \mu^*(B)
\]
whenever \(\operatorname{dist}(A, B) > 0\).
</div>

<div class="theorem">
<strong>Carathéodory's Metric Criterion.</strong> If \(\mu^*\) is a metric outer measure on \((X, d)\), then every Borel set is \(\mu^*\)-measurable.
</div>

<div class="proof">
It suffices to show that every closed set \(C\) is \(\mu^*\)-measurable. Let \(E \subseteq X\) be arbitrary. Define \(C_k = \{x \in E \setminus C : \operatorname{dist}(x, C) > 1/k\}\). Since \(C\) is closed, \(E \setminus C = \bigcup_{k=1}^\infty C_k\). Moreover, \(\operatorname{dist}(E \cap C, C_k) \geq 1/k > 0\), so by the metric property,

\[
\mu^*(E \cap C) + \mu^*(C_k) = \mu^*((E \cap C) \cup C_k) \leq \mu^*(E).
\]
We set \(D_k = C_{k+1} \setminus C_k\). Then \(E \setminus C = C_1 \cup \bigcup_{k=1}^\infty D_k\), and since \(\operatorname{dist}(D_j, D_k) > 0\) when \(|j - k| \geq 2\), the metric property gives

\[
\mu^*(C_{2m}) \geq \sum_{k=1}^{m} \mu^*(D_{2k}), \quad \mu^*(C_{2m+1}) \geq \sum_{k=0}^{m} \mu^*(D_{2k+1}).
\]
If \(\sum \mu^*(D_k) < \infty\), then \(\mu^*(E \setminus C) \leq \mu^*(C_k) + \sum_{j=k}^\infty \mu^*(D_j) \to \mu^*(E \setminus C)\) as \(k \to \infty\), which yields the desired splitting. If the series diverges, then \(\mu^*(E) \geq \mu^*(C_{2m}) = \infty\), and the splitting holds trivially.
</div>

### 1.2 Hausdorff Measure

With the framework of outer measures in hand, we now define the central object of this chapter. The idea is elegantly simple: to measure the \(s\)-dimensional "size" of a set, cover it by sets of small diameter and sum the \(s\)-th powers of their diameters.

<div class="definition">
Let \(s \geq 0\) and \(\delta > 0\). For any subset \(A \subseteq \mathbb{R}^n\), define the <strong>\(\delta\)-approximate \(s\)-dimensional Hausdorff measure</strong> by

\[
\mathcal{H}^s_\delta(A) = \inf\left\{\sum_{j=1}^\infty \omega_s \left(\frac{\operatorname{diam}(C_j)}{2}\right)^s : A \subseteq \bigcup_{j=1}^\infty C_j,\; \operatorname{diam}(C_j) \leq \delta\right\},
\]
where \(\omega_s = \frac{\pi^{s/2}}{\Gamma(s/2 + 1)}\) is the volume of the unit ball in \(\mathbb{R}^s\) when \(s\) is a positive integer, and is defined by the same formula for all \(s \geq 0\). The <strong>\(s\)-dimensional Hausdorff measure</strong> is

\[
\mathcal{H}^s(A) = \lim_{\delta \to 0^+} \mathcal{H}^s_\delta(A) = \sup_{\delta > 0} \mathcal{H}^s_\delta(A).
\]
</div>

<div class="remark">
The limit exists (possibly as \(+\infty\)) because \(\mathcal{H}^s_\delta(A)\) is non-decreasing as \(\delta \to 0^+\): a smaller \(\delta\) imposes a more restrictive covering condition, so the infimum can only increase. Some authors omit the normalizing constant \(\omega_s\), replacing it with \(1\) or with \(2^{-s}\). Our normalization ensures that \(\mathcal{H}^n\) agrees with Lebesgue measure \(\mathcal{L}^n\) on \(\mathbb{R}^n\), a fact we shall prove shortly.
</div>

<div class="theorem">
For each \(s \geq 0\), the set function \(\mathcal{H}^s\) is a Borel regular outer measure on \(\mathbb{R}^n\). In particular, all Borel sets (and all analytic sets) are \(\mathcal{H}^s\)-measurable.
</div>

<div class="proof">
The properties \(\mathcal{H}^s(\varnothing) = 0\), monotonicity, and countable subadditivity for each \(\mathcal{H}^s_\delta\) follow immediately from the definition. Since these properties are preserved under the supremum over \(\delta\), \(\mathcal{H}^s\) is an outer measure. To verify the metric property, suppose \(\operatorname{dist}(A, B) > 0\) and choose \(\delta < \operatorname{dist}(A, B)/2\). Then any covering of \(A \cup B\) by sets of diameter at most \(\delta\) partitions into disjoint subfamilies covering \(A\) and \(B\) respectively, so \(\mathcal{H}^s_\delta(A \cup B) = \mathcal{H}^s_\delta(A) + \mathcal{H}^s_\delta(B)\). Taking \(\delta \to 0\) gives the metric property. By Carathéodory's metric criterion, every Borel set is \(\mathcal{H}^s\)-measurable. Borel regularity (every set is contained in a Borel set with the same measure) requires a slightly more delicate argument using \(G_\delta\) sets; see Evans-Gariepy, Section 2.1.
</div>

### 1.3 Basic Properties and the Isodiametric Inequality

<div class="proposition">
<strong>Scaling.</strong> For any \(A \subseteq \mathbb{R}^n\) and any \(\lambda > 0\),

\[
\mathcal{H}^s(\lambda A) = \lambda^s \mathcal{H}^s(A).
\]
</div>

<div class="proposition">
<strong>Translation invariance.</strong> For any \(A \subseteq \mathbb{R}^n\) and any \(x \in \mathbb{R}^n\),

\[
\mathcal{H}^s(A + x) = \mathcal{H}^s(A).
\]
</div>

<div class="proposition">
<strong>Countable sets.</strong> If \(A\) is countable, then \(\mathcal{H}^s(A) = 0\) for all \(s > 0\), and \(\mathcal{H}^0(A) = \#A\) (the counting measure).
</div>

The agreement of Hausdorff measure with Lebesgue measure hinges on the isodiametric inequality, which asserts that among all sets of a given diameter, the ball has the greatest volume.

<div class="theorem">
<strong>Isodiametric Inequality.</strong> For any bounded set \(A \subseteq \mathbb{R}^n\),

\[
\mathcal{L}^n(A) \leq \omega_n \left(\frac{\operatorname{diam}(A)}{2}\right)^n.
\]
Equality holds if and only if \(A\) is contained in a ball of diameter \(\operatorname{diam}(A)\).
</div>

<div class="proof">
We use the Steiner symmetrization argument. For a set \(A \subseteq \mathbb{R}^n\) and a hyperplane \(H\), the Steiner symmetrization \(\sigma_H(A)\) replaces each line segment \(A \cap \ell\) (where \(\ell\) is perpendicular to \(H\)) by a segment of the same length centered on \(H\). By Fubini's theorem, \(\mathcal{L}^n(\sigma_H(A)) = \mathcal{L}^n(A)\). Moreover, one verifies that \(\operatorname{diam}(\sigma_H(A)) \leq \operatorname{diam}(A)\) using the Brunn-Minkowski inequality or a direct geometric argument. Iterating Steiner symmetrizations with respect to a dense sequence of hyperplanes, the symmetrized sets converge (in the Hausdorff metric on compact sets) to a ball of diameter at most \(\operatorname{diam}(A)\), while the Lebesgue measure is preserved at each step. This yields the inequality.
</div>

<div class="theorem">
<strong>Agreement with Lebesgue Measure.</strong> On \(\mathbb{R}^n\), we have \(\mathcal{H}^n = \mathcal{L}^n\).
</div>

<div class="proof">
For any Borel set \(A \subseteq \mathbb{R}^n\), the covering definition gives \(\mathcal{H}^n(A) \leq \mathcal{L}^n(A)\) by using a covering of \(A\) by small cubes and applying the isodiametric inequality. Conversely, by the Vitali covering lemma, given any covering of \(A\) by sets \(\{C_j\}\) with \(\operatorname{diam}(C_j) \leq \delta\), we have \(\mathcal{L}^n(A) \leq \mathcal{L}^n(\bigcup C_j) \leq \sum \mathcal{L}^n(\overline{C_j}) \leq \sum \omega_n (\operatorname{diam}(C_j)/2)^n\), where the last step is the isodiametric inequality. Taking the infimum over coverings gives \(\mathcal{L}^n(A) \leq \mathcal{H}^n_\delta(A)\), and letting \(\delta \to 0\) gives \(\mathcal{L}^n(A) \leq \mathcal{H}^n(A)\).
</div>

### 1.4 Hausdorff Dimension

One of the most striking features of Hausdorff measure is the existence of a critical dimension at which the measure "jumps" from infinity to zero.

<div class="proposition">
Let \(A \subseteq \mathbb{R}^n\). If \(\mathcal{H}^s(A) < \infty\) for some \(s \geq 0\), then \(\mathcal{H}^t(A) = 0\) for all \(t > s\). If \(\mathcal{H}^s(A) > 0\) for some \(s \geq 0\), then \(\mathcal{H}^t(A) = \infty\) for all \(0 \leq t < s\).
</div>

<div class="proof">
Suppose \(\mathcal{H}^s(A) < \infty\). For \(t > s\) and any \(\delta\)-covering \(\{C_j\}\) of \(A\), we have

\[
\sum_j \left(\frac{\operatorname{diam}(C_j)}{2}\right)^t \leq \delta^{t-s} \sum_j \left(\frac{\operatorname{diam}(C_j)}{2}\right)^s.
\]
Taking the infimum and then \(\delta \to 0\) gives \(\mathcal{H}^t(A) \leq \lim_{\delta \to 0} \delta^{t-s} \cdot C = 0\) (after adjusting normalizing constants). The second statement follows by contrapositive.
</div>

<div class="definition">
The <strong>Hausdorff dimension</strong> of a set \(A \subseteq \mathbb{R}^n\) is

\[
\dim_H(A) = \inf\{s \geq 0 : \mathcal{H}^s(A) = 0\} = \sup\{s \geq 0 : \mathcal{H}^s(A) = \infty\}.
\]
At the critical value \(s = \dim_H(A)\), the measure \(\mathcal{H}^s(A)\) can be \(0\), \(\infty\), or any value in between.
</div>

<div class="remark">
The Hausdorff dimension satisfies the following basic properties:
<ul>
<li>Monotonicity: \(A \subseteq B \implies \dim_H(A) \leq \dim_H(B)\).</li>
<li>Countable stability: \(\dim_H(\bigcup_{j=1}^\infty A_j) = \sup_j \dim_H(A_j)\).</li>
<li>For \(A \subseteq \mathbb{R}^n\), we have \(0 \leq \dim_H(A) \leq n\).</li>
<li>Open sets in \(\mathbb{R}^n\) have Hausdorff dimension \(n\).</li>
<li>Smooth \(m\)-dimensional submanifolds of \(\mathbb{R}^n\) have Hausdorff dimension \(m\).</li>
</ul>
</div>

### 1.5 Examples: Cantor Set and Self-Similar Fractals

The power of Hausdorff dimension is most vividly illustrated by computing it for classical fractal sets.

<div class="example">
<strong>The Middle-Thirds Cantor Set.</strong> Let \(C_0 = [0,1]\) and define \(C_{k+1}\) by removing the open middle third of each interval in \(C_k\). The <strong>Cantor set</strong> is \(C = \bigcap_{k=0}^\infty C_k\). At stage \(k\), \(C_k\) consists of \(2^k\) closed intervals, each of length \(3^{-k}\).

We claim \(\dim_H(C) = \frac{\log 2}{\log 3}\). Let \(s = \frac{\log 2}{\log 3}\), so that \(2 = 3^s\), i.e., \(2 \cdot 3^{-s} = 1\).

<em>Upper bound.</em> The \(2^k\) intervals of \(C_k\) form a \(\delta\)-covering with \(\delta = 3^{-k}\). Thus

\[
\mathcal{H}^s_{3^{-k}}(C) \leq 2^k \cdot \omega_s \left(\frac{3^{-k}}{2}\right)^s = \omega_s \cdot 2^{-s} \cdot (2 \cdot 3^{-s})^k = \omega_s \cdot 2^{-s},
\]
which is bounded independently of \(k\). Hence \(\mathcal{H}^s(C) \leq \omega_s \cdot 2^{-s} < \infty\), giving \(\dim_H(C) \leq s\).

<em>Lower bound.</em> We use the mass distribution principle. The natural probability measure \(\mu\) on \(C\), assigning mass \(2^{-k}\) to each interval of \(C_k\), satisfies \(\mu(B(x,r)) \leq C r^s\) for all \(x \in C\) and \(r > 0\), where \(C\) is a constant. By the mass distribution principle (or Frostman's lemma), this implies \(\mathcal{H}^s(C) > 0\), hence \(\dim_H(C) \geq s\).

Therefore \(\dim_H(C) = \frac{\log 2}{\log 3} \approx 0.6309\).
</div>

The computation above generalizes to a broad class of self-similar fractals via the following theorem, due to Moran (1946) and later refined by Hutchinson (1981).

<div class="theorem">
<strong>Moran-Hutchinson Theorem.</strong> Let \(f_1, \ldots, f_N : \mathbb{R}^n \to \mathbb{R}^n\) be contracting similitudes with ratios \(r_1, \ldots, r_N \in (0,1)\), and let \(K\) be the unique nonempty compact set (the <strong>attractor</strong> or <strong>self-similar set</strong>) satisfying

\[
K = \bigcup_{i=1}^N f_i(K).
\]
If the <strong>open set condition</strong> holds (there exists a nonempty bounded open set \(U\) with \(f_i(U) \subseteq U\) and \(f_i(U) \cap f_j(U) = \varnothing\) for \(i \neq j\)), then \(\dim_H(K) = s\), where \(s\) is the unique solution to the <strong>Moran equation</strong>

\[
\sum_{i=1}^N r_i^s = 1.
\]
Moreover, \(0 < \mathcal{H}^s(K) < \infty\).
</div>

<div class="example">
<strong>The Koch Snowflake Curve.</strong> The Koch curve is the attractor of four similitudes, each with ratio \(r = 1/3\). The Moran equation gives \(4 \cdot (1/3)^s = 1\), hence

\[
\dim_H(\text{Koch curve}) = \frac{\log 4}{\log 3} \approx 1.2619.
\]
The Koch snowflake (the boundary of the region enclosed by three Koch curves) has the same Hausdorff dimension \(\frac{\log 4}{\log 3}\). It is a continuous curve of infinite length that encloses a finite area.
</div>

<div class="example">
<strong>The Sierpiński Triangle.</strong> This is the attractor of three similitudes with ratio \(1/2\). The Moran equation gives \(3 \cdot (1/2)^s = 1\), so

\[
\dim_H(\text{Sierpiński triangle}) = \frac{\log 3}{\log 2} \approx 1.585.
\]
</div>

### 1.6 Density Theorems

Density results relate the local behavior of a measure to its global structure. They play a fundamental role in the theory of rectifiability.

<div class="definition">
Let \(\mu\) be a Radon measure on \(\mathbb{R}^n\) and let \(s \geq 0\). The <strong>upper</strong> and <strong>lower \(s\)-dimensional densities</strong> of \(\mu\) at a point \(x \in \mathbb{R}^n\) are

\[
\Theta^{*s}(\mu, x) = \limsup_{r \to 0^+} \frac{\mu(B(x,r))}{\omega_s r^s}, \qquad \Theta_*^s(\mu, x) = \liminf_{r \to 0^+} \frac{\mu(B(x,r))}{\omega_s r^s}.
\]
If these are equal, we write \(\Theta^s(\mu, x)\) for the common value and call it the <strong>\(s\)-density</strong> of \(\mu\) at \(x\).
</div>

<div class="theorem">
<strong>Upper Density Estimate.</strong> Let \(A \subseteq \mathbb{R}^n\) be \(\mathcal{H}^s\)-measurable with \(\mathcal{H}^s(A) < \infty\). Then

\[
\Theta^{*s}(\mathcal{H}^s \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} A, x) \leq 1 \quad \text{for } \mathcal{H}^s\text{-a.e. } x \in A,
\]
and

\[
2^{-s} \leq \Theta^{*s}(\mathcal{H}^s \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} A, x) \quad \text{for } \mathcal{H}^s\text{-a.e. } x \in A.
\]
</div>

<div class="remark">
In the integer-dimensional case where \(s = m\) is a positive integer and \(A\) is an \(m\)-rectifiable set (as defined in Chapter 3), the density \(\Theta^m(\mathcal{H}^m \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} A, x) = 1\) for \(\mathcal{H}^m\)-a.e. \(x \in A\). This is a deep fact that lies at the heart of the characterization of rectifiable sets.
</div>

### 1.7 Marstrand's Projection Theorem

John Marstrand proved in 1954 a fundamental result about how Hausdorff dimension behaves under orthogonal projections. This theorem reveals a deep connection between the dimension of a set and its "visibility" from different directions.

<div class="definition">
For \(\theta \in [0, \pi)\), let \(\pi_\theta : \mathbb{R}^2 \to \mathbb{R}\) denote the orthogonal projection onto the line through the origin making angle \(\theta\) with the horizontal axis:

\[
\pi_\theta(x_1, x_2) = x_1 \cos\theta + x_2 \sin\theta.
\]
More generally, for \(V \in G(n, m)\) (the Grassmannian of \(m\)-dimensional linear subspaces of \(\mathbb{R}^n\)), let \(\pi_V : \mathbb{R}^n \to V\) be the orthogonal projection.
</div>

<div class="theorem">
<strong>Marstrand's Projection Theorem (1954).</strong> Let \(A \subseteq \mathbb{R}^2\) be a Borel set.
<ol>
<li>If \(\dim_H(A) \leq 1\), then \(\dim_H(\pi_\theta(A)) = \dim_H(A)\) for \(\mathcal{L}^1\)-a.e. \(\theta \in [0, \pi)\).</li>
<li>If \(\dim_H(A) > 1\), then \(\mathcal{L}^1(\pi_\theta(A)) > 0\) for \(\mathcal{L}^1\)-a.e. \(\theta \in [0, \pi)\).</li>
</ol>
</div>

<div class="remark">
Marstrand's result was generalized to higher dimensions by Mattila (1975): if \(A \subseteq \mathbb{R}^n\) is Borel and \(V \in G(n,m)\), then for \(\gamma_{n,m}\)-a.e. \(V\) (where \(\gamma_{n,m}\) is the natural invariant measure on the Grassmannian), \(\dim_H(\pi_V(A)) = \min(\dim_H(A), m)\).
</div>

<div class="proof">
<strong>Proof sketch (case \(\dim_H(A) \leq 1\)).</strong> The upper bound \(\dim_H(\pi_\theta(A)) \leq \dim_H(A)\) holds for all \(\theta\), since projections are Lipschitz with constant 1 and Lipschitz maps cannot increase Hausdorff dimension. For the lower bound, one uses the <strong>energy method</strong>: define the \(s\)-energy of a measure \(\mu\) by

\[
I_s(\mu) = \int\!\!\int \frac{d\mu(x)\, d\mu(y)}{|x - y|^s}.
\]
If \(I_s(\mu) < \infty\) for some \(\mu\) supported on \(A\), then \(\dim_H(A) \geq s\). One shows that the projected measures \((\pi_\theta)_\# \mu\) have finite \(s\)-energy for a.e. \(\theta\) by integrating over \(\theta\) and using the explicit kernel computation. This yields the a.e. lower bound on the dimension of the projection.
</div>

---

## Chapter 2: Lipschitz Functions and Rectifiability

Lipschitz functions occupy a central position in geometric measure theory: they are the natural morphisms of the theory, playing a role analogous to smooth maps in differential geometry but requiring far less regularity. The fundamental theorems of this chapter — Rademacher's theorem on almost everywhere differentiability, the area formula, and the coarea formula — provide the technical backbone for all subsequent developments.

### 2.1 Lipschitz Maps: Basic Properties

<div class="definition">
A map \(f : A \to \mathbb{R}^m\), where \(A \subseteq \mathbb{R}^n\), is <strong>Lipschitz</strong> if there exists a constant \(L \geq 0\) such that

\[
|f(x) - f(y)| \leq L|x - y| \quad \text{for all } x, y \in A.
\]
The infimum of all such constants \(L\) is the <strong>Lipschitz constant</strong> of \(f\), denoted \(\operatorname{Lip}(f)\).
</div>

<div class="proposition">
Let \(f : \mathbb{R}^n \to \mathbb{R}^m\) be Lipschitz with constant \(L\). Then:
<ol>
<li>\(f\) maps sets of \(\mathcal{L}^n\)-measure zero to sets of \(\mathcal{H}^n\)-measure zero (the Lusin \(N\)-property).</li>
<li>\(\operatorname{diam}(f(A)) \leq L \cdot \operatorname{diam}(A)\) for all \(A \subseteq \mathbb{R}^n\).</li>
<li>\(\mathcal{H}^s(f(A)) \leq L^s \mathcal{H}^s(A)\) for all \(A \subseteq \mathbb{R}^n\) and all \(s \geq 0\).</li>
<li>In particular, \(\dim_H(f(A)) \leq \dim_H(A)\).</li>
</ol>
</div>

<div class="theorem">
<strong>Kirszbraun's Extension Theorem (1934).</strong> Let \(A \subseteq \mathbb{R}^n\) and \(f : A \to \mathbb{R}^m\) be Lipschitz with constant \(L\). Then there exists a Lipschitz extension \(\tilde{f} : \mathbb{R}^n \to \mathbb{R}^m\) with \(\operatorname{Lip}(\tilde{f}) = L\).
</div>

<div class="remark">
Kirszbraun's theorem is remarkable in that it preserves the exact Lipschitz constant. For real-valued functions (i.e., \(m = 1\)), the classical McShane-Whitney extension

\[
\tilde{f}(x) = \inf_{a \in A}\{f(a) + L|x - a|\}
\]
gives the result with an elementary proof. The general vector-valued case is considerably deeper and uses a Zorn's lemma argument combined with the geometry of Hilbert spaces.
</div>

### 2.2 Rademacher's Theorem

The following theorem, proved by Hans Rademacher in 1919, is one of the most important results in real analysis and is indispensable for geometric measure theory.

<div class="theorem">
<strong>Rademacher's Theorem (1919).</strong> Let \(f : \mathbb{R}^n \to \mathbb{R}^m\) be Lipschitz. Then \(f\) is differentiable \(\mathcal{L}^n\)-almost everywhere. That is, for \(\mathcal{L}^n\)-a.e. \(x \in \mathbb{R}^n\), there exists a linear map \(Df(x) : \mathbb{R}^n \to \mathbb{R}^m\) such that

\[
\lim_{y \to x} \frac{|f(y) - f(x) - Df(x)(y - x)|}{|y - x|} = 0.
\]
</div>

<div class="proof">
We give the proof for the case \(m = 1\); the general case follows by applying the scalar result to each component.

<em>Step 1.</em> We first show that directional derivatives exist a.e. For a unit vector \(e \in S^{n-1}\), the function \(t \mapsto f(x + te)\) is Lipschitz on \(\mathbb{R}\), hence differentiable for \(\mathcal{L}^1\)-a.e. \(t\). By Fubini's theorem, the directional derivative \(\partial_e f(x) = \lim_{t \to 0} \frac{f(x + te) - f(x)}{t}\) exists for \(\mathcal{L}^n\)-a.e. \(x\).

<em>Step 2.</em> Let \(\{e_1, \ldots, e_n\}\) be the standard basis. The partial derivatives \(\partial_{e_i} f\) exist \(\mathcal{L}^n\)-a.e. by Step 1. Fix a countable dense set \(D \subseteq S^{n-1}\). By taking a countable intersection, the directional derivative \(\partial_v f(x)\) exists for all \(v \in D\) simultaneously, for \(\mathcal{L}^n\)-a.e. \(x\).

<em>Step 3.</em> At such a point \(x\), the directional derivative \(\partial_v f(x)\) depends linearly on \(v\) for \(v \in D\) (this follows from the chain rule applied to restrictions to lines, and the Lipschitz bound). Since \(D\) is dense and \(|\partial_v f(x)| \leq L\) for all \(v\), the map \(v \mapsto \partial_v f(x)\) extends uniquely to a bounded linear functional on \(\mathbb{R}^n\), giving the differential \(Df(x)\).

<em>Step 4.</em> It remains to show that this linear map actually gives the derivative, i.e., that \(|f(y) - f(x) - Df(x)(y-x)| = o(|y-x|)\). This is the hardest step. One uses the maximal function estimate: the set where the directional derivative exists but the full derivative does not has measure zero, which can be shown using the Lebesgue differentiation theorem applied to the distributional gradient.
</div>

### 2.3 The Area Formula

The area formula is the natural generalization of the change-of-variables formula to Lipschitz maps, and it computes the Hausdorff measure of the image of a Lipschitz map in terms of the Jacobian.

<div class="definition">
For a linear map \(L : \mathbb{R}^n \to \mathbb{R}^m\) with \(n \leq m\), the <strong>Jacobian</strong> is

\[
J_n L = \sqrt{\det(L^* L)},
\]
where \(L^* : \mathbb{R}^m \to \mathbb{R}^n\) is the adjoint. Equivalently, \(J_n L\) is the \(n\)-dimensional volume of \(L(Q)\), where \(Q\) is the unit cube in \(\mathbb{R}^n\), or equivalently the product of the singular values of \(L\).
</div>

<div class="theorem">
<strong>Area Formula.</strong> Let \(f : \mathbb{R}^n \to \mathbb{R}^m\) be Lipschitz, with \(n \leq m\). Then for every \(\mathcal{L}^n\)-measurable set \(A \subseteq \mathbb{R}^n\),

\[
\int_A J_n Df(x)\, d\mathcal{L}^n(x) = \int_{\mathbb{R}^m} \mathcal{H}^0(A \cap f^{-1}(\{y\}))\, d\mathcal{H}^n(y).
\]
In particular, if \(f\) is injective on \(A\),

\[
\int_A J_n Df(x)\, d\mathcal{L}^n(x) = \mathcal{H}^n(f(A)).
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> The proof proceeds in several stages.

<em>Stage 1: Linear maps.</em> For a linear map \(L : \mathbb{R}^n \to \mathbb{R}^m\), the formula reduces to \(\mathcal{H}^n(L(A)) = J_n L \cdot \mathcal{L}^n(A)\), which follows from the polar decomposition \(L = O \circ S\) where \(O\) is an isometry and \(S\) is symmetric.

<em>Stage 2: Approximation.</em> By Rademacher's theorem, \(f\) is differentiable a.e. On the set where \(Df(x)\) exists and is injective, the implicit function theorem (suitably generalized) ensures that \(f\) is locally "almost linear." We decompose \(A\) into countably many pieces \(\{A_k\}\) on which \(Df\) is approximately constant, apply the linear case to each piece with controlled error, and sum.

<em>Stage 3: The critical set.</em> On the set \(\{x : J_n Df(x) = 0\}\), one must show \(\mathcal{H}^n(f(\{J_n Df = 0\})) = 0\). This is the content of a Sard-type theorem for Lipschitz maps.

<em>Stage 4: Multiplicity.</em> The general formula (without injectivity) follows by a disintegration argument, decomposing \(A\) into level sets \(A \cap f^{-1}(\{y\})\).
</div>

<div class="example">
<strong>Surface area of a graph.</strong> Let \(g : U \to \mathbb{R}\) be Lipschitz, where \(U \subseteq \mathbb{R}^n\) is open. The graph map \(f : U \to \mathbb{R}^{n+1}\) defined by \(f(x) = (x, g(x))\) is Lipschitz and injective. One computes \(Df(x) = \begin{pmatrix} I_n \\ \nabla g(x)^T \end{pmatrix}\), so

\[
J_n Df(x) = \sqrt{\det(I_n + \nabla g(x) \otimes \nabla g(x))} = \sqrt{1 + |\nabla g(x)|^2}.
\]
The area formula gives

\[
\mathcal{H}^n(\operatorname{graph}(g)) = \int_U \sqrt{1 + |\nabla g(x)|^2}\, dx,
\]
recovering the classical formula for surface area.
</div>

### 2.4 The Coarea Formula

The coarea formula is a far-reaching generalization of Fubini's theorem that relates integration over a domain to integration over level sets. It goes in the opposite direction from the area formula: instead of mapping \(\mathbb{R}^n\) into a higher-dimensional space, we project down.

<div class="definition">
For a linear map \(L : \mathbb{R}^n \to \mathbb{R}^m\) with \(n \geq m\), the <strong>coarea factor</strong> is

\[
J_m L = \sqrt{\det(L L^*)},
\]
which equals the product of the \(m\) largest singular values of \(L\), or equivalently the \(m\)-dimensional volume of \(L(Q)\) where \(Q\) is the unit cube in \(\mathbb{R}^n\) (suitably interpreted).
</div>

<div class="theorem">
<strong>Coarea Formula.</strong> Let \(f : \mathbb{R}^n \to \mathbb{R}^m\) be Lipschitz with \(n \geq m\). Then for every \(\mathcal{L}^n\)-measurable function \(g : \mathbb{R}^n \to [0, \infty]\),

\[
\int_{\mathbb{R}^n} g(x) J_m Df(x)\, d\mathcal{L}^n(x) = \int_{\mathbb{R}^m}\left(\int_{f^{-1}(\{y\})} g(x)\, d\mathcal{H}^{n-m}(x)\right) d\mathcal{L}^m(y).
\]
</div>

<div class="example">
<strong>The classical coarea formula.</strong> When \(m = 1\) and \(f : \mathbb{R}^n \to \mathbb{R}\) is Lipschitz, we have \(J_1 Df(x) = |\nabla f(x)|\), and the coarea formula becomes

\[
\int_{\mathbb{R}^n} g(x) |\nabla f(x)|\, dx = \int_{-\infty}^{\infty} \left(\int_{\{f = t\}} g\, d\mathcal{H}^{n-1}\right) dt.
\]
Taking \(g = |\nabla f|^{-1} \chi_A\) (where \(|\nabla f| > 0\)), this gives

\[
\mathcal{L}^n(A) = \int_{-\infty}^{\infty} \int_{\{f = t\} \cap A} \frac{1}{|\nabla f|}\, d\mathcal{H}^{n-1}\, dt,
\]
a generalized Cavalieri principle. For the distance function \(f(x) = |x|\), the level sets are spheres and we recover the polar coordinates formula.
</div>

<div class="remark">
The area and coarea formulas together form the pillars of integration theory in geometric measure theory. The area formula tells us how to compute the measure of the image of a Lipschitz map, while the coarea formula tells us how to disintegrate a measure along the fibers of a Lipschitz map. The interplay between these two formulas drives much of the technical machinery in the theory of rectifiable sets and currents.
</div>

---

## Chapter 3: Rectifiable Sets and Measures

The notion of rectifiability provides a measure-theoretic generalization of smooth submanifolds. A rectifiable set is, roughly, one that can be covered — up to a set of measure zero — by countably many Lipschitz images of Euclidean space. This chapter develops the theory of rectifiable sets, their tangent structure, and the deep Besicovitch-Federer projection theorem that characterizes purely unrectifiable sets.

### 3.1 Countably Rectifiable Sets

<div class="definition">
A set \(E \subseteq \mathbb{R}^n\) is <strong>countably \(m\)-rectifiable</strong> (or simply <strong>\(m\)-rectifiable</strong>) if there exist Lipschitz maps \(f_j : \mathbb{R}^m \to \mathbb{R}^n\), \(j = 1, 2, \ldots\), such that

\[
\mathcal{H}^m\!\left(E \setminus \bigcup_{j=1}^\infty f_j(\mathbb{R}^m)\right) = 0.
\]
Equivalently (using the area formula and Rademacher's theorem), \(E\) is \(m\)-rectifiable if and only if there exist \(C^1\) maps \(g_j : \mathbb{R}^m \to \mathbb{R}^n\) such that \(\mathcal{H}^m(E \setminus \bigcup_j g_j(\mathbb{R}^m)) = 0\). This equivalence is non-trivial and relies on Whitney's extension theorem.
</div>

<div class="definition">
A set \(E \subseteq \mathbb{R}^n\) with \(\mathcal{H}^m(E) < \infty\) is <strong>purely \(m\)-unrectifiable</strong> if it contains no \(m\)-rectifiable subset of positive \(\mathcal{H}^m\)-measure. Equivalently, \(\mathcal{H}^m(E \cap f(\mathbb{R}^m)) = 0\) for every Lipschitz map \(f : \mathbb{R}^m \to \mathbb{R}^n\).
</div>

<div class="theorem">
<strong>Rectifiable-Unrectifiable Decomposition.</strong> Let \(E \subseteq \mathbb{R}^n\) with \(\mathcal{H}^m(E) < \infty\). Then there is a unique decomposition \(E = E_{\mathrm{rect}} \cup E_{\mathrm{unrect}}\) (up to \(\mathcal{H}^m\)-null sets) where \(E_{\mathrm{rect}}\) is \(m\)-rectifiable and \(E_{\mathrm{unrect}}\) is purely \(m\)-unrectifiable.
</div>

<div class="example">
<strong>Rectifiable sets.</strong>
<ul>
<li>Any \(C^1\) \(m\)-dimensional submanifold of \(\mathbb{R}^n\) (or countable union thereof) is \(m\)-rectifiable.</li>
<li>The graph of any Lipschitz function \(g : \mathbb{R}^m \to \mathbb{R}^{n-m}\) is \(m\)-rectifiable.</li>
<li>Any countable set is \(0\)-rectifiable.</li>
</ul>
</div>

<div class="example">
<strong>Purely unrectifiable sets.</strong> The product \(C \times C\) of two copies of the middle-thirds Cantor set in \(\mathbb{R}^2\) is purely \(1\)-unrectifiable (despite having Hausdorff dimension \(\frac{2\log 2}{\log 3} \approx 1.26 > 1\)). Any set of Hausdorff dimension strictly less than \(m\) is trivially purely \(m\)-unrectifiable.
</div>

### 3.2 Tangent Planes and Approximate Tangent Planes

For smooth submanifolds, the tangent space at a point is defined via the derivative of a parametrization. For rectifiable sets, we need a measure-theoretic substitute.

<div class="definition">
Let \(E \subseteq \mathbb{R}^n\) be \(\mathcal{H}^m\)-measurable with \(\mathcal{H}^m(E) < \infty\). An \(m\)-dimensional plane \(V + a\) (where \(V \in G(n,m)\) and \(a \in \mathbb{R}^n\)) is an <strong>approximate tangent plane</strong> to \(E\) at \(a \in E\) if

\[
\lim_{r \to 0^+} r^{-m} \mathcal{H}^m(E \cap B(a, r) \cap \{x : |(x-a) - \pi_V(x-a)| > \epsilon |x-a|\}) = 0
\]
for every \(\epsilon > 0\). Equivalently, the rescaled sets \(r^{-1}(E - a)\) converge in a measure-theoretic sense to \(V\).
</div>

<div class="theorem">
<strong>Existence of Approximate Tangent Planes.</strong> Let \(E \subseteq \mathbb{R}^n\) be \(m\)-rectifiable with \(\mathcal{H}^m(E) < \infty\). Then \(E\) has a unique approximate tangent plane \(\operatorname{Tan}^m(E, a)\) at \(\mathcal{H}^m\)-a.e. \(a \in E\).
</div>

<div class="proof">
Since \(E\) is \(m\)-rectifiable, it can be covered (up to an \(\mathcal{H}^m\)-null set) by countably many Lipschitz images \(f_j(\mathbb{R}^m)\). By Rademacher's theorem, each \(f_j\) is differentiable a.e. At a point \(a = f_j(x_0)\) where \(Df_j(x_0)\) exists and has rank \(m\), the image of \(Df_j(x_0)\) gives an \(m\)-dimensional plane that is the approximate tangent plane to \(f_j(\mathbb{R}^m)\) at \(a\). The area formula ensures that these tangent planes are well-defined and independent of the parametrization chosen.
</div>

### 3.3 Characterizations of Rectifiability

One of the great achievements of geometric measure theory is the multitude of equivalent characterizations of rectifiability. These connect geometric, analytic, and measure-theoretic viewpoints.

<div class="theorem">
<strong>Characterizations of \(m\)-Rectifiability.</strong> Let \(E \subseteq \mathbb{R}^n\) be \(\mathcal{H}^m\)-measurable with \(0 < \mathcal{H}^m(E) < \infty\). The following are equivalent:
<ol>
<li>(Parametric) \(E\) is \(m\)-rectifiable.</li>
<li>(Tangent) \(E\) has an approximate \(m\)-dimensional tangent plane at \(\mathcal{H}^m\)-a.e. point.</li>
<li>(Density) \(\Theta^m(\mathcal{H}^m \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} E, x) = 1\) for \(\mathcal{H}^m\)-a.e. \(x \in E\).</li>
<li>(Projection) For every \(V \in G(n,m)\), \(\mathcal{H}^m(\pi_V(E)) > 0\) (i.e., \(E\) projects onto a set of positive measure in almost every \(m\)-plane).</li>
</ol>
</div>

<div class="remark">
The equivalence (1) \(\Leftrightarrow\) (3) is due to Besicovitch (for \(m = 1\), \(n = 2\)) and Marstrand, Mattila, and Preiss in general. The density characterization (3) is particularly remarkable: it says that a set is rectifiable if and only if it "looks flat at small scales" in the measure-theoretic sense. Preiss's 1987 proof of this result for general \(m\) is one of the deepest in the field.
</div>

### 3.4 The Besicovitch-Federer Projection Theorem

The following theorem, conjectured by Besicovitch and proved by Federer (1947), provides a striking geometric characterization of purely unrectifiable sets via their projections.

<div class="theorem">
<strong>Besicovitch-Federer Projection Theorem.</strong> Let \(E \subseteq \mathbb{R}^n\) be \(\mathcal{H}^m\)-measurable with \(\mathcal{H}^m(E) < \infty\). Then \(E\) is purely \(m\)-unrectifiable if and only if

\[
\mathcal{H}^m(\pi_V(E)) = 0 \quad \text{for } \gamma_{n,m}\text{-a.e. } V \in G(n,m).
\]
</div>

<div class="remark">
This theorem says that a purely unrectifiable set is "invisible" from almost every direction: its projection onto almost every \(m\)-dimensional plane has zero \(m\)-dimensional measure. This is a remarkable dichotomy: either a set has enough regularity to project onto positive-measure subsets (the rectifiable case), or it is so "scattered" that almost all projections collapse it to a null set.
</div>

<div class="example">
The set \(C \times C \subseteq \mathbb{R}^2\), where \(C\) is the middle-thirds Cantor set, is purely \(1\)-unrectifiable. By the Besicovitch-Federer theorem, \(\mathcal{H}^1(\pi_\theta(C \times C)) = 0\) for a.e. \(\theta\). This is remarkable because \(\dim_H(C \times C) = \frac{2\log 2}{\log 3} > 1\), so the set is "large" in terms of Hausdorff dimension, yet it projects to a null set in almost every direction.
</div>

### 3.5 Rectifiable Measures

<div class="definition">
A Radon measure \(\mu\) on \(\mathbb{R}^n\) is <strong>\(m\)-rectifiable</strong> if:
<ol>
<li>\(\mu\) is absolutely continuous with respect to \(\mathcal{H}^m\), and</li>
<li>\(\mu\) is concentrated on an \(m\)-rectifiable set, i.e., there exists an \(m\)-rectifiable set \(E\) such that \(\mu(\mathbb{R}^n \setminus E) = 0\).</li>
</ol>
Equivalently, \(\mu = \theta \mathcal{H}^m \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} E\) for some \(m\)-rectifiable set \(E\) and some locally \(\mathcal{H}^m\)-integrable function \(\theta : E \to (0, \infty)\), called the <strong>multiplicity function</strong>.
</div>

<div class="theorem">
<strong>Preiss's Theorem (1987).</strong> A Radon measure \(\mu\) on \(\mathbb{R}^n\) is \(m\)-rectifiable (with integer multiplicity) if and only if the \(m\)-density \(\Theta^m(\mu, x)\) exists and is a positive integer for \(\mu\)-a.e. \(x\).
</div>

<div class="remark">
Preiss's theorem is a tour de force that resolved a long-standing conjecture. It requires an extraordinarily delicate analysis of tangent measures — the measures obtained as weak limits of rescaled versions of \(\mu\) around a point. The key difficulty is to show that a measure with integer densities everywhere must be supported on a rectifiable set.
</div>

---

## Chapter 4: Currents

The theory of currents, developed by Georges de Rham and vastly extended by Herbert Federer and Wendell Fleming in their landmark 1960 paper, provides a powerful framework for studying generalized surfaces with boundaries. Currents can be thought of as "distributions acting on differential forms" — a linearized, measure-theoretic substitute for oriented submanifolds. The Federer-Fleming compactness theorem for integral currents is the key tool that enables the solution of Plateau's problem in all dimensions.

### 4.1 Differential Forms and Multivectors

We begin by recalling the algebraic preliminaries.

<div class="definition">
Let \(V = \mathbb{R}^n\). The space of <strong>\(k\)-vectors</strong> is the exterior power \(\Lambda_k(\mathbb{R}^n) = \Lambda^k V\), the vector space spanned by elements of the form

\[
v_1 \wedge v_2 \wedge \cdots \wedge v_k, \quad v_i \in \mathbb{R}^n.
\]
Its dimension is \(\binom{n}{k}\). Elements of \(\Lambda_k(\mathbb{R}^n)\) are called <strong>\(k\)-vectors</strong>; those of the form \(v_1 \wedge \cdots \wedge v_k\) are called <strong>simple</strong> (or <strong>decomposable</strong>) \(k\)-vectors. The inner product on \(\Lambda_k(\mathbb{R}^n)\) is defined by

\[
\langle v_1 \wedge \cdots \wedge v_k, w_1 \wedge \cdots \wedge w_k \rangle = \det(\langle v_i, w_j \rangle)_{i,j}.
\]
The induced norm is \(|\xi| = \sqrt{\langle \xi, \xi \rangle}\).
</div>

<div class="definition">
The space of <strong>\(k\)-covectors</strong> (or <strong>exterior \(k\)-forms</strong>) is \(\Lambda^k(\mathbb{R}^n) = (\Lambda_k(\mathbb{R}^n))^*\). A <strong>differential \(k\)-form</strong> on an open set \(U \subseteq \mathbb{R}^n\) is a map \(\omega : U \to \Lambda^k(\mathbb{R}^n)\). In coordinates with basis \(\{e^{i_1} \wedge \cdots \wedge e^{i_k}\}\),

\[
\omega(x) = \sum_{I} \omega_I(x)\, dx^{i_1} \wedge \cdots \wedge dx^{i_k},
\]
where the sum is over increasing multi-indices \(I = (i_1 < \cdots < i_k)\). We write \(\mathcal{D}^k(U)\) for the space of smooth, compactly supported \(k\)-forms on \(U\).
</div>

<div class="remark">
A simple \(k\)-vector \(v_1 \wedge \cdots \wedge v_k\) represents an oriented \(k\)-dimensional parallelotope. The key geometric point is that simple \(k\)-vectors correspond to oriented \(k\)-planes: the simple \(k\)-vector \(\xi = v_1 \wedge \cdots \wedge v_k\) determines (up to positive scalar multiples) the \(k\)-plane \(\operatorname{span}(v_1, \ldots, v_k)\) together with an orientation. This is the algebraic underpinning of the theory of currents.
</div>

### 4.2 Currents: Definitions

<div class="definition">
A <strong>\(k\)-dimensional current</strong> in an open set \(U \subseteq \mathbb{R}^n\) is a continuous linear functional on the space \(\mathcal{D}^k(U)\) of smooth, compactly supported differential \(k\)-forms. The space of \(k\)-currents is denoted \(\mathcal{D}_k(U)\). We write \(T(\omega)\) for the action of the current \(T\) on the form \(\omega\).
</div>

The definition of continuity here means: \(T(\omega_j) \to T(\omega)\) whenever the forms \(\omega_j\) converge to \(\omega\) in the standard topology on \(\mathcal{D}^k(U)\) (all derivatives converge uniformly, supports contained in a fixed compact set).

<div class="definition">
The <strong>boundary</strong> of a \(k\)-current \(T \in \mathcal{D}_k(U)\) is the \((k-1)\)-current \(\partial T\) defined by

\[
\partial T(\omega) = T(d\omega), \quad \omega \in \mathcal{D}^{k-1}(U),
\]
where \(d\omega\) is the exterior derivative. Since \(d^2 = 0\), we have \(\partial^2 = 0\), mirroring the topological fact that "the boundary of a boundary is zero."
</div>

<div class="example">
<strong>Current of integration.</strong> Let \(M \subseteq \mathbb{R}^n\) be a smooth oriented \(k\)-dimensional submanifold (possibly with boundary). Then \(M\) defines a \(k\)-current \(\llbracket M \rrbracket\) by

\[
\llbracket M \rrbracket(\omega) = \int_M \omega, \quad \omega \in \mathcal{D}^k(U).
\]
By Stokes' theorem, \(\partial \llbracket M \rrbracket = \llbracket \partial M \rrbracket\), where \(\partial M\) is the boundary manifold with the induced orientation. This motivates the definition of the boundary operator for general currents.
</div>

### 4.3 Mass and Normal Currents

<div class="definition">
The <strong>mass</strong> of a \(k\)-current \(T \in \mathcal{D}_k(U)\) is

\[
\mathbf{M}(T) = \sup\{T(\omega) : \omega \in \mathcal{D}^k(U),\; |\omega(x)| \leq 1 \text{ for all } x\}.
\]
Here \(|\omega(x)|\) is the comass norm of the \(k\)-covector \(\omega(x)\), defined as \(|\omega(x)| = \sup\{|\omega(x)(\xi)| : \xi \in \Lambda_k(\mathbb{R}^n),\; |\xi| \leq 1\}\).
</div>

<div class="remark">
For the current of integration over a smooth submanifold \(M\), the mass equals the \(k\)-dimensional volume: \(\mathbf{M}(\llbracket M \rrbracket) = \mathcal{H}^k(M)\). This justifies the term "mass" and motivates its use as a notion of "area" or "volume" for generalized surfaces.
</div>

<div class="definition">
A \(k\)-current \(T\) is a <strong>normal current</strong> if both \(T\) and \(\partial T\) have finite mass:

\[
\mathbf{N}(T) := \mathbf{M}(T) + \mathbf{M}(\partial T) < \infty.
\]
The space of normal \(k\)-currents is denoted \(\mathbf{N}_k(U)\).
</div>

By the Riesz representation theorem, a current of finite mass can be represented as

\[
T(\omega) = \int \langle \omega(x), \vec{T}(x) \rangle\, d\|T\|(x),
\]
where \(\|T\|\) is a Radon measure (the <strong>total variation measure</strong> or <strong>mass measure</strong> of \(T\)) and \(\vec{T} : \mathbb{R}^n \to \Lambda_k(\mathbb{R}^n)\) is a \(\|T\|\)-measurable unit \(k\)-vector field (the <strong>orientation</strong> of \(T\)).

### 4.4 Integral Currents and the Federer-Fleming Compactness Theorem

<div class="definition">
A \(k\)-current \(T\) is called <strong>integer-multiplicity rectifiable</strong> (or simply <strong>rectifiable</strong>) if it can be written as

\[
T(\omega) = \int_E \langle \omega(x), \vec{T}(x) \rangle \theta(x)\, d\mathcal{H}^k(x),
\]
where:
<ul>
<li>\(E\) is a countably \(k\)-rectifiable set,</li>
<li>\(\vec{T}(x)\) is an orienting unit simple \(k\)-vector spanning the approximate tangent plane to \(E\) at \(x\), for \(\mathcal{H}^k\)-a.e. \(x \in E\),</li>
<li>\(\theta : E \to \mathbb{Z}_{>0}\) is a locally \(\mathcal{H}^k\)-integrable positive integer-valued <strong>multiplicity function</strong>.</li>
</ul>
We write \(T = \tau(E, \theta, \vec{T})\).
</div>

<div class="definition">
An <strong>integral current</strong> is a rectifiable current \(T\) whose boundary \(\partial T\) is also a rectifiable current (or zero). The space of integral \(k\)-currents is denoted \(\mathbf{I}_k(U)\).
</div>

The following theorem is the cornerstone of the entire theory. It provides the compactness needed to solve variational problems.

<div class="theorem">
<strong>Federer-Fleming Compactness Theorem (1960).</strong> Let \(\{T_j\} \subseteq \mathbf{I}_k(\mathbb{R}^n)\) be a sequence of integral \(k\)-currents with

\[
\sup_j \left(\mathbf{M}(T_j) + \mathbf{M}(\partial T_j)\right) < \infty
\]
and all supports contained in a fixed compact set. Then there exists a subsequence \(\{T_{j_\ell}\}\) and an integral current \(T \in \mathbf{I}_k(\mathbb{R}^n)\) such that \(T_{j_\ell} \to T\) in the sense of currents (i.e., weakly: \(T_{j_\ell}(\omega) \to T(\omega)\) for all \(\omega \in \mathcal{D}^k\)).
</div>

<div class="remark">
The compactness theorem is the main reason for working with integral currents rather than smooth submanifolds. In the smooth category, sequences of surfaces with bounded area can develop singularities and fail to converge to a smooth limit. The space of integral currents is large enough to contain all limits, yet structured enough (by the integrality condition) to retain geometric meaning. This is precisely what enables the direct method of the calculus of variations to solve Plateau's problem.
</div>

### 4.5 The Flat Norm and Deformation Theorem

<div class="definition">
The <strong>flat norm</strong> of a \(k\)-current \(T \in \mathcal{D}_k(U)\) is

\[
\mathbf{F}(T) = \inf\{\mathbf{M}(R) + \mathbf{M}(S) : T = R + \partial S,\; R \in \mathcal{D}_k(U),\; S \in \mathcal{D}_{k+1}(U)\}.
\]
</div>

<div class="remark">
The flat norm measures "distance" between currents in a way that allows for small deformations. Two currents are close in flat norm if they differ by a current of small mass plus the boundary of a current of small mass. This topology is natural for variational problems: it is strong enough to control mass (via lower semicontinuity) but weak enough to admit compactness.
</div>

<div class="theorem">
<strong>Deformation Theorem (Federer-Fleming).</strong> Let \(T \in \mathbf{I}_k(\mathbb{R}^n)\) be an integral current and let \(\epsilon > 0\). Then there exist an integral polyhedral chain \(P\), an integral current \(R\) with \(\mathbf{M}(R) < \epsilon\), and an integral current \(S\) with

\[
T = P + R + \partial S,
\]
where \(P\) is supported on a \(k\)-dimensional polyhedral complex with mesh at most \(\epsilon\), and

\[
\mathbf{M}(P) \leq C(\mathbf{M}(T) + \epsilon), \quad \mathbf{M}(S) \leq C\epsilon \cdot \mathbf{M}(T),
\]
for a constant \(C = C(n, k)\).
</div>

<div class="remark">
The deformation theorem says that every integral current can be approximated by a polyhedral chain. This is the GMT analogue of the simplicial approximation theorem in algebraic topology and is a key tool in proving the isoperimetric inequality for currents and in establishing the closure of integral currents under flat limits.
</div>

### 4.6 Slicing of Currents

Slicing provides a way to "restrict" a current to level sets of a Lipschitz function, generalizing the notion of intersecting a surface with a hyperplane.

<div class="theorem">
<strong>Slicing Theorem.</strong> Let \(T \in \mathbf{I}_k(\mathbb{R}^n)\) and let \(f : \mathbb{R}^n \to \mathbb{R}^m\) be Lipschitz with \(m \leq k\). Then for \(\mathcal{L}^m\)-a.e. \(y \in \mathbb{R}^m\), there exists an integral \((k-m)\)-current \(\langle T, f, y \rangle\), called the <strong>slice</strong> of \(T\) by \(f\) at \(y\), satisfying:
<ol>
<li>\(\langle T, f, y \rangle\) is supported on \(\operatorname{spt}(T) \cap f^{-1}(\{y\})\).</li>
<li>\(\int_{\mathbb{R}^m} \mathbf{M}(\langle T, f, y \rangle)\, d\mathcal{L}^m(y) \leq (\operatorname{Lip} f)^m \mathbf{M}(T)\).</li>
<li>(Boundary formula) \(\partial \langle T, f, y \rangle = (-1)^m \langle \partial T, f, y \rangle\) for a.e. \(y\).</li>
</ol>
Moreover, if \(m = 1\) and \(f\) is a coordinate function, then the slicing satisfies the coarea-type identity

\[
T \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} f^{-1}((a, b)) = \int_a^b \langle T, f, t \rangle\, dt + (\text{boundary terms}).
\]
</div>

---

## Chapter 5: Varifolds

While currents carry orientation information and allow for a boundary operator, certain geometric problems — particularly those involving surfaces with singularities, soap films, and phase interfaces — require a framework that does not depend on orientation. William Allard and Frederick Almgren developed the theory of varifolds in the 1960s and 1970s precisely for this purpose. A varifold is, roughly speaking, a measure on the Grassmann bundle that records both the location and the tangent plane of a generalized surface, but forgets orientation.

### 5.1 Definitions and Basic Properties

<div class="definition">
The <strong>Grassmann bundle</strong> over an open set \(U \subseteq \mathbb{R}^n\) is

\[
G_m(U) = U \times G(n, m),
\]
where \(G(n,m)\) is the Grassmannian of (unoriented) \(m\)-dimensional linear subspaces of \(\mathbb{R}^n\). We equip \(G(n,m)\) with a natural metric and \(G_m(U)\) with the product topology.
</div>

<div class="definition">
A <strong>general \(m\)-varifold</strong> in \(U\) is a Radon measure on \(G_m(U)\). The space of general \(m\)-varifolds is denoted \(\mathbf{V}_m(U)\).

The <strong>weight measure</strong> (or <strong>mass measure</strong>) of a varifold \(V \in \mathbf{V}_m(U)\) is the Radon measure \(\|V\|\) on \(U\) defined by

\[
\|V\|(A) = V(\pi^{-1}(A)) = V(A \times G(n,m))
\]
for every Borel set \(A \subseteq U\), where \(\pi : G_m(U) \to U\) is the projection.
</div>

<div class="definition">
A varifold \(V \in \mathbf{V}_m(U)\) is <strong>rectifiable</strong> if there exist a countably \(m\)-rectifiable set \(E \subseteq U\) and a locally \(\mathcal{H}^m\)-integrable function \(\theta : E \to (0, \infty)\) such that

\[
V(\phi) = \int_E \phi(x, \operatorname{Tan}^m(E, x))\, \theta(x)\, d\mathcal{H}^m(x)
\]
for all \(\phi \in C_c(G_m(U))\). If \(\theta\) takes values in the positive integers, \(V\) is an <strong>integer-rectifiable varifold</strong> (or <strong>integral varifold</strong>). We write \(V = \mathbf{v}(E, \theta)\).
</div>

<div class="remark">
The key difference between varifolds and currents is that varifolds carry no orientation and have no boundary operator. This makes them more flexible (they can model non-orientable surfaces and surfaces with odd singularities) but less rigid (one loses the powerful topological tool of the boundary operator). The trade-off is worthwhile in regularity theory, where the absence of orientation simplifies the analysis.
</div>

### 5.2 First Variation and Generalized Mean Curvature

The first variation of a varifold captures how its mass changes under smooth deformations, providing a weak notion of mean curvature.

<div class="definition">
Let \(V \in \mathbf{V}_m(U)\). The <strong>first variation</strong> of \(V\) is the linear functional \(\delta V : C^1_c(U; \mathbb{R}^n) \to \mathbb{R}\) defined by

\[
\delta V(X) = \int_{G_m(U)} \operatorname{div}_S X(x)\, dV(x, S),
\]
where \(\operatorname{div}_S X(x) = \sum_{i=1}^m \langle D_{e_i} X(x), e_i \rangle\) is the tangential divergence of \(X\) with respect to the \(m\)-plane \(S\), and \(\{e_1, \ldots, e_m\}\) is any orthonormal basis for \(S\).
</div>

<div class="remark">
For a smooth submanifold \(M\) without boundary, the first variation formula from differential geometry gives

\[
\delta \mathbf{v}(M, 1)(X) = -\int_M \langle H_M, X \rangle\, d\mathcal{H}^m,
\]
where \(H_M\) is the mean curvature vector of \(M\). Thus \(\delta V = 0\) corresponds to a generalized minimal surface (zero mean curvature), and the first variation encodes the mean curvature in the distributional sense.
</div>

<div class="definition">
A varifold \(V\) is <strong>stationary</strong> if \(\delta V(X) = 0\) for all \(X \in C^1_c(U; \mathbb{R}^n)\). More generally, \(V\) has <strong>locally bounded first variation</strong> if the total variation \(|\delta V|\) is a Radon measure. In this case, by the Riesz representation theorem, there exists a \(\|V\|\)-measurable vector field \(H\) such that

\[
\delta V(X) = -\int \langle H(x), X(x) \rangle\, d\|V\|(x)
\]
for all \(X \in C^1_c(U; \mathbb{R}^n)\). The field \(H\) is called the <strong>generalized mean curvature</strong> of \(V\).
</div>

### 5.3 The Monotonicity Formula

The monotonicity formula is a key quantitative tool that controls the local behavior of stationary varifolds.

<div class="theorem">
<strong>Monotonicity Formula.</strong> Let \(V \in \mathbf{V}_m(U)\) be a stationary varifold (i.e., \(\delta V = 0\)). Then for every \(a \in U\), the function

\[
r \mapsto \frac{\|V\|(B(a, r))}{\omega_m r^m}
\]
is non-decreasing for \(0 < r < \operatorname{dist}(a, \partial U)\). In particular, the density

\[
\Theta^m(\|V\|, a) = \lim_{r \to 0^+} \frac{\|V\|(B(a, r))}{\omega_m r^m}
\]
exists and is a non-negative real number for every \(a \in \operatorname{spt}\|V\|\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Choose a radial test vector field \(X(x) = \eta(|x - a|)(x - a)\), where \(\eta\) is a suitable cutoff function. Substituting into the first variation formula \(\delta V(X) = 0\) and using the coarea formula, one derives the identity

\[
\frac{d}{dr}\left(\frac{\|V\|(B(a,r))}{\omega_m r^m}\right) = \frac{1}{\omega_m r^m} \int_{B(a,r)} \frac{|(x-a)^\perp|^2}{|x-a|^{m+2}}\, d\|V\|(x) \geq 0,
\]
where \((x-a)^\perp\) denotes the component of \(x - a\) perpendicular to the tangent plane \(S\). The right-hand side is non-negative, yielding monotonicity.
</div>

<div class="remark">
For non-stationary varifolds with \(\|H\|_{L^p(\|V\|)}\) controlled, a generalized monotonicity formula holds with an exponential correction factor. The monotonicity formula has far-reaching consequences: it implies upper density bounds, uniform local mass estimates, and is essential in compactness arguments and blow-up analysis.
</div>

### 5.4 Allard's Regularity Theorem

The following regularity theorem, due to William Allard (1972), is one of the most important results in geometric measure theory. It asserts that an integral varifold that is "close to flat" in a suitable sense must actually be a smooth graph.

<div class="theorem">
<strong>Allard's Regularity Theorem (1972).</strong> There exist constants \(\epsilon = \epsilon(n, m) > 0\) and \(C = C(n, m) > 0\) with the following property. Let \(V = \mathbf{v}(E, \theta)\) be an integral \(m\)-varifold in \(B(0, 1) \subseteq \mathbb{R}^n\) with generalized mean curvature \(H \in L^p(\|V\|)\) for some \(p > m\). Suppose:
<ol>
<li>(Density close to 1) \(|\Theta^m(\|V\|, 0) - 1| < \epsilon\),</li>
<li>(Mass close to flat) \(\omega_m^{-1} \|V\|(B(0, 1)) < 1 + \epsilon\),</li>
<li>(Small mean curvature) \(\left(\int_{B(0,1)} |H|^p\, d\|V\|\right)^{1/p} < \epsilon\).</li>
</ol>
Then \(\operatorname{spt}\|V\| \cap B(0, 1/2)\) is a \(C^{1,\alpha}\) graph over the approximate tangent plane at the origin, for \(\alpha = 1 - m/p\). Moreover, if \(H \in C^{k,\beta}\), then the graph is \(C^{k+2,\beta}\).
</div>

<div class="remark">
Allard's theorem says that the only obstruction to regularity of a varifold is the failure of the density to be close to 1 (which happens at singular points where "sheets come together") or the presence of large mean curvature. At points where the density equals 1 and the mean curvature is controlled, the varifold is a smooth submanifold. This is the varifold-theoretic analogue of the regularity theory for minimal surfaces.
</div>

### 5.5 Compactness for Varifolds

<div class="theorem">
<strong>Allard's Compactness Theorem.</strong> Let \(\{V_j\} \subseteq \mathbf{V}_m(U)\) be a sequence of integral varifolds with locally bounded first variation and

\[
\sup_j \left(\|V_j\|(K) + |\delta V_j|(K)\right) < \infty
\]
for every compact \(K \subseteq U\). Then there exists a subsequence converging (as Radon measures on \(G_m(U)\)) to an integral varifold \(V\) with locally bounded first variation.
</div>

<div class="remark">
This compactness theorem is the varifold counterpart of the Federer-Fleming compactness theorem for integral currents. The key difference is that the varifold limit inherits integral multiplicity (this is non-trivial and relies on the monotonicity formula and the integrality of densities). Together with Allard's regularity theorem, this compactness result forms the basis for the regularity program: take a minimizing sequence, extract a converging subsequence, and show that the limit is regular.
</div>

---

## Chapter 6: The Plateau Problem and Minimal Surfaces

Joseph Plateau (1801–1883), a Belgian physicist who was blinded by an experiment involving staring at the sun, conducted extensive experiments with soap films in the mid-19th century. He observed that a soap film spanning a given wire frame minimizes area and meets along certain characteristic singularities. The mathematical question of whether every reasonable boundary curve bounds a surface of least area became known as Plateau's problem and stood as one of the central challenges of 19th and 20th century mathematics. Its resolution required the full machinery of geometric measure theory.

### 6.1 Formulation of the Plateau Problem

<div class="definition">
<strong>Plateau's Problem (in the language of currents).</strong> Let \(\Gamma \in \mathbf{I}_{k-1}(\mathbb{R}^n)\) be an integral \((k-1)\)-current with \(\partial \Gamma = 0\) (i.e., \(\Gamma\) is a cycle). Find an integral \(k\)-current \(T \in \mathbf{I}_k(\mathbb{R}^n)\) with \(\partial T = \Gamma\) that minimizes the mass:

\[
\mathbf{M}(T) = \inf\{\mathbf{M}(S) : S \in \mathbf{I}_k(\mathbb{R}^n),\; \partial S = \Gamma\}.
\]
</div>

<div class="remark">
The history of Plateau's problem is rich and spans more than a century:
<ul>
<li><em>1760</em>: Lagrange poses the general problem of finding surfaces of least area.</li>
<li><em>1873</em>: Plateau publishes his experimental observations on soap films.</li>
<li><em>1930-31</em>: Jesse Douglas and Tibor Radó independently solve the problem for disk-type surfaces spanning a Jordan curve in \(\mathbb{R}^3\), using conformal parametrizations and the Dirichlet energy. Douglas receives the first Fields Medal (1936) for this work.</li>
<li><em>1960</em>: Federer and Fleming solve the general Plateau problem in all dimensions and codimensions using integral currents.</li>
<li><em>1961-69</em>: De Giorgi, Fleming, Almgren, and Simons develop regularity theory.</li>
</ul>
</div>

### 6.2 Existence via the Direct Method

<div class="theorem">
<strong>Existence of Mass-Minimizing Currents (Federer-Fleming, 1960).</strong> Let \(\Gamma \in \mathbf{I}_{k-1}(\mathbb{R}^n)\) be a compactly supported integral \((k-1)\)-cycle. Then there exists \(T \in \mathbf{I}_k(\mathbb{R}^n)\) with \(\partial T = \Gamma\) achieving

\[
\mathbf{M}(T) = \inf\{\mathbf{M}(S) : S \in \mathbf{I}_k(\mathbb{R}^n),\; \partial S = \Gamma\}.
\]
</div>

<div class="proof">
The proof uses the direct method of the calculus of variations.

<em>Step 1: Existence of a competitor.</em> Since \(\partial \Gamma = 0\), the isoperimetric inequality for currents guarantees that there exists at least one \(S \in \mathbf{I}_k(\mathbb{R}^n)\) with \(\partial S = \Gamma\). Let \(m_0 = \inf\{\mathbf{M}(S) : \partial S = \Gamma\}\).

<em>Step 2: Minimizing sequence.</em> Choose integral currents \(T_j\) with \(\partial T_j = \Gamma\) and \(\mathbf{M}(T_j) \to m_0\). By replacing \(T_j\) with the cone over \(\Gamma\) truncated to a large ball if necessary, we may assume all supports lie in a fixed compact set.

<em>Step 3: Compactness.</em> The sequence \(\{T_j\}\) satisfies \(\sup_j \mathbf{M}(T_j) < \infty\) and \(\partial T_j = \Gamma\) for all \(j\), so \(\sup_j \mathbf{M}(\partial T_j) = \mathbf{M}(\Gamma) < \infty\). By the Federer-Fleming compactness theorem, there is a subsequence \(T_{j_\ell} \to T\) (weakly) where \(T \in \mathbf{I}_k(\mathbb{R}^n)\).

<em>Step 4: Boundary.</em> By the continuity of the boundary operator under weak convergence, \(\partial T = \lim \partial T_{j_\ell} = \Gamma\).

<em>Step 5: Lower semicontinuity.</em> The mass is lower semicontinuous with respect to weak convergence of currents: \(\mathbf{M}(T) \leq \liminf_\ell \mathbf{M}(T_{j_\ell}) = m_0\). Since \(\partial T = \Gamma\), we also have \(\mathbf{M}(T) \geq m_0\). Hence \(\mathbf{M}(T) = m_0\).
</div>

### 6.3 Regularity in Codimension One

The existence theorem produces a mass-minimizing integral current, but says nothing about its regularity. Could the minimizer be everywhere singular? The regularity theory, developed over several decades, shows that in codimension one the answer is a resounding no: the minimizer is smooth except possibly on a small singular set.

<div class="theorem">
<strong>Interior Regularity (De Giorgi, 1961; Almgren, 1968; Simons, 1968).</strong> Let \(T \in \mathbf{I}_k(\mathbb{R}^{k+1})\) be a mass-minimizing integral \(k\)-current in \(\mathbb{R}^{k+1}\) (codimension one). Let \(\operatorname{reg}(T)\) denote the <strong>regular set</strong> (points near which \(\operatorname{spt} T\) is a smooth embedded submanifold) and \(\operatorname{sing}(T) = \operatorname{spt} T \setminus (\operatorname{reg}(T) \cup \operatorname{spt} \partial T)\) the <strong>singular set</strong>. Then:
<ol>
<li>\(\operatorname{reg}(T)\) is an open dense subset of \(\operatorname{spt} T \setminus \operatorname{spt} \partial T\).</li>
<li>\(\operatorname{sing}(T)\) has Hausdorff dimension at most \(k - 7\).</li>
<li>In particular, if \(k \leq 6\) (i.e., the ambient dimension is at most 7), then \(\operatorname{sing}(T) = \varnothing\) and the minimizer is completely smooth.</li>
</ol>
</div>

The regularity program proceeds through a series of deep results:

<div class="theorem">
<strong>De Giorgi's Regularity Theorem (1961).</strong> Let \(T\) be a mass-minimizing integral \(k\)-current in \(\mathbb{R}^{k+1}\). If \(x \in \operatorname{spt} T \setminus \operatorname{spt} \partial T\) and the density \(\Theta^k(\|T\|, x) = 1\), then \(x \in \operatorname{reg}(T)\). In fact, \(\operatorname{spt} T\) is an analytic submanifold near \(x\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The idea is a blow-up argument. If \(T\) is mass-minimizing and has density 1 at \(x\), then by the monotonicity formula, the rescaled currents \(T_{x,r} = (\iota_{x,r})_\# T\) (where \(\iota_{x,r}(y) = (y - x)/r\)) have mass ratios close to 1 for small \(r\). One shows:
<ol>
<li><em>Excess decay:</em> The excess \(E(T, B(x,r)) = r^{-k}\left(\|T\|(B(x,r)) - \omega_k r^k\right)\) measures the deviation from flatness. One proves that the excess decays at a definite rate: \(E(T, B(x, r/2)) \leq C E(T, B(x, r))^\alpha\) for some \(\alpha > 1\), provided the initial excess is small enough.</li>
<li><em>Lipschitz approximation:</em> When the excess is small, \(\operatorname{spt} T \cap B(x, r/2)\) is a Lipschitz graph over the approximate tangent plane.</li>
<li><em>Elliptic regularity:</em> The mass-minimizing condition implies the Lipschitz graph satisfies a quasi-linear elliptic PDE (the minimal surface equation). By Schauder theory, the solution is smooth (in fact, analytic by a result of Morrey).</li>
</ol>
</div>

<div class="theorem">
<strong>Simons' Inequality and Dimension Bound (1968).</strong> Let \(\Sigma^k \subseteq \mathbb{R}^{k+1}\) be a smooth, complete, stable minimal hypersurface (without boundary). James Simons proved:
<ol>
<li>The second fundamental form \(A\) satisfies the differential inequality

\[
\Delta |A|^2 \geq -2|A|^4 + 2\left(1 + \frac{2}{k}\right)|\nabla A|^2,
\]
which, combined with a maximum principle argument, yields:</li>
<li>If \(k \leq 5\), the only complete stable minimal hypercone in \(\mathbb{R}^{k+1}\) is a hyperplane.</li>
</ol>
Together with the dimension-reduction argument of Federer, this implies \(\dim_H(\operatorname{sing}(T)) \leq k - 7\) for mass-minimizing currents.
</div>

### 6.4 Bernstein's Theorem and Its Generalizations

<div class="theorem">
<strong>Bernstein's Theorem (generalized).</strong> Let \(u : \mathbb{R}^k \to \mathbb{R}\) be an entire solution to the minimal surface equation

\[
\operatorname{div}\left(\frac{\nabla u}{\sqrt{1 + |\nabla u|^2}}\right) = 0.
\]
Then:
<ul>
<li>If \(k \leq 7\), \(u\) must be affine (i.e., the graph is a hyperplane).</li>
<li>If \(k \geq 8\), there exist non-affine entire minimal graphs.</li>
</ul>
</div>

<div class="remark">
The original Bernstein theorem (1915-1917) covers the case \(k = 2\): every entire minimal graph in \(\mathbb{R}^3\) is a plane. This was extended to \(k = 3\) by De Giorgi (1965), \(k = 4\) by Almgren (1966), and \(k \leq 7\) by Simons (1968). The result is sharp: Bombieri, De Giorgi, and Giusti (1969) constructed counterexamples for \(k \geq 8\), related to the Simons cone.
</div>

### 6.5 The Simons Cone

The sharpness of the dimension bound \(k - 7\) for the singular set is demonstrated by a celebrated example.

<div class="definition">
The <strong>Simons cone</strong> is the \(7\)-dimensional cone in \(\mathbb{R}^8\) defined by

\[
\mathbf{C} = \left\{(x, y) \in \mathbb{R}^4 \times \mathbb{R}^4 : |x|^2 = |y|^2\right\}.
\]
More generally, for any \(p, q \geq 1\), the <strong>Clifford cone</strong> is

\[
\mathbf{C}_{p,q} = \left\{(x, y) \in \mathbb{R}^{p+1} \times \mathbb{R}^{q+1} : \frac{|x|^2}{p} = \frac{|y|^2}{q}\right\}.
\]
The Simons cone is \(\mathbf{C}_{3,3}\).
</div>

<div class="theorem">
<strong>Bombieri-De Giorgi-Giusti (1969).</strong> The Simons cone \(\mathbf{C}_{3,3}\) is a mass-minimizing hypersurface in \(\mathbb{R}^8\). It is area-minimizing among all integral currents with the same boundary at infinity. Its only singularity is at the origin.
</div>

<div class="remark">
The Simons cone demonstrates that:
<ol>
<li>Area-minimizing hypersurfaces can have genuine singularities in dimension \(n \geq 8\).</li>
<li>The dimension bound \(\dim(\operatorname{sing}(T)) \leq k - 7\) is sharp.</li>
<li>The Bernstein theorem fails for \(k \geq 8\).</li>
</ol>
Simons (1968) had shown that \(\mathbf{C}_{3,3}\) is <em>stable</em> (i.e., the second variation of area is non-negative), and Bombieri, De Giorgi, and Giusti then proved the stronger statement that it is actually area-minimizing. This was a landmark result that completed the regularity picture in codimension one.
</div>

### 6.6 Higher Codimension: Almgren's Big Regularity Theorem

<div class="theorem">
<strong>Almgren's Regularity Theorem (completed 2000, published posthumously).</strong> Let \(T \in \mathbf{I}_m(\mathbb{R}^n)\) be a mass-minimizing integral \(m\)-current in \(\mathbb{R}^n\) for arbitrary codimension \(n - m \geq 2\). Then the singular set satisfies

\[
\dim_H(\operatorname{sing}(T)) \leq m - 2.
\]
</div>

<div class="remark">
Almgren's proof is contained in a 1728-page manuscript (the "Big Regularity Paper"), completed in the mid-1980s but not published until 2000 (edited by V. Scheffer and J. Taylor after Almgren's death in 1997). It introduces several major innovations: the concept of multi-valued functions (functions taking values in the space of unordered \(Q\)-tuples of points), a Dirichlet energy for multi-valued functions, and center manifold techniques for blow-up analysis. Almgren's bound is sharp: Federer exhibited \(2\)-dimensional area-minimizing currents in \(\mathbb{R}^4\) with isolated singularities. Recently, De Lellis and Spadaro (2014-2016) gave a substantially simplified proof using the framework of \(Q\)-valued functions.
</div>

### 6.7 Stable Minimal Surfaces

<div class="definition">
A minimal surface (or more precisely, a stationary integral varifold \(V\)) is <strong>stable</strong> if the second variation of area is non-negative:

\[
\delta^2 V(\phi) = \int_M \left(|\nabla^\perp \phi|^2 - |A|^2 |\phi|^2 - \operatorname{Ric}^\perp(\phi, \phi)\right) d\mathcal{H}^m \geq 0
\]
for all smooth compactly supported normal variations \(\phi\). In Euclidean space, the Ricci term vanishes and stability becomes

\[
\int_M |\nabla^\perp \phi|^2\, d\mathcal{H}^m \geq \int_M |A|^2 |\phi|^2\, d\mathcal{H}^m.
\]
</div>

<div class="theorem">
<strong>Curvature Estimates for Stable Minimal Surfaces (Schoen-Simon-Yau, 1975).</strong> Let \(\Sigma^m \subseteq \mathbb{R}^{m+1}\) be a complete, stable, immersed minimal hypersurface. If \(m \leq 5\), then \(\Sigma\) is a hyperplane.
</div>

<div class="remark">
This is a non-trivial strengthening of Bernstein's theorem: stability is a weaker condition than being a graph (every minimal graph is stable, but not conversely). The Schoen-Simon-Yau result was later extended to \(m = 6\) by Schoen and Simon. Combined with the Simons cone example, this gives a complete picture: complete stable minimal hypersurfaces in \(\mathbb{R}^{m+1}\) are hyperplanes for \(m \leq 6\), but singular stable examples exist for \(m = 7\).
</div>

---

## Chapter 7: Sets of Finite Perimeter and Isoperimetric Problems

The theory of sets of finite perimeter (Caccioppoli sets) provides a measure-theoretic framework for studying boundaries of regions, generalizing the classical notion of a surface. This framework, developed primarily by Renato Caccioppoli and Ennio De Giorgi in the 1950s, connects geometric measure theory to the calculus of variations, partial differential equations, and geometric analysis. It yields elegant proofs of fundamental geometric inequalities, including the isoperimetric inequality.

### 7.1 Functions of Bounded Variation

<div class="definition">
Let \(U \subseteq \mathbb{R}^n\) be open. A function \(u \in L^1(U)\) has <strong>bounded variation</strong> in \(U\) if the distributional gradient \(Du\) is a vector-valued Radon measure on \(U\), i.e.,

\[
|Du|(U) = \sup\left\{\int_U u\, \operatorname{div}\phi\, dx : \phi \in C^1_c(U; \mathbb{R}^n),\; |\phi| \leq 1\right\} < \infty.
\]
The space of functions of bounded variation is denoted \(BV(U)\), and \(|Du|(U)\) is called the <strong>total variation</strong> of \(u\) in \(U\).
</div>

<div class="remark">
The space \(BV(U)\) is a Banach space under the norm \(\|u\|_{BV} = \|u\|_{L^1} + |Du|(U)\). It properly contains \(W^{1,1}(U)\), the Sobolev space of \(L^1\) functions with \(L^1\) gradients: \(W^{1,1}(U) \subsetneq BV(U)\). The key advantage of \(BV\) over \(W^{1,1}\) is compactness: bounded sequences in \(BV\) have convergent subsequences in \(L^1\), while the analogous compactness fails in \(W^{1,1}\).
</div>

<div class="theorem">
<strong>BV Compactness Theorem.</strong> Let \(\{u_j\} \subseteq BV(U)\) with \(\sup_j \|u_j\|_{BV} < \infty\), where \(U\) is bounded and has Lipschitz boundary. Then there exists a subsequence \(u_{j_k} \to u\) in \(L^1(U)\) for some \(u \in BV(U)\), and \(|Du|(U) \leq \liminf_k |Du_{j_k}|(U)\).
</div>

<div class="theorem">
<strong>Structure Theorem for BV Functions.</strong> Let \(u \in BV(U)\). The distributional derivative \(Du\) admits the decomposition

\[
Du = D^a u + D^s u = \nabla u\, \mathcal{L}^n + D^c u + D^j u,
\]
where:
<ul>
<li>\(D^a u = \nabla u\, \mathcal{L}^n\) is the <strong>absolutely continuous part</strong>, with \(\nabla u \in L^1(U; \mathbb{R}^n)\) the approximate gradient,</li>
<li>\(D^j u = (u^+ - u^-) \nu_u\, \mathcal{H}^{n-1} \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} J_u\) is the <strong>jump part</strong>, concentrated on the <strong>jump set</strong> \(J_u\) (an \((n-1)\)-rectifiable set), where \(u^+, u^-\) are the traces from each side and \(\nu_u\) is the normal,</li>
<li>\(D^c u\) is the <strong>Cantor part</strong>, singular with respect to \(\mathcal{L}^n\) and vanishing on all \((n-1)\)-rectifiable sets.</li>
</ul>
</div>

### 7.2 Sets of Finite Perimeter

<div class="definition">
A \(\mathcal{L}^n\)-measurable set \(E \subseteq \mathbb{R}^n\) has <strong>finite perimeter</strong> in an open set \(U\) if its characteristic function \(\chi_E\) belongs to \(BV(U)\). The <strong>perimeter</strong> of \(E\) in \(U\) is

\[
P(E; U) = |D\chi_E|(U) = \sup\left\{\int_E \operatorname{div}\phi\, dx : \phi \in C^1_c(U; \mathbb{R}^n),\; |\phi| \leq 1\right\}.
\]
Sets of finite perimeter are also called <strong>Caccioppoli sets</strong>, honoring Renato Caccioppoli who introduced them in the 1920s.
</div>

<div class="remark">
For a bounded open set \(E\) with \(C^1\) boundary, the divergence theorem gives \(P(E; U) = \mathcal{H}^{n-1}(\partial E \cap U)\). Thus the perimeter generalizes the \((n-1)\)-dimensional surface measure of the boundary to sets without smooth boundaries. The perimeter is lower semicontinuous with respect to \(L^1_{\mathrm{loc}}\) convergence: if \(\chi_{E_j} \to \chi_E\) in \(L^1_{\mathrm{loc}}\), then \(P(E; U) \leq \liminf_j P(E_j; U)\).
</div>

<div class="example">
<strong>Examples of sets of finite perimeter.</strong>
<ul>
<li>Any bounded open set with Lipschitz boundary has finite perimeter.</li>
<li>The set \(\{x \in \mathbb{R}^n : |x| < 1\}\) (the unit ball) has perimeter \(n\omega_n\) (the surface area of the unit sphere).</li>
<li>Any finite union of cubes in \(\mathbb{R}^n\) has finite perimeter.</li>
<li>A set whose boundary is a fractal (e.g., the interior of the Koch snowflake in \(\mathbb{R}^2\)) has finite perimeter if and only if \(\mathcal{H}^{n-1}(\partial E) < \infty\). The Koch snowflake has infinite \(\mathcal{H}^1\)-measure boundary, so it does <em>not</em> have finite perimeter. However, its area is finite.</li>
</ul>
</div>

### 7.3 The Reduced Boundary

The central idea of De Giorgi's theory is to identify a canonical "measure-theoretic boundary" for a set of finite perimeter that has rectifiable structure.

<div class="definition">
Let \(E\) be a set of finite perimeter in \(U\). The <strong>measure-theoretic exterior normal</strong> is the Radon-Nikodým derivative

\[
\nu_E(x) = -\frac{dD\chi_E}{d|D\chi_E|}(x),
\]
which exists \(|D\chi_E|\)-a.e. and satisfies \(|\nu_E(x)| = 1\). The <strong>reduced boundary</strong> (or <strong>essential boundary</strong>) of \(E\) is the set

\[
\partial^* E = \left\{x \in \operatorname{spt}|D\chi_E| : \nu_E(x) \text{ exists and } |\nu_E(x)| = 1\right\}.
\]
</div>

<div class="remark">
The reduced boundary \(\partial^* E\) is a subset of the topological boundary \(\partial E\) and of the measure-theoretic boundary \(\partial_{\mathrm{meas}} E = \{x : 0 < \Theta^n(E, x) < 1\}\). It discards the "irregular" parts of the boundary where the normal is not well-defined. De Giorgi's structure theorem shows that \(\partial^* E\) captures essentially all of the perimeter.
</div>

### 7.4 De Giorgi's Structure Theorem

The following theorem, due to Ennio De Giorgi (1954-1955), is one of the foundational results of the theory. It shows that the reduced boundary of a set of finite perimeter is a rectifiable set, and that the Gauss-Green formula holds in this generality.

<div class="theorem">
<strong>De Giorgi's Structure Theorem (1954-1955).</strong> Let \(E\) be a set of finite perimeter in \(\mathbb{R}^n\). Then:
<ol>
<li>(Rectifiability) The reduced boundary \(\partial^* E\) is countably \((n-1)\)-rectifiable.</li>
<li>(Density) \(\Theta^{n-1}(|D\chi_E|, x) = 1\) for \(\mathcal{H}^{n-1}\)-a.e. \(x \in \partial^* E\).</li>
<li>(Measure representation) \(|D\chi_E| = \mathcal{H}^{n-1} \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} \partial^* E\), i.e.,

\[
P(E; U) = \mathcal{H}^{n-1}(\partial^* E \cap U)
\]
for every open set \(U\).</li>
<li>(Blow-up) At every point \(x \in \partial^* E\), the rescaled sets \(r^{-1}(E - x)\) converge in \(L^1_{\mathrm{loc}}\) as \(r \to 0^+\) to the half-space \(\{y : \langle y, \nu_E(x) \rangle \leq 0\}\). In particular, the approximate tangent plane to \(\partial^* E\) at \(x\) is the hyperplane \(\nu_E(x)^\perp\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch.</strong>

<em>Step 1: Blow-up at reduced boundary points.</em> Fix \(x \in \partial^* E\) and consider the rescaled sets \(E_r = r^{-1}(E - x)\). The perimeter is uniformly bounded: \(P(E_r; B(0, R)) \leq C(R)\). By BV compactness, a subsequence \(E_{r_k}\) converges in \(L^1_{\mathrm{loc}}\) to a set \(F\) of locally finite perimeter. One shows that \(F\) is a half-space by proving that \(\chi_F\) is invariant under translations parallel to \(\nu_E(x)^\perp\) (using the existence and constancy of the normal at \(x\)).

<em>Step 2: Density and rectifiability.</em> The blow-up to a half-space implies that \(\Theta^{n-1}(|D\chi_E|, x) = 1\) for every \(x \in \partial^* E\). Combining this with the characterization of rectifiable sets by density (Preiss's theorem, or more elementarily, the fact that the tangent plane exists at each point of \(\partial^* E\)), one obtains that \(\partial^* E\) is countably \((n-1)\)-rectifiable.

<em>Step 3: Measure representation.</em> The equality \(|D\chi_E| = \mathcal{H}^{n-1} \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} \partial^* E\) follows from the density result and a comparison argument using the Besicovitch covering theorem: since the density equals 1 at \(\mathcal{H}^{n-1}\)-a.e. point, the measures must agree.
</div>

### 7.5 The Gauss-Green Formula

De Giorgi's structure theorem yields a far-reaching generalization of the classical divergence theorem.

<div class="theorem">
<strong>Generalized Gauss-Green Formula.</strong> Let \(E\) be a set of finite perimeter in \(\mathbb{R}^n\). Then for every \(\phi \in C^1_c(\mathbb{R}^n; \mathbb{R}^n)\),

\[
\int_E \operatorname{div}\phi\, dx = -\int_{\partial^* E} \langle \phi, \nu_E \rangle\, d\mathcal{H}^{n-1},
\]
where \(\nu_E\) is the measure-theoretic outer normal to \(E\).
</div>

<div class="remark">
This is a direct consequence of the definitions (\(D\chi_E = -\nu_E \mathcal{H}^{n-1} \mathbin{\vrule height 6pt depth 0pt\relax\vrule height 0.5pt depth 0pt width 4pt} \partial^* E\)) and the integration by parts formula for BV functions. The beauty of the result is that it applies to sets with highly irregular boundaries — the reduced boundary \(\partial^* E\) replaces the smooth boundary, and the measure-theoretic normal \(\nu_E\) replaces the smooth outward normal. This formula is the cornerstone of many PDE applications of sets of finite perimeter.
</div>

### 7.6 The Isoperimetric Inequality

The isoperimetric inequality is one of the oldest and most beautiful results in mathematics: among all domains with a given volume, the ball minimizes the surface area (perimeter). Geometric measure theory provides a clean and powerful proof.

<div class="theorem">
<strong>Isoperimetric Inequality.</strong> For every set \(E \subseteq \mathbb{R}^n\) of finite perimeter,

\[
\min\{\mathcal{L}^n(E), \mathcal{L}^n(\mathbb{R}^n \setminus E)\}^{(n-1)/n} \leq C_n\, P(E),
\]
where \(C_n = n^{-1} \omega_n^{-1/n}\). Equality holds if and only if \(E\) is (up to a null set) a ball.
</div>

<div class="proof">
We present the elegant proof via the Sobolev inequality and a symmetrization argument.

<em>Step 1: Reduction to smooth sets.</em> By approximation (smooth sets are dense among sets of finite perimeter in the appropriate topology), it suffices to prove the inequality for bounded open sets with smooth boundary.

<em>Step 2: The Sobolev inequality.</em> For \(u \in BV(\mathbb{R}^n)\),

\[
\|u\|_{L^{n/(n-1)}} \leq C_n |Du|(\mathbb{R}^n).
\]
This is the BV-Sobolev inequality (or isoperimetric Sobolev inequality), proved by Gagliardo (1958) and Nirenberg (1959). Applying it to \(u = \chi_E\), we get

\[
\mathcal{L}^n(E)^{(n-1)/n} = \|\chi_E\|_{L^{n/(n-1)}}^{n/(n-1)} \cdots
\]
Wait — more precisely, \(\|\chi_E\|_{L^{n/(n-1)}} = \mathcal{L}^n(E)^{(n-1)/n}\) and \(|D\chi_E|(\mathbb{R}^n) = P(E)\), so the Sobolev inequality gives

\[
\mathcal{L}^n(E)^{(n-1)/n} \leq C_n P(E).
\]

<em>Step 3: Equality characterization.</em> The equality case requires showing that the extremals of the BV-Sobolev inequality are characteristic functions of balls. This follows from the Pólya-Szegő inequality and the characterization of extremals of the Sobolev inequality by Aubin and Talenti, or alternatively by a direct symmetrization argument: Steiner symmetrization does not increase the perimeter while preserving the volume, and the only sets invariant under all Steiner symmetrizations are balls.
</div>

<div class="remark">
There are many proofs of the isoperimetric inequality. Beyond the Sobolev inequality approach, notable proofs include:
<ul>
<li>The <em>Brunn-Minkowski approach</em>, using the inequality \(\mathcal{L}^n(A + B)^{1/n} \geq \mathcal{L}^n(A)^{1/n} + \mathcal{L}^n(B)^{1/n}\) and a limiting argument.</li>
<li>The <em>optimal transport approach</em> (Gromov, 2003), using the Brenier map and the arithmetic-geometric mean inequality applied to the Jacobian of the transport map.</li>
<li>The <em>ABP method</em> (Cabré, 2000), using the Alexandrov-Bakelman-Pucci estimate from PDE theory.</li>
</ul>
Each proof illuminates different structural aspects of the inequality.
</div>

### 7.7 The Isoperimetric Problem via Direct Methods

The isoperimetric inequality can also be established by solving the associated variational problem directly using the compactness of sets of finite perimeter.

<div class="theorem">
<strong>Existence of Isoperimetric Sets.</strong> For every \(v > 0\), there exists a set \(E_v \subseteq \mathbb{R}^n\) of finite perimeter with \(\mathcal{L}^n(E_v) = v\) that minimizes the perimeter:

\[
P(E_v) = \inf\{P(F) : F \text{ has finite perimeter},\; \mathcal{L}^n(F) = v\}.
\]
Any such minimizer is (up to translation and a null set) a ball of volume \(v\).
</div>

<div class="proof">
<strong>Proof sketch.</strong>

<em>Existence.</em> The key challenge is preventing minimizing sequences from "escaping to infinity." One uses the concentration-compactness principle of P.-L. Lions (1984): a minimizing sequence either concentrates (and converges to a minimizer), vanishes (impossible since the volume is fixed), or splits into pieces at large distances (ruled out by the subadditivity of perimeter and the strict inequality for the isoperimetric ratio of split domains).

<em>Regularity and uniqueness.</em> Any isoperimetric set has smooth boundary except on a set of Hausdorff codimension at least 7 (by the regularity theory for almost-minimizers of the perimeter). The boundary has constant mean curvature (the Lagrange multiplier for the volume constraint). By a result of Alexandrov (1962), the only compact embedded hypersurface of constant mean curvature in \(\mathbb{R}^n\) is the round sphere.
</div>

### 7.8 Connections to the Calculus of Variations and Optimal Transport

The theory of sets of finite perimeter provides a natural framework for studying a wide range of variational problems beyond the classical isoperimetric inequality.

<div class="definition">
A <strong>perimeter-penalized variational problem</strong> seeks to minimize functionals of the form

\[
\mathcal{F}(E) = P(E; U) + \int_E g(x)\, dx,
\]
where \(g : U \to \mathbb{R}\) is a given function. These arise naturally in phase transition problems: \(E\) represents a phase, the perimeter term penalizes the interfacial energy, and the integral term represents a bulk energy.
</div>

<div class="theorem">
<strong>Existence of Minimizers for Perimeter-Penalized Problems.</strong> Let \(U \subseteq \mathbb{R}^n\) be a bounded open set with Lipschitz boundary, and let \(g \in L^1(U)\). Then the functional \(\mathcal{F}(E) = P(E; U) + \int_E g\, dx\) admits a minimizer among all sets of finite perimeter \(E \subseteq U\).
</div>

<div class="proof">
This follows immediately from the direct method: take a minimizing sequence \(\{E_j\}\), use the compactness of sets of finite perimeter (BV compactness) to extract a convergent subsequence \(\chi_{E_j} \to \chi_E\) in \(L^1(U)\), and use the lower semicontinuity of the perimeter together with the continuity of the integral term to conclude \(\mathcal{F}(E) \leq \liminf_j \mathcal{F}(E_j)\).
</div>

<div class="remark">
<strong>Connection to optimal transport.</strong> A beautiful link between isoperimetric problems and optimal transport was discovered by Gromov. The idea is as follows. Let \(T : \mathbb{R}^n \to \mathbb{R}^n\) be the Brenier map pushing forward the uniform measure on a set \(E\) to the uniform measure on a ball \(B\) of the same volume (normalized). By the Monge-Ampère equation, \(\det DT = 1\) a.e. in \(E\). By the arithmetic-geometric mean inequality applied to the eigenvalues of \(DT\),

\[
\frac{\operatorname{tr}(DT)}{n} \geq (\det DT)^{1/n} = 1.
\]
Integrating \(\operatorname{div} T = \operatorname{tr}(DT) \geq n\) over \(E\) and using the divergence theorem (in the form of the Gauss-Green formula for sets of finite perimeter) yields

\[
n \mathcal{L}^n(E) \leq \int_E \operatorname{div} T\, dx = \int_{\partial^* E} \langle T, \nu_E \rangle\, d\mathcal{H}^{n-1} \leq R \cdot P(E),
\]
where \(R\) is the radius of \(B\). Since \(\mathcal{L}^n(E) = \omega_n R^n\), this gives \(P(E) \geq n \omega_n^{1/n} \mathcal{L}^n(E)^{(n-1)/n}\), the isoperimetric inequality. This proof, while requiring sophisticated tools from optimal transport, is conceptually clean and reveals the deep connection between mass transportation and isoperimetry.
</div>

### 7.9 Concentration Compactness

We conclude with a brief discussion of the concentration-compactness principle, which addresses the fundamental difficulty that sequences of sets (or functions) on unbounded domains may fail to converge simply because mass escapes to infinity.

<div class="theorem">
<strong>Lions' Concentration-Compactness Principle (1984).</strong> Let \(\{\mu_j\}\) be a sequence of non-negative measures on \(\mathbb{R}^n\) with \(\mu_j(\mathbb{R}^n) = 1\). Then, after passing to a subsequence, exactly one of the following occurs:
<ol>
<li><strong>Compactness</strong>: There exist translations \(y_j \in \mathbb{R}^n\) such that for every \(\epsilon > 0\), there exists \(R > 0\) with \(\mu_j(B(y_j, R)) \geq 1 - \epsilon\) for all \(j\).</li>
<li><strong>Vanishing</strong>: \(\sup_{y \in \mathbb{R}^n} \mu_j(B(y, R)) \to 0\) for every \(R > 0\).</li>
<li><strong>Dichotomy</strong>: There exists \(\alpha \in (0, 1)\) such that for every \(\epsilon > 0\), there exist \(j_0\) and non-negative measures \(\mu_j^1, \mu_j^2\) with \(\mu_j^1 + \mu_j^2 \leq \mu_j\), \(|\mu_j^1(\mathbb{R}^n) - \alpha| < \epsilon\), \(|\mu_j^2(\mathbb{R}^n) - (1 - \alpha)| < \epsilon\), and \(\operatorname{dist}(\operatorname{spt} \mu_j^1, \operatorname{spt} \mu_j^2) \to \infty\).</li>
</ol>
</div>

<div class="remark">
In the context of the isoperimetric problem, one applies concentration-compactness to the measures \(\mu_j = \mathcal{L}^n(E_j)^{-1} \chi_{E_j} \mathcal{L}^n\), where \(\{E_j\}\) is a perimeter-minimizing sequence. Vanishing is ruled out because the volume is positive. Dichotomy is ruled out because splitting a domain into two far-apart pieces with volumes \(\alpha v\) and \((1-\alpha)v\) always gives a perimeter strictly larger than the perimeter of a single ball of volume \(v\) (by the strict subadditivity of the isoperimetric profile). Hence compactness holds, and the translated sets converge to an isoperimetric minimizer.
</div>

---

## Summary and Outlook

Geometric measure theory provides the foundational language for studying geometric variational problems in their fullest generality. The key themes running through this course are:

<strong>Measure and dimension.</strong> Hausdorff measure and dimension extend classical notions of length, area, and volume to arbitrary subsets of Euclidean space, providing the correct framework for studying both smooth and fractal objects.

<strong>Rectifiability.</strong> The theory of rectifiable sets and measures identifies the class of sets that possess tangent structure almost everywhere — the measure-theoretic analogues of smooth submanifolds. The characterization theorems (Besicovitch-Federer, Preiss) reveal deep connections between geometric regularity and measure-theoretic density.

<strong>Generalized surfaces.</strong> Currents and varifolds provide two complementary frameworks for studying surfaces with singularities. Currents carry orientation and admit a boundary operator, enabling the solution of the Plateau problem. Varifolds forget orientation but retain tangent information, enabling powerful regularity theorems.

<strong>Regularity.</strong> The regularity theory for area-minimizing currents, developed by De Giorgi, Almgren, Simons, and Allard, reveals that minimizers are smooth except on small singular sets. The dimension bounds for singular sets are sharp, as demonstrated by the Simons cone.

<strong>Perimeter and isoperimetry.</strong> Sets of finite perimeter provide a robust framework for studying boundaries, and the theory yields elegant proofs of the isoperimetric inequality and its generalizations.

The subject continues to be an active area of research, with current directions including:
<ul>
<li>Quantitative isoperimetric inequalities (Fusco-Maggi-Pratelli, 2008).</li>
<li>Regularity of area-minimizing currents mod \(p\) (De Lellis-Hirsch-Marchese-Stuvard).</li>
<li>Applications to general relativity (Penrose inequality, positive mass theorem via GMT).</li>
<li>Mean curvature flow as a tool for classification of singularities.</li>
<li>Connections to sub-Riemannian geometry and analysis on metric spaces.</li>
</ul>
