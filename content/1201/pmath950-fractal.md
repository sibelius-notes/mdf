---
title: "PMATH 950: Fractal Geometry"
subjects: PMATH
prof: Kathryn Hare
---

## Sources and References

- Falconer, Kenneth J. *Fractal Geometry: Mathematical Foundations and Applications*, 3rd edn. (Wiley, 2014).
- Kigami, Jun. *Analysis on Fractals* (Cambridge University Press, 2001).
- Mattila, Pertti. *Geometry of Sets and Measures in Euclidean Spaces: Fractals and Rectifiability* (Cambridge University Press, 1995).
- Peres, Yuval & Solomyak, Balázs. "Absolute Continuity of Bernoulli Convolutions, A Simple Proof." *Mathematical Research Letters* 3 (1996), 231–239.
- Strichartz, Robert S. *Differential Equations on Fractals: A Tutorial* (Princeton University Press, 2006).

---

# Introduction

Fractals are one of the most fascinating and intricate objects in modern mathematics. They arise naturally across diverse fields—from the branching of rivers and trees to the structure of coastlines, from the distribution of prime numbers to the behavior of turbulent fluids. Despite their complex appearance, many fractals exhibit a remarkable property: *self-similarity*. A fractal is a set that looks, in some sense, the same at all scales of magnification.

The rigorous mathematical study of fractals emerged fully in the late 20th century, though their seeds were planted much earlier by mathematicians like Georg Cantor, Helge von Koch, and Waclaw Sierpinski. Today, fractal geometry provides a powerful language for describing and analyzing sets with infinite complexity, fine detail, and irregular boundaries.

This course introduces the mathematical foundations of fractal geometry. We begin with Hausdorff measure and Hausdorff dimension—tools that allow us to quantify the "size" of very irregular sets. We then explore self-similar sets constructed via iterated function systems, develop the theory of box dimension and Assouad dimension, and investigate multi-fractal analysis through local dimensions. Finally, we touch on applications to harmonic analysis and the spectral theory of Laplacians on fractal domains.

Throughout, we emphasize rigorous proofs, explicit examples (the Cantor set, Sierpinski gasket, Sierpinski carpet), and connections to classical analysis, probability theory, and PDEs.

---

# Chapter 1: Hausdorff Measure and Hausdorff Dimension

## 1.1 Historical Motivation

The notion of "measure" in mathematics has undergone significant refinement. Lebesgue measure works beautifully for sets with nice boundaries, but struggles with highly irregular sets. For instance, the Cantor set has Lebesgue measure zero, yet it is uncountable and intuitively "larger" than a single point. We need a more flexible notion of measure that can discriminate between different types of zero-measure sets.

Hausdorff measure, introduced by Felix Hausdorff in 1918, provides exactly this flexibility. Unlike Lebesgue measure, which treats all dimensions the same, Hausdorff measure permits fractional dimensions.

## 1.2 Hausdorff Content and Hausdorff Measure

**Definition (s-dimensional Hausdorff content).** For a set \(E \subseteq \mathbb{R}^n\), a real number \(s \geq 0\), and \(\delta > 0\), define

\[
H^s_\delta(E) = \inf \left\{ \sum_{i=1}^\infty (\text{diam } U_i)^s : E \subseteq \bigcup_{i=1}^\infty U_i, \, \text{diam } U_i \leq \delta \right\}.
\]

The *s-dimensional Hausdorff measure* of \(E\) is

\[
H^s(E) = \lim_{\delta \to 0^+} H^s_\delta(E) = \sup_{\delta > 0} H^s_\delta(E).
\]

The limit always exists (though it may be infinite) because \(H^s_\delta(E)\) decreases as \(\delta \to 0^+\).

**Remark.** For \(s = 1\), Hausdorff measure reduces to arc length. For \(s = n\), it is related to Lebesgue measure in \(\mathbb{R}^n\) (though they differ by a constant factor involving volumes of balls).

## 1.3 Basic Properties

**Proposition 1.3.1.** Hausdorff measure is an outer measure:
1. \(H^s(\emptyset) = 0\).
2. If \(E_1 \subseteq E_2\), then \(H^s(E_1) \leq H^s(E_2)\).
3. (Countable subadditivity) \(H^s\left(\bigcup_{i=1}^\infty E_i\right) \leq \sum_{i=1}^\infty H^s(E_i)\).

**Proposition 1.3.2.** Hausdorff measure is translation and rotation invariant. If \(T : \mathbb{R}^n \to \mathbb{R}^n\) is an isometry, then \(H^s(T(E)) = H^s(E)\).

**Proposition 1.3.3.** For any \(\lambda > 0\) and a scaling map \(x \mapsto \lambda x\),

\[
H^s(\lambda E) = \lambda^s H^s(E).
\]

This scaling property is central to the study of fractals and self-similarity.

## 1.4 Hausdorff Dimension

The crucial observation is that for a fixed set \(E\), the function \(s \mapsto H^s(E)\) is often a step function: it is infinite for small \(s\) and zero for large \(s\). This transition point defines the fractal dimension.

**Definition (Hausdorff dimension).** The *Hausdorff dimension* of a set \(E\) is

\[
\dim_H(E) = \inf\{s \geq 0 : H^s(E) = 0\} = \sup\{s \geq 0 : H^s(E) = \infty\}.
\]

Equivalently, \(\dim_H(E)\) is the unique value such that:
- \(H^s(E) = \infty\) for all \(s < \dim_H(E)\),
- \(H^s(E) = 0\) for all \(s > \dim_H(E)\).

**Proposition 1.4.1.** For any set \(E \subseteq \mathbb{R}^n\):
1. \(\dim_H(E) \leq n\).
2. If \(E\) is countable, then \(\dim_H(E) = 0\).
3. If \(E\) has non-empty interior, then \(\dim_H(E) = n\).
4. Hausdorff dimension is monotone: if \(E_1 \subseteq E_2\), then \(\dim_H(E_1) \leq \dim_H(E_2)\).

**Example 1.4.2 (Cantor set).** The standard middle-third Cantor set \(C\) is constructed by iteratively removing the open middle third of intervals. At stage \(n\), we have \(2^n\) intervals, each of length \(3^{-n}\).

By self-similarity: \(C = \frac{1}{3}C \cup (\frac{2}{3} + \frac{1}{3}C)\).

If \(\dim_H(C) = d\), then self-similarity implies

\[
H^d(C) = H^d\left(\frac{1}{3}C\right) + H^d\left(\frac{2}{3} + \frac{1}{3}C\right) = 2 \cdot (1/3)^d H^d(C).
\]

For a non-trivial solution, \(2 \cdot (1/3)^d = 1\), giving \(d = \frac{\log 2}{\log 3} \approx 0.631\).

Thus, \(\dim_H(C) = \frac{\log 2}{\log 3}\), and more precisely, \(0 < H^d(C) < \infty\).

## 1.5 Determining Hausdorff Dimension: The Billingsley Covering Lemma

For practical computation, we often use covering arguments. The following lemma is indispensable:

**Lemma 1.5.1 (Billingsley).** If a set \(E\) can be covered by countably many sets \(E_i\), each satisfying a self-similarity or scaling condition, then we can estimate \(\dim_H(E)\) by analyzing the scaling properties.

More precisely, suppose a compact set \(E\) satisfies: for each \(n\), there exist finitely many sets \(E_{n,i}\) with \(\text{diam } E_{n,i} \leq \rho_n\) (where \(\rho_n \to 0\)) such that \(E \subseteq \bigcup_i E_{n,i}\) and the covering satisfies a uniform "separation" property. Then the dimension can be determined from the scaling rates \(\rho_n\).

---

# Chapter 2: Box Dimension and Minkowski Content

## 2.1 Motivation for Box Dimension

While Hausdorff dimension is conceptually elegant, it can be difficult to compute. Box dimension (also called Minkowski dimension or capacity dimension) offers a more practical alternative, especially for self-similar sets.

## 2.2 Definition and Basic Properties

**Definition (box dimension).** For a non-empty bounded set \(E \subseteq \mathbb{R}^n\), define \(N(E, \epsilon)\) as the minimum number of balls of radius \(\epsilon\) required to cover \(E\). The *lower box dimension* and *upper box dimension* are

\[
\underline{\dim}_B(E) = \liminf_{\epsilon \to 0^+} \frac{\log N(E, \epsilon)}{-\log \epsilon}, \quad \overline{\dim}_B(E) = \limsup_{\epsilon \to 0^+} \frac{\log N(E, \epsilon)}{-\log \epsilon}.
\]

If these coincide, we write \(\dim_B(E)\) and call it the *box dimension* of \(E\).

Alternatively, \(N_\square(E, \epsilon)\) denotes the number of \(\epsilon\)-cubes in a grid of side-length \(\epsilon\) that intersect \(E\). Then

\[
\dim_B(E) = \lim_{\epsilon \to 0^+} \frac{\log N_\square(E, \epsilon)}{-\log \epsilon}
\]

(under suitable conditions).

**Proposition 2.2.1.** For any bounded non-empty set \(E \subseteq \mathbb{R}^n\):
1. \(\underline{\dim}_B(E) \leq \overline{\dim}_B(E)\).
2. If \(\dim_B(E)\) exists, then \(0 \leq \dim_B(E) \leq n\).
3. \(\dim_H(E) \leq \underline{\dim}_B(E) \leq \overline{\dim}_B(E)\).
4. Box dimension is countably stable: if \(E = \bigcup_i E_i\), then \(\overline{\dim}_B(E) = \sup_i \overline{\dim}_B(E_i)\).

**Remark.** Unlike Hausdorff dimension, box dimension does not always equal Hausdorff dimension. However, for self-similar sets satisfying the *open set condition*, they coincide.

## 2.3 Minkowski Content

The \(s\)-dimensional Minkowski content provides a geometric interpretation of box dimension and refines the notion of "size" at a given dimension.

**Definition.** For \(s > 0\), the *lower Minkowski content* is

\[
\underline{M}^s(E) = \liminf_{\epsilon \to 0^+} \frac{\text{Vol}(E^\epsilon)}{\epsilon^{n-s}},
\]

where \(E^\epsilon = \{x : d(x, E) \leq \epsilon\}\) is the \(\epsilon\)-fattening of \(E\). Similarly, the *upper Minkowski content* \(\overline{M}^s(E)\) uses \(\limsup\).

**Proposition 2.3.1.** If \(E\) is compact with \(\overline{\dim}_B(E) = s\), then \(\overline{M}^s(E) < \infty\) (though the lower Minkowski content may be zero).

---

# Chapter 3: Self-Similar Sets and the Open Set Condition

## 3.1 Iterated Function Systems

A cornerstone of fractal geometry is the theory of iterated function systems (IFS), which provides a powerful method for constructing and analyzing fractals.

**Definition (IFS).** An *iterated function system* is a finite collection of contractive maps \(f_1, f_2, \ldots, f_m : \mathbb{R}^n \to \mathbb{R}^n\), where each \(f_i\) is a contraction with ratio \(r_i \in (0, 1)\). That is,

\[
|f_i(x) - f_i(y)| \leq r_i |x - y| \quad \text{for all } x, y \in \mathbb{R}^n.
\]

## 3.2 The Attractor Theorem

**Theorem 3.2.1 (Hutchinson, 1981).** Let \(\{f_1, \ldots, f_m\}\) be an IFS with contraction ratios \(r_1, \ldots, r_m \in (0, 1)\). Then there exists a unique non-empty compact set \(F \subseteq \mathbb{R}^n\), called the *attractor* (or *invariant set*), such that

\[
F = \bigcup_{i=1}^m f_i(F).
\]

Furthermore, \(F\) is the unique fixed point of the Hutchinson operator \(\Phi(X) = \bigcup_{i=1}^m f_i(X)\) on the complete metric space of non-empty compact subsets of \(\mathbb{R}^n\) (endowed with the Hausdorff distance).

**Proof sketch.** Define the Hutchinson operator on compact sets. Since each \(f_i\) is a contraction with ratio \(r_i < 1\), the operator \(\Phi\) is a contraction with ratio \(r = \max_i r_i < 1\) in the Hausdorff metric. By the Banach fixed point theorem, \(\Phi\) has a unique fixed point.

**Example 3.2.2 (Sierpinski gasket).** Let \(f_1(x) = \frac{1}{2}x\), \(f_2(x) = \frac{1}{2}x + (1/2, 0)\), \(f_3(x) = \frac{1}{2}x + (1/4, \sqrt{3}/4)\). The attractor is the Sierpinski gasket.

## 3.3 Self-Similar Sets and Similarity Dimension

**Definition.** A compact set \(F \subseteq \mathbb{R}^n\) is *self-similar* if \(F = \bigcup_{i=1}^m f_i(F)\) where each \(f_i\) is a similarity (a composition of a contraction, rotation, and translation).

For a similarity with contraction ratio \(r_i\), the *similarity dimension* \(s\) is defined by

\[
\sum_{i=1}^m r_i^s = 1.
\]

**Theorem 3.3.1.** If \(F\) is the attractor of an IFS of similarities with contraction ratios \(r_1, \ldots, r_m\) satisfying the *open set condition* (defined below), then

\[
\dim_H(F) = \dim_B(F) = s,
\]

where \(s\) is the similarity dimension.

## 3.4 The Open Set Condition

The open set condition (OSC) is a technical but crucial hypothesis that ensures the similarity dimension equals the Hausdorff dimension.

**Definition (open set condition).** An IFS \(\{f_1, \ldots, f_m\}\) satisfies the *open set condition* if there exists a non-empty bounded open set \(U\) such that:
1. The sets \(f_i(U)\) are pairwise disjoint.
2. \(\bigcup_{i=1}^m f_i(U) \subseteq U\).

**Remark.** The OSC is equivalent to saying that the pieces of the fractal do not overlap significantly. For "generic" IFS, the OSC holds.

**Theorem 3.4.1 (Dimension under OSC).** If an IFS of similarities satisfies the open set condition, then:

\[
H^s(F) > 0 \quad \text{and} \quad \dim_H(F) = \dim_B(F) = s.
\]

**Example 3.4.2.** The standard Cantor set satisfies the OSC with \(U = (0, 1)\). The Sierpinski gasket and Sierpinski carpet also satisfy the OSC. These are "good" fractals with clear scaling behavior.

**Example 3.4.3 (Bedford-McMullen carpet).** Not all self-affine sets satisfy the OSC. The Bedford-McMullen carpet, constructed with non-isotropic scaling, requires more delicate analysis.

---

# Chapter 4: Iterated Function Systems and Attractors

## 4.1 Convergence to the Attractor

While Hutchinson's theorem guarantees existence and uniqueness, we also want to understand how iterates of the operator converge.

**Theorem 4.1.1.** Let \(\{f_1, \ldots, f_m\}\) be an IFS with contraction ratios \(r_i\) and \(r = \max_i r_i\). Starting from any non-empty compact set \(K_0 \subseteq \mathbb{R}^n\), define \(K_{n+1} = \Phi(K_n) = \bigcup_{i=1}^m f_i(K_n)\). Then \(K_n \to F\) in the Hausdorff metric, with rate \(O(r^n)\).

This provides an algorithmic way to approximate the attractor.

## 4.2 Self-Affine Sets

An extension of self-similar sets is to allow non-isotropic scaling. A set \(F\) is *self-affine* if \(F = \bigcup_{i=1}^m A_i F + b_i\), where each \(A_i\) is an invertible linear map (with eigenvalues less than 1 in absolute value) and \(b_i \in \mathbb{R}^n\).

Self-affine sets are significantly harder to analyze. The dimension formula no longer has a simple closed form, and there is no universal analog of the similarity dimension. Computing the dimension of a self-affine set often requires analyzing the Lyapunov exponents of the linear maps.

**Example 4.2.1 (Sierpinski carpet).** In the standard construction, we use 8 isotropic contractions with ratio \(1/3\). However, one can construct carpets with anisotropic scaling (e.g., horizontal and vertical scaling factors differ), yielding self-affine sets.

## 4.3 Planar IFS and Graphics

IFS provide a beautiful method for generating fractals on a computer. The *chaos game* (random iteration) is a practical algorithm:

1. Choose an initial point \(x_0 \in \mathbb{R}^n\) (often arbitrarily).
2. At each step, select \(f_i\) uniformly at random and set \(x_{n+1} = f_i(x_n)\).
3. Plot the points \(x_n\) for large \(n\).

Despite the randomness, the orbit converges to the attractor \(F\) with probability 1. The distribution of points on \(F\) depends on the contraction ratios; if all ratios are equal, the distribution is roughly uniform (with respect to Hausdorff measure).

---

# Chapter 5: Self-Similar Measures and Besicovitch-Kakeya Sets

## 5.1 Self-Similar Measures

Just as we construct self-similar sets via IFS, we can construct self-similar measures.

**Definition.** Let \(\{f_1, \ldots, f_m\}\) be an IFS with contraction ratios \(r_i\), and let \(p_1, \ldots, p_m > 0\) with \(\sum p_i = 1\). A *self-similar measure* is a probability measure \(\mu\) satisfying

\[
\mu = \sum_{i=1}^m p_i (f_i)_\# \mu,
\]

where \((f_i)_\# \mu\) denotes the push-forward of \(\mu\) under \(f_i\).

**Theorem 5.1.1.** For any IFS and probability weights \(p_i\), there exists a unique self-similar measure \(\mu\). Moreover, \(\mu\) is supported on the attractor \(F\) (and typically has full support on \(F\)).

The measure \(\mu\) can be constructed as the unique fixed point of a contraction on the space of probability measures (endowed with the Wasserstein or weak-* topology).

## 5.2 Dimension of Self-Similar Measures

For a self-similar measure, we can define a dimension that refines Hausdorff dimension by taking weights into account.

**Definition.** The *Hausdorff dimension* of the measure \(\mu\) is

\[
\dim({\mu}) = \inf\{ \dim_H(A) : \mu(A) = 1 \}.
\]

Alternatively, one can use *information dimension*:

\[
d_I(\mu) = \lim_{\epsilon \to 0^+} \frac{H(\mu(B(x, \epsilon)))}{-\log \epsilon},
\]

where \(H(p) = -\sum_i p_i \log p_i\) is the entropy.

## 5.3 Besicovitch-Kakeya Sets

A classical problem in harmonic analysis concerns the structure of sets that contain line segments in all directions.

**Definition (Kakeya set).** A *Kakeya set* (or *Kakutani set*) is a compact set \(K \subseteq \mathbb{R}^n\) such that for each direction \(v \in S^{n-1}\) (the unit sphere), there exists a line segment in the direction \(v\) that is entirely contained in \(K\).

**Definition (Besicovitch set).** A *Besicovitch set* is a compact set \(B \subseteq \mathbb{R}^2\) such that \(B\) contains a unit line segment in every direction.

**Classical result.** It is known that there exist Besicovitch sets of arbitrarily small area (Lebesgue measure zero). In 1919, Besicovitch constructed explicit examples.

**Kakeya conjecture.** The famous Kakeya conjecture asserts that any Kakeya set in \(\mathbb{R}^n\) must have Hausdorff dimension equal to \(n\).

In \(\mathbb{R}^2\), the conjecture is proven: any Kakeya set has \(\dim_H \geq 2\) (hence dimension exactly 2 by upper bound). In higher dimensions, the conjecture remains open, though there are powerful partial results (e.g., using algebraic geometry and wave packet decompositions).

---

# Chapter 6: Local Dimensions and Multi-Fractal Analysis

## 6.1 Hölder Exponents and Local Dimension

Multi-fractal analysis refines our understanding of fractals by studying the "roughness" of a measure at different points.

**Definition.** Let \(\mu\) be a measure on \(\mathbb{R}^n\) and \(x \in \mathbb{R}^n\). The *local dimension* (or *Hölder exponent*) of \(\mu\) at \(x\) is

\[
\alpha(\mu, x) = \lim_{\epsilon \to 0^+} \frac{\log \mu(B(x, \epsilon))}{\log \epsilon},
\]

provided the limit exists.

Intuitively, if \(\mu(B(x, \epsilon)) \approx \epsilon^{\alpha(x)}\), then the measure is scaling like \(\epsilon^{\alpha(x)}\) near \(x\).

**Remark.** For the Lebesgue measure in \(\mathbb{R}^n\), the local dimension is everywhere equal to \(n\). For singular measures (like self-similar measures on fractals), the local dimension varies across the set and is typically less than the ambient dimension.

## 6.2 The Spectrum of Local Dimensions

The *spectrum* of a measure is the function:

\[
\tau(\alpha) = \dim_H \{ x : \alpha(\mu, x) = \alpha \}.
\]

This records the Hausdorff dimension of the set of points where the local dimension equals \(\alpha\).

**Definition (multi-fractal spectrum).** For a probability measure \(\mu\), the *multi-fractal spectrum* is the set of all Hölder exponents that actually occur: \(\mathcal{A}(\mu) = \{ \alpha : \tau(\alpha) > 0 \}\).

**Theorem 6.2.1 (Large Deviations).** For self-similar measures satisfying the OSC, the spectrum can be computed via the *Legendre-Fenchel transform* of the pressure function (from thermodynamic formalism). Specifically, if \(\mu = \sum_i p_i (f_i)_\# \mu\) with contraction ratios \(r_i\), then

\[
\tau(\alpha) = \inf_{t \in \mathbb{R}} \left( t \alpha + \sum_{i=1}^m p_i \log r_i \cdot f(t) \right),
\]

where \(f(t)\) is related to the contraction structure.

## 6.3 Multi-Fractal Analysis and Self-Affine Measures

Self-affine measures (on self-affine sets) exhibit more intricate multi-fractal behavior. The spectrum is no longer simply convex and may have discontinuities.

**Example 6.3.1.** For the Bernoulli measure on the Cantor set with weights \(p\) and \(1-p\), the spectrum \(\tau(\alpha)\) is a concave function of \(\alpha\), with \(\tau\) ranging from \(0\) to \(\log 2 / \log 3\) (the Hausdorff dimension of the set).

---

# Chapter 7: Assouad Dimension and Regularity

## 7.1 Assouad Dimension

While Hausdorff dimension and box dimension are "global" in nature, the Assouad dimension is a "local" notion that captures the complexity of a set at all scales simultaneously.

**Definition (Assouad dimension).** For a set \(E \subseteq \mathbb{R}^n\) and a point \(x \in E\), define \(N_E(x, r, R)\) as the maximum number of points in \(E \cap B(x, R)\) that are pairwise at distance at least \(r\) apart, where \(0 < r \leq R\).

The *Assouad dimension* of \(E\) is

\[
\dim_A(E) = \inf \left\{ d \geq 0 : \exists C > 0 \text{ such that } N_E(x, r, R) \leq C \left( \frac{R}{r} \right)^d \text{ for all } x \in E, \, 0 < r \leq R \right\}.
\]

**Proposition 7.1.1.** For any non-empty set \(E\):
1. \(\dim_H(E) \leq \dim_A(E) \leq \overline{\dim}_B(E)\).
2. \(\dim_A(E) = \dim_B(E)\) if the set is self-similar with the OSC.
3. Assouad dimension is not countably stable (unlike box dimension). Instead, \(\dim_A(\bigcup_i E_i) = \sup_i \dim_A(E_i)\) only if the supremum is attained.

## 7.2 Assouad Regularity

A set is *Assouad regular* if it exhibits uniform scaling behavior at all scales. This has strong consequences for the geometry.

**Definition.** A set \(E\) is *Assouad regular* if there exist constants \(c_1, c_2 > 0\) and \(d \geq 0\) such that for all \(x \in E\) and all \(0 < r \leq R\),

\[
c_1 \left( \frac{R}{r} \right)^d \leq N_E(x, r, R) \leq c_2 \left( \frac{R}{r} \right)^d.
\]

**Theorem 7.2.1.** If \(E\) is the attractor of an IFS of similarities satisfying the OSC, then \(E\) is Assouad regular with \(d = \dim_H(E)\).

The Assouad regularity of self-similar sets is important for understanding their resistance to perturbation and their behavior under small deformations.

---

# Chapter 8: Bernoulli Convolutions and Salem Sets

## 8.1 Bernoulli Convolutions

Bernoulli convolutions form a classical family of measures and sets in fractal geometry, with deep connections to number theory and harmonic analysis.

**Definition.** For a parameter \(\lambda \in (0, 1)\) and a weight \(p \in (0, 1)\), the *Bernoulli measure* is

\[
\mu_{\lambda, p} = p \, \delta_0 * \mu_{\lambda, p} + (1-p) \, \delta_1 * \mu_{\lambda, p},
\]

where \(\delta_x\) is the Dirac measure at \(x\) and \(*\) denotes convolution. Equivalently, thinking recursively,

\[
\mu_{\lambda, p} = p \, \mu_{\lambda, p}(\cdot / \lambda) + (1-p) \, \mu_{\lambda, p}((\cdot - 1) / \lambda).
\]

The support of \(\mu_{\lambda, p}\) is the self-similar set:

\[
K_\lambda = \left\{ \sum_{i=1}^\infty \epsilon_i \lambda^i : \epsilon_i \in \{0, 1\} \right\}.
\]

## 8.2 Dimension of Bernoulli Convolutions

The dimension of \(K_\lambda\) (and the Hausdorff dimension of the measure \(\mu_{\lambda, p}\)) depends delicately on \(\lambda\).

**Theorem 8.2.1 (Peres-Solomyak).** For almost all \(\lambda \in (1/2, 1)\) and all \(p \in (0, 1)\), the Hausdorff dimension of \(K_\lambda\) is

\[
\dim_H(K_\lambda) = \frac{\min(H(p), 1)}{\log(1/\lambda)},
\]

where \(H(p) = -p \log p - (1-p) \log(1-p)\) is the binary entropy.

For special values (like \(\lambda = 1/2\) or \(\lambda\) equal to the golden ratio's reciprocal), the dimension has been computed exactly.

## 8.3 Salem Sets and Absolute Continuity

A fascinating question concerns when the self-similar measure \(\mu_{\lambda, p}\) is absolutely continuous with respect to Lebesgue measure.

**Definition (Salem set).** A compact set \(E \subseteq \mathbb{R}\) is a *Salem set* if its Hausdorff dimension equals its packing dimension (the two agree) and there exists a probability measure \(\mu\) supported on \(E\) such that

\[
\int |\hat{\mu}(t)| \, dt < \infty,
\]

where \(\hat{\mu}(t) = \int e^{-2\pi i t x} \, d\mu(x)\) is the Fourier transform of \(\mu\).

**Theorem 8.3.1 (Peres-Schlag).** For \(\lambda\) in a dense set of values (including some \(\lambda\) with \(\dim_H(K_\lambda) > 0\)), the Bernoulli convolution \(K_\lambda\) is a Salem set.

---

# Chapter 9: Harmonic Analysis on Fractals

## 9.1 Wavelets and Fourier Analysis on Fractals

The study of harmonic analysis on fractal sets has profound applications to signal processing, PDE, and approximation theory.

**Key Idea.** On a smooth manifold, we have a rich supply of smooth functions and can use Fourier methods. On a fractal, the lack of differentiability requires different tools.

**Definition.** A *wavelet system* on a set \(E\) is a collection of functions \(\{\psi_{j,k}\}\) (indexed by scale \(j\) and position \(k\)) such that:
1. Each \(\psi_{j,k}\) is concentrated near scale \(2^{-j}\).
2. The system spans a dense subspace of \(L^2(E, \mu)\).
3. The system is nearly orthogonal (with controlled overlaps).

**Theorem 9.1.1 (Strichartz).** For the Cantor set \(C\) and the natural Cantor measure, one can construct explicit wavelet bases that are adapted to the self-similar structure. These wavelets are localized in both space and frequency, and provide efficient representations of functions on \(C\).

## 9.2 Fourier Transform of Self-Similar Measures

A classical question is to understand the decay of the Fourier coefficients \(\hat{\mu}(t)\) for self-similar measures.

**Theorem 9.2.1 (Dimension and Fourier Decay).** If \(\mu\) is a self-similar measure on a set of Hausdorff dimension \(d < n\), then

\[
\hat{\mu}(t) = O(|t|^{-\delta}) \quad \text{as } |t| \to \infty
\]

for some \(\delta > 0\) depending on \(d\). More precisely, for many self-similar measures, \(\delta \approx d/2\).

This decay is important in spectral theory and has applications to the distribution of energy in PDEs on fractals.

## 9.3 Singular Integrals and Lipschitz Harmonic Functions

Another direction is to study boundary value problems on fractals. For instance, does the Dirichlet problem have a solution on a fractal domain?

**Theorem 9.3.1 (David-Semmes).** For a self-similar set satisfying the OSC, one can define Lipschitz harmonic functions via extension theorems and estimates analogous to those in smooth contexts. The Dirichlet problem can be solved on a dense set of functions, with control by the Assouad dimension.

---

# Chapter 10: Laplacians and Heat Kernels on Fractal Domains

## 10.1 Motivation: Self-Similar Graphs

The study of Laplacians on fractals is a natural extension of spectral theory on graphs. On a self-similar set like the Sierpinski gasket, one can define a notion of "harmonic function" and a "Laplacian operator" that respects the self-similar structure.

**Example 10.1.1 (Sierpinski gasket).** Define a graph structure by:
- Vertices: points at the "level \(n\)" of the Sierpinski gasket construction.
- Edges: connect adjacent vertices at that level.

A *harmonic function* on this graph is one that, at each vertex, takes the average of its neighbors' values.

## 10.2 Construction of the Dirichlet Form

For a self-similar set \(F\), one constructs a *Dirichlet form* \(\mathcal{E}\) via an intrinsic limit process:

\[
\mathcal{E}(u, v) = \lim_{n \to \infty} \sum_{\text{edges in } F_n} r^{-n} (u_e - v_e)^2,
\]

where the sum is over edges at the \(n\)-th level of construction, \(r\) is the contraction ratio, and \(u_e, v_e\) are the values of \(u, v\) at the endpoints of edge \(e\).

**Proposition 10.2.1.** This limit defines a closed quadratic form on an appropriate function space. The associated operator \(\Delta\) (the Laplacian on the fractal) is densely defined and non-negative.

## 10.3 Heat Kernel Estimates

A fundamental object in PDE and spectral geometry is the *heat kernel*—the fundamental solution to the heat equation \(\partial_t u = \Delta u\).

**Theorem 10.3.1 (Kigami).** For the Laplacian on a self-similar set (such as the Sierpinski gasket), the heat kernel \(p_t(x, y)\) satisfies:

1. **Upper bound (on-diagonal):** \(p_t(x, x) \leq C t^{-\alpha/2}\), where \(\alpha\) is the Hausdorff dimension.

2. **Off-diagonal bounds:** For \(d(x, y) > 0\), the heat kernel decays both in time and space:

\[
p_t(x, y) \leq C t^{-\alpha/2} \exp\left( -c \frac{d(x, y)^2}{t} \right).
\]

These bounds are analogous to classical heat kernel estimates on Riemannian manifolds, but with time scales adjusted for the fractal dimension.

## 10.4 Spectral Properties and Periodic Orbits

The spectrum of the Laplacian on a self-similar set exhibits interesting structure related to the self-similarity.

**Theorem 10.4.1.** For a self-similar set with contractions of ratio \(r < 1/2\), the spectrum \(\sigma(\Delta)\) is a self-similar Cantor set. That is, the eigenvalues of \(\Delta\) form a fractal set.

Moreover, the *spectral dimension* (the dimension of the measure defined by the spectral density of states) can be computed explicitly from the self-similar structure.

## 10.5 Applications and Future Directions

The theory of Laplacians on fractals has applications to:

- **Physics:** Anomalous diffusion on disordered materials (fractals model disorder).
- **Approximation:** Using fractal-adapted bases (wavelets) for numerical methods.
- **Number Theory:** Connections between spectral theory and distribution of primes.

---

# Conclusion and Further Directions

Fractal geometry has evolved from a collection of exotic examples into a central tool in mathematics, with deep connections to analysis, probability, PDEs, harmonic analysis, and even algebraic geometry. The theory of Hausdorff measure and dimension provides a quantitative language for irregular sets. Self-similar sets constructed via IFS offer both theoretical rigor and computational efficiency. Multi-fractal analysis, through local dimensions and spectra, reveals the intricate scaling behavior of measures. And the emerging theory of analysis on fractals—including Laplacians, heat kernels, and harmonic functions—extends classical PDE and spectral theory to non-smooth domains.

Open questions abound:
- The Kakeya conjecture in higher dimensions.
- The exact dimension of self-affine sets (except in special cases).
- Optimal bounds on Fourier decay for general fractal measures.
- A complete understanding of spectrum of Laplacians on more general fractals.

These problems, and many others, continue to drive research at the frontier of fractal geometry and its adjacent fields. The interplay between geometric intuition, rigorous analysis, and computational insight makes fractal geometry a uniquely rich area of modern mathematics.
