---
title: "PMATH 453: Functional Analysis"
prof: "Stephen New"
subjects: "PMATH"
---

> These notes are primarily based on Prof. Stephen New's lectures. Additional definitions, theorems, examples, and explanations have been incorporated from [Felix Zhou's course notes](https://felix-zhou.com/) (Prof. Laurent Marcoux, Fall 2021) and from [Prof. Marcoux's official course notes](https://www.math.uwaterloo.ca/~lwmarcou/notes/pmath453.pdf) (5th ed., 2022).

Functional analysis is the branch of mathematics concerned with infinite-dimensional vector spaces equipped with analytic structure — norms, inner products, and topologies — together with the linear maps between them. This course develops the three pillars of classical functional analysis: Hilbert space theory (orthogonal decomposition, spectral theory), Banach space theory (the Hahn-Banach theorem, open mapping theorem, closed graph theorem), and general topology (weak topologies, compactness, the Banach-Alaoglu theorem). The prerequisite material from real analysis (PMATH 351) and measure theory (PMATH 450) is reviewed in Chapter 0.

---

## Chapter 0: Prerequisite Review

This chapter collects the background material from real analysis and measure theory that will be used throughout the course. The goal is not to re-derive these results but to fix notation and recall the key facts that the main chapters will draw on freely.

### Real Analysis (PMATH 351)

#### Cardinality

**Definition 0.1 (Injective, Surjective, Bijective).** Let \( f : X \to Y \). We say \( f \) is **injective** (one-to-one) when for all \( x_1, x_2 \in X \), \( f(x_1) = f(x_2) \implies x_1 = x_2 \). We say \( f \) is **surjective** (onto) when \( \operatorname{Range}(f) = Y \). We say \( f \) is **bijective** when it is both injective and surjective.

**Definition 0.2 (Cardinality).** For sets \( A \) and \( B \):
- We write \( |A| = |B| \) when there exists a bijection \( f : A \to B \).
- We write \( |A| \leq |B| \) when there exists an injection \( f : A \to B \).
- We say \( A \) is **countable** when \( |A| = |\mathbb{N}| \), writing \( |A| = \aleph_0 \). A set is **at most countable** when it is finite or countable. A set is **uncountable** when it is neither finite nor countable.

Cardinality gives us a precise way to compare the "sizes" of infinite sets. The distinction between countable and uncountable sets is fundamental in analysis: many constructions work freely over countable index sets but break down in the uncountable case, as we will see when we study Hilbert bases and separability.

**Theorem 0.3.** The sets \( \mathbb{N} \times \mathbb{N} \), \( \mathbb{Z} \), and \( \mathbb{Q} \) are all countable. A countable union of countable sets is countable. The set \( \mathbb{R} \) is uncountable, and \( |\mathbb{R}| = 2^{\aleph_0} \).

**Theorem 0.4 (Cantor–Schroeder–Bernstein).** If \( |A| \leq |B| \) and \( |B| \leq |A| \) then \( |A| = |B| \).

The Cantor-Schroeder-Bernstein Theorem is extremely useful in practice: to show two sets have the same cardinality, it suffices to exhibit injections in both directions, avoiding the need to construct an explicit bijection.

**Theorem 0.5 (Cantor).** For every set \( A \), \( |A| < |\mathcal{P}(A)| \). In particular, no set is in bijection with its own power set.

#### Lebesgue Measure

Lebesgue measure is the rigorous foundation for integration in this course. The key step is the extension from the obvious notion of the length of an interval to a measure defined on a much larger class of sets — including all open and closed sets — while preserving countable additivity.

**Definition 0.6 (Outer Measure).** For \( A \subseteq \mathbb{R} \), the **Lebesgue outer measure** of \( A \) is

\[
\lambda^*(A) = \inf \left\{ \sum_{n=1}^\infty |I_n| \;\Big|\; \text{each } I_n \text{ is a bounded open interval and } A \subseteq \bigcup_{n=1}^\infty I_n \right\}.
\]

**Definition 0.7 (Lebesgue Measurability).** A set \( A \subseteq \mathbb{R} \) is **(Lebesgue) measurable** when for every \( X \subseteq \mathbb{R} \),

\[
\lambda^*(X) = \lambda^*(X \cap A) + \lambda^*(X \setminus A).
\]
When \( A \) is measurable, its **Lebesgue measure** is \( \lambda(A) = \lambda^*(A) \).

**Theorem 0.8 (Properties of Measure).** The collection \( \mathcal{M} \) of measurable subsets of \( \mathbb{R} \) forms a \( \sigma \)-algebra containing all open and closed sets. Measure is countably additive: if \( A_1, A_2, \ldots \) are measurable and pairwise disjoint then \( \lambda(\bigcup_{k=1}^\infty A_k) = \sum_{k=1}^\infty \lambda(A_k) \). If \( A_1 \subseteq A_2 \subseteq \cdots \) then \( \lambda(\bigcup A_n) = \lim_{n\to\infty} \lambda(A_n) \). There exist non-measurable sets.

The Carathéodory condition in Definition 0.7 is the "right" definition of measurability: it says that \( A \) splits every test set \( X \) additively. This condition is verified for all open sets, all closed sets, and is closed under countable operations, yielding the \( \sigma \)-algebra \( \mathcal{M} \). The existence of non-measurable sets (requiring the Axiom of Choice) shows the theory cannot be extended to all subsets of \( \mathbb{R} \).

**Example 0.9 (Cantor Set).** The standard Cantor set \( C \subseteq [0,1] \) is constructed by iteratively removing open middle thirds. It satisfies \( \lambda(C) = 0 \) and \( |C| = 2^{\aleph_0} \). Every subset of \( C \) is measurable (as a null set). More generally, one can construct a Cantor-like set with any prescribed measure \( m \in [0,1) \).

### Functional Analysis Prerequisites (PMATH 450)

The \( L^p \) spaces and their properties, including Hölder's and Minkowski's inequalities, are developed in PMATH 450 and recalled below in the Examples section of Chapter 1. The key facts are:

- For a measurable set \( A \subseteq \mathbb{R} \) and \( 1 \leq p \leq \infty \), the spaces \( L^p(A) \) are Banach spaces.
- \( L^2(A) \) is a Hilbert space under \( \langle f, g \rangle = \int_A f \bar{g} \).
- For \( a < b \), \( L^p[a,b] \) is separable for \( 1 \leq p < \infty \), and \( L^\infty[a,b] \) is not separable.

---

# Chapter 1: Preliminaries

## Basic Definitions

We begin by establishing the hierarchy of structured spaces that pervades functional analysis: inner product spaces, normed spaces, metric spaces, and topological spaces. Each layer forgets some structure while retaining key analytic properties.

**Definition 1.1 (Inner Product Space).** Let \( \mathbb{F} = \mathbb{R} \) or \( \mathbb{C} \). Let \( U \) be a vector space over \( \mathbb{F} \). An **inner product** on \( U \) is a function \( \langle \cdot, \cdot \rangle : U \times U \to \mathbb{F} \) such that for all \( u, v, w \in U \) and all \( t \in \mathbb{F} \):

1. **(Sesquilinearity)** \( \langle u+v, w \rangle = \langle u,w \rangle + \langle v,w \rangle \), \( \langle tu, v \rangle = t\langle u,v \rangle \), \( \langle u, v+w \rangle = \langle u,v \rangle + \langle u,w \rangle \), \( \langle u, tv \rangle = \bar{t}\langle u,v \rangle \).
2. **(Conjugate Symmetry)** \( \langle u,v \rangle = \overline{\langle v,u \rangle} \).
3. **(Positive Definiteness)** \( \langle u,u \rangle \geq 0 \) with \( \langle u,u \rangle = 0 \iff u = 0 \).

An **inner product space** over \( \mathbb{F} \) is a vector space equipped with an inner product. A linear map \( L : U \to V \) between inner product spaces **preserves inner product** when \( \langle L(x), L(y) \rangle = \langle x, y \rangle \) for all \( x, y \in U \).

**Definition 1.2 (Normed Linear Space).** A **norm** on a vector space \( U \) over \( \mathbb{F} \) is a map \( \|\cdot\| : U \to \mathbb{R} \) satisfying for all \( u, v \in U \) and \( t \in \mathbb{F} \):

1. **(Scaling)** \( \|tu\| = |t|\,\|u\| \).
2. **(Positive Definiteness)** \( \|u\| \geq 0 \) with \( \|u\| = 0 \iff u = 0 \).
3. **(Triangle Inequality)** \( \|u+v\| \leq \|u\| + \|v\| \).

A **normed linear space** is a vector space equipped with a norm. A **unit vector** is any \( u \) with \( \|u\| = 1 \).

Every inner product space is in particular a normed space, as the following theorem confirms. The Cauchy-Schwarz inequality is the engine behind most estimates in Hilbert space theory, and the Parallelogram Law is the algebraic identity that, conversely, characterizes norms arising from inner products.

**Theorem 1.3.** Let \( U \) be an inner product space over \( \mathbb{F} \). Define \( \|u\| = \sqrt{\langle u,u \rangle} \). Then:

1. **(Scaling)** \( \|tu\| = |t|\,\|u\| \).
2. **(Positive Definiteness)** \( \|u\| \geq 0 \) with \( \|u\| = 0 \iff u = 0 \).
3. \( \|u+v\|^2 = \|u\|^2 + 2\operatorname{Re}\langle u,v \rangle + \|v\|^2 \).
4. **(Pythagoras)** If \( \langle u,v \rangle = 0 \) then \( \|u+v\|^2 = \|u\|^2 + \|v\|^2 \).
5. **(Parallelogram Law)** \( \|u+v\|^2 + \|u-v\|^2 = 2\|u\|^2 + 2\|v\|^2 \).
6. **(Polarization Identity)** If \( \mathbb{F} = \mathbb{R} \): \( \langle u,v \rangle = \tfrac{1}{4}(\|u+v\|^2 - \|u-v\|^2) \). If \( \mathbb{F} = \mathbb{C} \): \( \langle u,v \rangle = \tfrac{1}{4}(\|u+v\|^2 + i\|u+iv\|^2 - \|u-v\|^2 - i\|u-iv\|^2) \).
7. **(Cauchy-Schwarz)** \( |\langle u,v \rangle| \leq \|u\|\,\|v\| \), with equality iff \( \{u,v\} \) is linearly dependent.
8. **(Triangle Inequality)** \( \|u+v\| \leq \|u\| + \|v\| \).

In particular, \( \|\cdot\| \) is a norm on \( U \). **Proof omitted.**

**Definition 1.4 (Metric Space).** A **metric** on a nonempty set \( X \) is a function \( d : X \times X \to \mathbb{R} \) satisfying for all \( x, y, z \in X \):
1. **(Positive Definiteness)** \( d(x,y) \geq 0 \) with \( d(x,y) = 0 \iff x = y \).
2. **(Symmetry)** \( d(x,y) = d(y,x) \).
3. **(Triangle Inequality)** \( d(x,z) \leq d(x,y) + d(y,z) \).

**Definition 1.5 (Topology).** A **topology** on a set \( X \) is a collection \( \mathcal{T} \) of subsets of \( X \) such that: (1) \( \emptyset, X \in \mathcal{T} \); (2) finite intersections of elements of \( \mathcal{T} \) lie in \( \mathcal{T} \); (3) arbitrary unions of elements of \( \mathcal{T} \) lie in \( \mathcal{T} \). A subset \( A \subseteq X \) is **open** when \( A \in \mathcal{T} \) and **closed** when \( X \setminus A \in \mathcal{T} \).

**Note 1.6.** These structures form a hierarchy: an inner product induces a norm via \( \|x\| = \sqrt{\langle x,x \rangle} \); a norm on \( V \) induces a metric on any \( X \subseteq V \) via \( d(x,y) = \|x-y\| \); a metric induces a topology by declaring \( A \) open when for every \( a \in A \) there exists \( r > 0 \) with \( B(a,r) \subseteq A \).

Each step in this hierarchy loses structure: an inner product remembers angles and lengths, a norm remembers only lengths, a metric remembers only distances, and a topology remembers only which sets are "open." The key analytic property — completeness — lives at the metric level and gives us Banach and Hilbert spaces as the canonical objects of study.

**Definition 1.7 (Convergence and Cauchy Sequences).** Let \( (x_n)_{n \geq 1} \) be a sequence in a metric space \( X \). We say \( x_n \to a \) when

\[
\forall \varepsilon > 0 \; \exists n_0 \in \mathbb{Z}^+ \; \forall k \geq n_0 : d(x_k, a) < \varepsilon.
\]
The sequence is **Cauchy** when \( \forall \varepsilon > 0 \; \exists n_0 \; \forall k, \ell \geq n_0 : d(x_k, x_\ell) < \varepsilon \). Every convergent sequence is Cauchy.

**Definition 1.8 (Complete Spaces).** A metric space is **complete** when every Cauchy sequence converges. A complete normed linear space is called a **Banach space**. A complete inner product space is called a **Hilbert space**.

**Definition 1.9 (Dense and Separable).** A subset \( A \subseteq X \) is **dense** in \( X \) when \( \overline{A} = X \). A metric space is **separable** when it contains a countable dense subset.

## Examples of Banach and Hilbert Spaces

With the definitions in place, we now survey the principal examples. These spaces — finite-dimensional Euclidean spaces, sequence spaces, and function spaces — will appear repeatedly throughout the course. Understanding which are Hilbert spaces (complete inner product spaces) versus merely Banach spaces (complete normed spaces) is essential, as the geometric structure of the inner product enables tools like orthogonal projections and the Riesz Representation Theorem that are unavailable in general Banach spaces.

**Example 1.10 (\( \mathbb{F}^n \).** The **standard inner product** on \( \mathbb{F}^n \) is \( \langle x, y \rangle = y^* x = \sum_{k=1}^n x_k \overline{y_k} \). This induces the **2-norm** \( \|x\|_2 = (\sum_{k=1}^n |x_k|^2)^{1/2} \). The space \( \mathbb{F}^n \) is a finite-dimensional separable Hilbert space.

**Example 1.11 (\( \ell^2 \).** Let \( \ell^2 = \ell^2(\mathbb{F}) = \{ x \in \mathbb{F}^\omega \mid \sum_{k=1}^\infty |x_k|^2 < \infty \} \). The **standard inner product** is \( \langle x, y \rangle = \sum_{k=1}^\infty x_k \overline{y_k} \), inducing the **2-norm** \( \|x\|_2 = (\sum_{k=1}^\infty |x_k|^2)^{1/2} \). The space \( \ell^2 \) is an infinite-dimensional separable Hilbert space.

**Example 1.12 (\( L^2(A) \).** Let \( A \subseteq \mathbb{R} \) be measurable. Let

\[
L^2(A) = L^2(A, \mathbb{F}) = \left\{ f \in M(A) \Big| \int_A |f|^2 < \infty \right\} \big/ \sim
\]
where \( f \sim g \iff f = g \) a.e. The standard inner product is \( \langle f, g \rangle = \int_A f \bar{g} \). For \( a < b \), \( L^2[a,b] \) is an infinite-dimensional separable Hilbert space.

**Example 1.13 (\( p \)-norms on \( \mathbb{F}^n \).** For \( x \in \mathbb{F}^n \), define the **\( p \)-norm** \( \|x\|_p = (\sum_{k=1}^n |x_k|^p)^{1/p} \) for \( 1 \leq p < \infty \), and \( \|x\|_\infty = \max_k |x_k| \) (the **supremum norm**). Each gives a norm, and \( \mathbb{F}^n \) is a finite-dimensional separable Banach space under each \( p \)-norm.

**Example 1.14 (\( \ell^p \) spaces).** For \( x \in \mathbb{F}^\omega \), define \( \|x\|_p = (\sum_{k=1}^\infty |x_k|^p)^{1/p} \) for \( 1 \leq p < \infty \) and \( \|x\|_\infty = \sup_k |x_k| \). Let \( \ell^p = \{ x \in \mathbb{F}^\omega \mid \|x\|_p < \infty \} \). Each \( \ell^p \) is a Banach space; \( \ell^p \) is separable for \( 1 \leq p < \infty \) but \( \ell^\infty \) is not separable.

**Example 1.15 (\( L^p(A) \) spaces).** For measurable \( A \subseteq \mathbb{R} \) and \( 1 \leq p < \infty \), the **\( p \)-norm** of \( f \in M(A) \) is \( \|f\|_p = (\int_A |f|^p)^{1/p} \), and the **essential supremum** is \( \|f\|_\infty = \inf\{ m \geq 0 \mid |f(x)| \leq m \text{ a.e.}\} \). Setting \( L^p(A) = \{ f \in M(A) \mid \|f\|_p < \infty \} / \sim \) with \( f \sim g \iff f = g \) a.e., each \( L^p(A) \) is a Banach space. For \( a < b \), \( L^p[a,b] \) is separable for \( 1 \leq p < \infty \) but \( L^\infty[a,b] \) is not.

Note that only \( p = 2 \) yields a Hilbert space among the \( \ell^p \) and \( L^p \) families; for all other values of \( p \), there is no inner product compatible with the norm (the parallelogram law fails). This makes \( L^2 \) and \( \ell^2 \) especially tractable and important.

**Remark 1.16.** The triangle inequality for the \( p \)-norms is **Minkowski's Inequality**, often proved using **Hölder's Inequality**.

**Theorem 1.17 (Hölder's Inequality).** Let \( p, q \in [1,\infty] \) with \( \frac{1}{p} + \frac{1}{q} = 1 \).
1. For all \( x, y \in \mathbb{F}^n \) or \( x, y \in \mathbb{F}^\omega \): \( \|xy\|_1 \leq \|x\|_p \|y\|_q \).
2. For all \( f, g \in M(A) \): \( \|fg\|_1 \leq \|f\|_p \|g\|_q \).

**Proof omitted.**

**Theorem 1.18 (Minkowski's Inequality).** Let \( p \in [1,\infty] \).
1. For all \( x, y \in \mathbb{F}^n \) or \( x, y \in \mathbb{F}^\omega \): \( \|x+y\|_p \leq \|x\|_p + \|y\|_p \).
2. For all \( f, g \in M(A) \): \( \|f+g\|_p \leq \|f\|_p + \|g\|_p \).

**Proof omitted.**

**Example 1.19 (Spaces of Continuous Functions).** Let \( X \) be a metric space. Let \( F_b(X) \) be the space of bounded functions \( f : X \to \mathbb{F} \), and \( C_b(X) \) the space of bounded continuous functions. Both are Banach spaces under the **supremum norm** \( \|f\|_\infty = \sup\{|f(x)| \mid x \in X\} \). When \( X \) is compact, \( C(X) = C_b(X) \) is a Banach space. For \( a < b \), \( C[a,b] \) is separable by the Weierstrass Polynomial Approximation Theorem.

## Additional Examples and Constructions

The following examples from Felix Zhou's notes (Marcoux, Fall 2021) enrich the picture of normed linear spaces and Banach spaces with constructions that appear throughout the course.

<div class="example">
<strong>Example 1.A (The spaces \( c_0 \) and \( c_{00} \)).</strong> Let \( c_{00}(\mathbb{K}) \) denote the set of finitely-supported sequences in \( \mathbb{K} \). Under the sup norm \( \|x\|_\infty = \sup_n |x_n| \), this is a normed linear space but is <em>not</em> complete. The space \( c_0(\mathbb{K}) \) of sequences converging to \( 0 \), also under \( \|\cdot\|_\infty \), is a complete normed linear space (a Banach space). Moreover, \( c_{00} \) is a dense linear manifold in \( c_0 \) but not a closed subspace.
</div>

We distinguish between <em>linear manifolds</em> (vector subspaces that may not be closed) and <em>subspaces</em> (closed linear manifolds). The distinction matters: \( c_{00} \) is a linear manifold of \( c_0 \) but not a subspace, since it is not closed.

<div class="example">
<strong>Example 1.B (The disc algebra).</strong> Let \( \mathbb{D} \subseteq \mathbb{C} \) be the open unit disc and \( \mathbb{T} = \partial \mathbb{D} \) its boundary. The <strong>disc algebra</strong> is

\[
A(\mathbb{D}) := \{ f \in C(\overline{\mathbb{D}}) : f \text{ is holomorphic on } \mathbb{D} \}
\]
equipped with \( \|f\|_\infty := \sup_{z \in \overline{\mathbb{D}}} |f(z)| \). This is a Banach space and is closed under multiplication, making it a Banach algebra. By the Maximum Modulus Principle, the restriction map \( \Gamma : A(\mathbb{D}) \to C(\mathbb{T}) \), \( \Gamma(f) = f|_{\mathbb{T}} \), is isometric, so we identify \( A(\mathbb{D}) \) with the subalgebra of \( C(\mathbb{T}) \) of functions extending holomorphically to \( \mathbb{D} \).
</div>

<div class="example">
<strong>Example 1.C (Weighted \( \ell^2 \) space).</strong> Fix a sequence of positive reals \( (r_n)_{n \geq 1} \). Define

\[
\ell^2_{(r_n)} := \left\{ (x_n)_{n \geq 1} \in \mathbb{K}^\mathbb{N} : \sum_{n \geq 1} r_n |x_n|^2 < \infty \right\}
\]
with inner product \( \langle x, y \rangle = \sum_{n \geq 1} r_n x_n \overline{y_n} \). This is a Hilbert space. The standard \( \ell^2 \) corresponds to \( r_n = 1 \) for all \( n \).
</div>

<div class="definition">
<strong>Definition 1.D (\( \ell^p \)-direct sum and \( \ell^\infty \)-direct sum).</strong> Let \( (X_n, \|\cdot\|_n)_{n \geq 1} \) be a countable family of Banach spaces and \( X = \prod_n X_n \). For \( 1 \leq p < \infty \), the <strong>\( \ell^p \)-direct sum</strong> is

\[
\bigoplus_p X_n := \left\{ (x_n) \in X : \|(x_n)\|_p := \left(\sum_n \|x_n\|_n^p\right)^{1/p} < \infty \right\},
\]
and the <strong>\( \ell^\infty \)-direct sum</strong> is

\[
\bigoplus_\infty X_n := \left\{ (x_n) \in X : \|(x_n)\|_\infty := \sup_n \|x_n\|_n < \infty \right\}.
\]
The <strong>\( c_0 \)-direct sum</strong> is \( \bigoplus_0 X_n := \{(x_n) \in X : \lim_n \|x_n\|_n = 0\} \) with the sup norm. Each of these is a Banach space.
</div>

Direct sums are essential for building new Banach spaces from old ones and appear in the structure theory of compact operators and in decompositions of the spectral theorem.

<div class="proposition">
<strong>Proposition 1.E (Characterization of completeness via series).</strong> A normed linear space \( (X, \|\cdot\|) \) is a Banach space if and only if every absolutely summable sequence in \( X \) is summable: whenever \( \sum_{n=1}^\infty \|x_n\| < \infty \), the series \( \sum_{n=1}^\infty x_n \) converges in \( X \).
</div>

This criterion is often more convenient in practice than verifying Cauchy sequences directly: one constructs a candidate sum from the absolutely convergent series and checks convergence.

<div class="example">
<strong>Example 1.J (Bounded Variation Sequences).</strong> For a sequence \( x = (x_n)_{n \geq 1} \) of scalars, the <strong>total variation</strong> is

\[
V(x) := \sum_{n=1}^\infty |x_{n+1} - x_n|.
\]
If \( V(x) < \infty \), we say \( x \) has <strong>bounded variation</strong>. The space

\[
bv := \{(x_n)_{n \geq 1} \in \mathbb{K}^\mathbb{N} : V(x) < \infty\},
\]
equipped with the norm \( \|(x_n)\|_{bv} := |x_1| + V(x) \), is a Banach space. The subspace \( bv_0 := \{x \in bv : x_n \to 0\} \) is a Banach space under \( \|(x_n)\|_{bv_0} := V(x) \).
</div>

The norm \( \|(x_n)\|_{bv} = |x_1| + V(x) \) controls both the initial value and the total oscillation of the sequence. Every bounded variation sequence is bounded: \( |x_n| \leq |x_1| + V(x) \) for all \( n \), so \( bv \subseteq \ell^\infty \). The space \( bv_0 \) is isometrically isomorphic to \( \ell^1 \) via the difference map \( (x_n) \mapsto (x_1, x_1 - x_2, x_2 - x_3, \ldots) \), and this isomorphism exchanges the \( bv_0 \) norm with the \( \ell^1 \) norm. The dual of \( bv_0 \) is therefore isomorphic to \( \ell^\infty \).

<div class="remark">
<strong>Remark 1.K (Tsirel'son and James Spaces).</strong> For decades after Banach's 1932 monograph, a central open problem asked whether every infinite-dimensional Banach space contains a subspace isomorphic to \( c_0 \) or to \( \ell^p \) for some \( 1 \leq p < \infty \). In 1974, B.S. Tsirel'son answered this in the negative by constructing an infinite-dimensional Banach space \( T \) — the <strong>Tsirel'son space</strong> — containing no isomorphic copy of \( c_0 \) or any \( \ell^p \). The norm on \( T \) is defined implicitly via the Minkowski functional of a convex set \( D \subseteq c_0 \) satisfying certain block-stability conditions; the resulting space is far removed from the classical sequence spaces.

An equally remarkable example is <strong>James' space</strong> \( J \), the subspace of \( c_0 \) of sequences satisfying

\[
\sup_{n_1 < n_2 < \cdots < n_k} \left[(x_{n_1} - x_{n_2})^2 + (x_{n_2} - x_{n_3})^2 + \cdots + (x_{n_{k-1}} - x_{n_k})^2\right]^{1/2} < \infty.
\]
James' space is isometrically isomorphic to its own double dual \( J^{**} \), yet is <em>not reflexive</em> — it sits as a proper closed subspace of codimension one in \( J^{**} \). This answered (negatively) the conjecture that isomorphic identification with the double dual forces reflexivity.

</div>

## Bounded Linear Operators

The morphisms between normed spaces are the bounded linear operators. Theorem 1.26 below clarifies why "bounded" is the correct notion: for linear maps, continuity at any single point is equivalent to global Lipschitz continuity, which in turn is equivalent to the operator norm being finite. This tight equivalence is special to linear maps and fails for general nonlinear maps.

**Remark 1.20.** When \( U \) and \( V \) are normed linear spaces, a linear map \( F : U \to V \) is also called a **linear operator**. When \( V = \mathbb{F} \), it is called a **linear functional**.

**Definition 1.21 (Operator Norm).** Let \( F : U \to V \) be a linear operator. The **operator norm** of \( F \) is

\[
\|F\| = \sup\{ \|Fx\| \mid x \in U, \|x\| \leq 1 \}.
\]
We say \( F \) is **bounded** when \( \|F\| < \infty \). Equivalently,

\[
\|F\| = \sup\{ \|Fx\| \mid x \in U, \|x\| = 1\} = \inf\{ m \geq 0 \mid \|Fx\| \leq m\|x\| \; \forall x \in U\},
\]
and \( \|Fx\| \leq \|F\|\,\|x\| \) for all \( x \in U \). The space of bounded linear operators \( F : U \to V \) is denoted \( B(U,V) \).

**Example 1.22.** When \( U \) and \( V \) are non-trivial finite-dimensional inner product spaces over \( \mathbb{R} \) and \( F : U \to V \) is linear, the maximum of \( \|Fx\| \) over the unit ball is attained and equals \( \sqrt{\lambda} \) where \( \lambda \) is the largest eigenvalue of \( F^* F \).

The operator norm turns the space of bounded operators itself into a normed space, and completeness passes from the target space to the operator space. This is why \( U^* = B(U, \mathbb{F}) \) is always a Banach space regardless of whether \( U \) is complete.

**Theorem 1.23.** Let \( U \) and \( V \) be normed linear spaces.
1. \( B(U,V) \) is a normed linear space under the operator norm.
2. If \( V \) is a Banach space then \( B(U,V) \) is a Banach space.

**Proof.** Part 1 is routine. For Part 2, let \( (F_n) \) be Cauchy in \( B(U,V) \). For each \( x \in U \), since \( \|F_k x - F_\ell x\| \leq \|F_k - F_\ell\|\,\|x\| \), the sequence \( (F_n x) \) is Cauchy in \( V \) and converges; define \( Gx = \lim_{n\to\infty} F_n x \). Then \( G \) is linear. Since \( (F_n) \) is Cauchy hence bounded, say \( \|F_n\| \leq M \), we get \( \|Gx\| = \lim \|F_n x\| \leq M\|x\| \), so \( G \in B(U,V) \). For \( \varepsilon > 0 \) choose \( m \) so that \( k, n \geq m \implies \|F_n - F_k\| < \varepsilon \); then for \( n \geq m \) and all \( x \), \( \|(F_n - G)x\| = \lim_k \|F_n x - F_k x\| \leq \varepsilon \|x\| \), so \( F_n \to G \) in \( B(U,V) \). \( \square \)

**Definition 1.24 (Lipschitz Continuity).** A map \( f : (X, d_X) \to (Y, d_Y) \) is **Lipschitz continuous** with constant \( \ell \geq 0 \) when \( d_Y(f(x), f(y)) \leq \ell \cdot d_X(x,y) \) for all \( x, y \in X \).

**Note 1.25.** Lipschitz continuous maps are uniformly continuous; they send convergent sequences to convergent sequences and Cauchy sequences to Cauchy sequences.

**Theorem 1.26.** For a linear map \( F : U \to V \) between normed linear spaces, the following are equivalent:
1. \( F \) is Lipschitz continuous.
2. \( F \) is continuous at some point \( a \in U \).
3. \( F \) is continuous at \( 0 \).
4. \( F \) is bounded.

In this case, \( \|F\| \) is a Lipschitz constant for \( F \).

**Proof.** (1)\( \implies \)(2)\( \implies \)(3) are immediate. For (3)\( \implies \)(4): if \( F \) is continuous at \( 0 \), choose \( \delta > 0 \) so that \( \|x\| \leq \delta \implies \|Fx\| \leq 1 \); for \( \|x\| = 1 \) we have \( \|F x\| = \frac{1}{\delta}\|F(\delta x)\| \leq \frac{1}{\delta} \), so \( \|F\| \leq \frac{1}{\delta} \). For (4)\( \implies \)(1): \( \|Fx - Fy\| = \|F(x-y)\| \leq \|F\|\,\|x-y\| \). \( \square \)

## Dual Spaces

The dual space \( U^* \) of bounded linear functionals on \( U \) is one of the most important constructions in functional analysis. It is always a Banach space regardless of whether \( U \) itself is complete, because the scalar field \( \mathbb{F} \) is complete. Understanding \( U^* \) concretely — identifying which Banach space it is isomorphic to — is a recurring theme. The Riesz Representation Theorems below do exactly this for \( \ell^p \), \( L^p \), and later for Hilbert spaces.

**Definition 1.27.** The **(continuous) dual space** of a normed linear space \( U \) is

\[
U^* = B(U, \mathbb{F}) = \{ f : U \to \mathbb{F} \mid f \text{ is linear with } \|f\| < \infty \}.
\]
By Theorem 1.23, \( U^* \) is always a Banach space.

### Schauder Bases and the Canonical Embedding

A Schauder basis is the Banach-space analogue of a countable orthonormal basis in a Hilbert space: every element is a unique norm-convergent series expansion. Unlike Hilbert bases (which require an inner product), Schauder bases work in any separable Banach space, though their existence in general is more subtle.

<div class="definition">
<strong>Definition 1.F (Schauder Basis).</strong> A sequence \( \{e_n\}_{n \geq 1} \) in a Banach space \( X \) is a <strong>Schauder basis</strong> if every \( x \in X \) can be uniquely written as a norm-convergent series

\[
x = \sum_{n=1}^\infty x_n e_n, \quad x_n \in \mathbb{K}.
\]
</div>

<div class="example">
<strong>Example 1.G.</strong> The standard unit vectors \( \{e_n\}_{n \geq 1} \) (where \( e_n \) has a \( 1 \) in position \( n \) and \( 0 \) elsewhere) form a Schauder basis for \( c_0 \) and for \( \ell^p \), \( 1 \leq p < \infty \). There also exists a Schauder basis for \( (C[0,1], \mathbb{R}) \) (discovered by Schauder), though its description is considerably more involved.
</div>

<div class="example">
<strong>Example 1.H (Dual of \( c_0 \)).</strong> The space \( c_0^* \) is isometrically isomorphic to \( \ell^1(\mathbb{N}) \) via the map \( \Theta : \ell^1 \to c_0^* \), \( \Theta(z) = \varphi_z \), where \( \varphi_z(x) = \sum_{n \geq 1} x_n z_n \).
</div>

<div class="definition">
<strong>Definition 1.I (Canonical embedding and reflexivity).</strong> Let \( X \) be a normed linear space. For \( z \in X \), define \( \hat{z} : X^* \to \mathbb{K} \) by \( \hat{z}(x^*) = x^*(z) \). The map \( J : X \to X^{**} \), \( J(z) = \hat{z} \), is the <strong>canonical embedding</strong> of \( X \) into its double dual. The map \( J \) is a linear isometry (after the Hahn-Banach Theorem is established). If \( J \) is surjective (an isometric bijection onto \( X^{**} \)), then \( X \) is called <strong>reflexive</strong>.

</div>

Reflexivity is a powerful structural property: reflexive Banach spaces have weakly compact unit balls (by the Banach-Alaoglu Theorem), which enables many compactness arguments. The spaces \( \ell^p \) for \( 1 < p < \infty \) are reflexive; \( \ell^1 \), \( \ell^\infty \), and \( c_0 \) are not.

**Theorem 1.28 (Riesz Representation for \( \ell^p \).** Let \( p, q \in [1,\infty] \) with \( \frac{1}{p} + \frac{1}{q} = 1 \).
1. The map \( F : \ell^q \to (\ell^p)^* \) given by \( F(b)(a) = \sum_{k=1}^\infty a_k b_k \) is well-defined, linear, injective, and norm-preserving.
2. When \( p \neq \infty \), \( F \) is also surjective, so \( (\ell^p)^* \cong \ell^q \).

**Proof sketch.** By Hölder's Inequality, \( |F(b)(a)| \leq \|a\|_p \|b\|_q \), so \( F(b) \) is bounded with \( \|F(b)\| \leq \|b\|_q \). Norm preservation (equality) is shown by testing on suitable extremal sequences. Surjectivity for \( 1 \leq p < \infty \): given \( f \in (\ell^p)^* \), set \( b_k = f(e_k) \) and verify \( b \in \ell^q \) and \( F(b) = f \) by approximation with finite sums. \( \square \)

Theorem 1.28 says that for \( 1 \leq p < \infty \), the dual of \( \ell^p \) is \( \ell^q \) where \( 1/p + 1/q = 1 \): every bounded linear functional on \( \ell^p \) is represented by inner product against a unique element of \( \ell^q \). This is the sequence-space analogue of the \( L^p \) duality in Theorem 1.31. The case \( p = \infty \) is genuinely exceptional.

**Remark 1.29.** When \( p = \infty \) and \( q = 1 \), the proof of surjectivity breaks down because finitely-supported truncations do not converge in \( \ell^\infty \). Indeed, \( F : \ell^1 \to (\ell^\infty)^* \) is not surjective (as shown later via the Hahn-Banach Theorem).

**Theorem 1.31 (Riesz Representation for \( L^p \).** Let \( p, q \in [1,\infty] \) with \( \frac{1}{p} + \frac{1}{q} = 1 \), and let \( A \subseteq \mathbb{R} \) be measurable with \( \lambda(A) > 0 \).
1. The map \( F : L^q(A) \to L^p(A)^* \) given by \( F(g)(f) = \int_A fg \) is well-defined, injective, and norm-preserving.
2. When \( 1 \leq p < \infty \), \( F \) is surjective, so \( L^p(A)^* \cong L^q(A) \).

## Uniform Boundedness

The Baire Category Theorem and its consequence, the Uniform Boundedness Principle, form the first of the three "big theorems" of functional analysis (along with the Open Mapping Theorem and the Hahn-Banach Theorem). The Baire Category Theorem is a purely topological result about complete metric spaces, but its power comes from the way it converts pointwise information — each \( x \) has its own bound — into a uniform statement about the whole family.

**Definition 1.32.** A subset \( A \) of a metric space \( X \) is **nowhere dense** when the interior of its closure is empty, i.e., \( \overline{A}^\circ = \emptyset \). Equivalently, every nonempty open ball contains a nonempty open ball disjoint from \( A \).

**Definition 1.33.** A subset \( A \subseteq X \) is **first category** (or **meagre**) when it is a countable union of nowhere dense sets, and **second category** when it is not first category. A set is **residual** when its complement is first category. Note: \( \mathbb{Q} \) is first category in \( \mathbb{R} \), and \( \mathbb{R} \setminus \mathbb{Q} \) is residual.

**Theorem 1.34 (Baire Category Theorem).** Let \( X \) be a complete metric space.
1. Every first category set in \( X \) has empty interior.
2. Every residual set in \( X \) is dense.
3. Every countable union of closed sets with empty interiors has empty interior.
4. Every countable intersection of dense open sets is dense.

**Proof sketch.** Parts (1) and (2) are equivalent by complementation; (3) and (4) are special cases. For (1): suppose \( A = \bigcup_{n=1}^\infty C_n \) with each \( C_n \) nowhere dense, and assume \( A \) has nonempty interior. Choose an open ball \( B_0 \) inside \( A \), then inductively choose a nested sequence of open balls \( B_n \) with \( \operatorname{diam}(B_n) \to 0 \), \( \overline{B_n} \subseteq B_{n-1} \), and \( \overline{B_n} \cap C_n = \emptyset \). By completeness, the centres of \( B_n \) converge to some \( a \in B_0 \subseteq A \), yet \( a \notin C_n \) for all \( n \), contradicting \( a \in A \). \( \square \)

**Definition 1.37 (\( \sigma \)-algebra).** A **\( \sigma \)-algebra** in a set \( X \) is a collection \( \mathcal{C} \) of subsets of \( X \) such that: \( \emptyset \in \mathcal{C} \); if \( A \in \mathcal{C} \) then \( A^c \in \mathcal{C} \); and if \( A_1, A_2, \ldots \in \mathcal{C} \) then \( \bigcup_{k=1}^\infty A_k \in \mathcal{C} \).

The Baire Category Theorem says, informally, that a complete metric space cannot be "thin" in countably many directions simultaneously. A first-category set — a countable union of nowhere dense pieces — must have empty interior. This is the engine behind the Uniform Boundedness Principle.

**Theorem 1.40 (Banach-Steinhaus / Uniform Boundedness Principle).** Let \( X \) be a Banach space, \( Y \) a normed linear space, and \( S \) a set of bounded linear maps \( L : X \to Y \). Suppose that for every \( x \in X \) there exists \( m_x \geq 0 \) such that \( \|Lx\| \leq m_x \) for all \( L \in S \). Then there exists \( m \geq 0 \) such that \( \|L\| \leq m \) for all \( L \in S \).

**Proof.** For each \( n \in \mathbb{Z}^+ \), let \( A_n = \{ x \in X \mid \|Lx\| \leq n \; \forall L \in S\} \). Each \( A_n \) is closed, and by hypothesis \( X = \bigcup_{n=1}^\infty A_n \). By the Baire Category Theorem, some \( A_n \) is not nowhere dense, so contains an open ball \( B(a,r) \). For \( \|x\| < r \), we have \( x + a \in B(a,r) \subseteq A_n \), so \( \|L(x)\| \leq \|L(x+a)\| + \|L(a)\| \leq 2n \). Scaling gives \( \|L\| \leq \frac{2n}{r} \) for all \( L \in S \). \( \square \)

The Uniform Boundedness Principle is remarkably useful: to show a sequence of operators is uniformly norm-bounded, it suffices to check pointwise boundedness. This often turns a hard uniform estimate into a sequence of easier pointwise ones. The Condensation of Singularities below is a striking corollary showing that "pathological" pointwise behavior is in fact generic.

**Theorem 1.41 (Condensation of Singularities).** Let \( X \) be a Banach space, \( Y \) a normed space, and \( L_{m,n} : X \to Y \) bounded linear for \( m, n \in \mathbb{Z}^+ \). Suppose that for each \( m \) there exists \( x_m \in X \) with \( \limsup_{n\to\infty} \|L_{m,n}(x_m)\| = \infty \). Then the set

\[
E = \left\{ x \in X \;\Big|\; \limsup_{n\to\infty} \|L_{m,n}(x)\| = \infty \; \forall m \in \mathbb{Z}^+ \right\}
\]
is a dense \( G_\delta \) set (hence residual and, by the Baire Category Theorem, dense in \( X \).

**Proof sketch.** Fix \( m \). The sets \( A_\ell = \{ x \mid \|L_{m,n}(x)\| \leq \ell \; \forall n\} \) are closed. If one were not nowhere dense, the Uniform Boundedness Principle would give a bound on \( \|L_{m,n}\| \), contradicting the hypothesis. So all \( A_\ell \) are nowhere dense, making \( B_m = \bigcup_\ell A_\ell \) first category. Then \( E = X \setminus \bigcup_m B_m \) is a countable intersection of dense open sets, hence dense by Baire. \( \square \)

---

# Chapter 2: Hilbert Spaces

Hilbert spaces are the geometric heart of functional analysis. The presence of an inner product means we have a notion of angle and orthogonality, which enables orthogonal decompositions, projection onto subspaces, and ultimately a spectral theory for self-adjoint operators. This chapter develops the theory from the algebraic notion of a Hamel basis through the analytic notion of a Hilbert (orthonormal) basis, and culminates in the Spectral Theorem for compact self-adjoint operators.

## Review of Inner Product Spaces

**Definition 2.1 (Hamel Basis).** A **(Hamel) basis** for a vector space \( V \) over any field \( \mathbb{F} \) is a maximal linearly independent set, or equivalently a linearly independent spanning set. Any two Hamel bases for \( V \) have the same cardinality, which defines the **(Hamel) dimension** \( \dim(V) \).

**Definition 2.2 (Orthogonal and Orthonormal Sets).** Let \( V \) be an inner product space. A subset \( B \subseteq V \) is **orthogonal** when \( \langle u, v \rangle = 0 \) for all distinct \( u, v \in B \), and **orthonormal** when it is orthogonal and every element has norm 1.

**Theorem 2.3.** Let \( V \) be an inner product space with orthonormal set \( B \). Let \( x = \sum_{k=1}^n a_k u_k \) and \( y = \sum_{k=1}^n b_k u_k \) with \( u_k \in B \). Then

\[
\langle x, u_k \rangle = a_k, \quad \langle x, y \rangle = \sum_{k=1}^n a_k \overline{b_k}, \quad \|x\|^2 = \sum_{k=1}^n |a_k|^2.
\]
In particular, \( B \) is linearly independent. **Proof omitted.**

**Theorem 2.4 (Gram-Schmidt Procedure).** Let \( V \) be an inner product space of finite or countable Hamel dimension with ordered Hamel basis \( A = (u_1, u_2, u_3, \ldots) \). Define \( v_1 = u_1 \) and for \( n \geq 2 \),

\[
v_n = u_n - \sum_{k=1}^{n-1} \frac{\langle u_n, v_k \rangle}{\|v_k\|^2} v_k.
\]
Then \( B = (v_1, v_2, v_3, \ldots) \) is an orthogonal Hamel basis with \( \operatorname{Span}\{v_1, \ldots, v_n\} = \operatorname{Span}\{u_1, \ldots, u_n\} \) for every \( n \). **Proof omitted.**

**Corollary 2.5.** Every inner product space of finite or countable Hamel dimension has an orthonormal Hamel basis.

**Corollary 2.6.** If \( V \) has finite or countable Hamel dimension and \( U \subseteq V \) is a finite-dimensional subspace, then any orthonormal basis for \( U \) extends to an orthonormal basis for \( V \).

**Corollary 2.7.** Inner product spaces of finite or countable Hamel dimension are isomorphic (as inner product spaces) iff they have the same Hamel dimension. In particular, \( \dim(U) = n \) implies \( U \cong \mathbb{F}^n \), and \( \dim(U) = \aleph_0 \) implies \( U \cong \mathbb{F}^\infty \).

**Corollary 2.8.** Every finite-dimensional inner product space is complete. Every inner product space of countable Hamel dimension is **not** complete.

Corollary 2.8 is the first indication that infinite-dimensional Hilbert spaces must have uncountable Hamel dimension. The algebraic Hamel basis is therefore the wrong tool for infinite-dimensional spaces — it exists by Zorn's Lemma but is uncountably large and practically unwieldy. The correct replacement is the Hilbert basis (orthonormal basis), developed in Section 2.4.

With orthonormality established, we introduce the direct sum decomposition and orthogonal complement that will be central to projection theory.

**Definition 2.9 (Direct Sum).** For subspaces \( U, V \subseteq W \), write \( W = U \oplus V \) when \( W = U + V \) and \( U \cap V = \{0\} \), so every \( x \in W \) has a unique decomposition \( x = u + v \).

**Definition 2.10 (Orthogonal Complement).** For a subspace \( U \) of an inner product space \( V \), the **orthogonal complement** is

\[
U^\perp = \{ x \in V \mid \langle x, u \rangle = 0 \; \forall u \in U \}.
\]

The orthogonal complement \( U^\perp \) always has the nice properties listed in Theorem 2.11, but the decomposition \( V = U \oplus U^\perp \) and the identity \( (U^\perp)^\perp = U \) require finite-dimensionality at the algebraic level. In Hilbert spaces, closedness is the correct replacement for finite-dimensionality, as Theorem 2.20 makes precise.

**Theorem 2.11.** Let \( V \) be an inner product space and \( U \subseteq V \) a subspace. Then:
1. \( U^\perp \) is a subspace.
2. \( U^\perp = \{ x \mid \langle x, u \rangle = 0 \; \forall u \in B\} \) for any basis \( B \) of \( U \).
3. \( U \cap U^\perp = \{0\} \).
4. \( U \subseteq (U^\perp)^\perp \).

When \( U \) is finite-dimensional: additionally \( U \oplus U^\perp = V \) and \( (U^\perp)^\perp = U \). **Proof omitted.**

**Definition 2.12 (Orthogonal Projection).** When \( V = U \oplus U^\perp \), the **orthogonal projection** onto \( U \) is the map \( \operatorname{Proj}_U : V \to U \) sending \( x = u + v \) (with \( u \in U, v \in U^\perp \) to \( \operatorname{Proj}_U(x) = u \).

**Theorem 2.13.** Under the conditions of Definition 2.12, \( \operatorname{Proj}_U(x) \) is the unique point in \( U \) nearest to \( x \). **Proof omitted.**

**Example 2.14.** Let \( U \) be finite-dimensional with orthogonal basis \( \{u_1, \ldots, u_n\} \). Then

\[
\operatorname{Proj}_U(x) = \sum_{k=1}^n \frac{\langle x, u_k \rangle}{\|u_k\|^2} u_k.
\]

**Note 2.16.** If \( U \subseteq W \) is a subspace, its closure \( \overline{U} \) is also a subspace. Moreover \( \overline{U}^\perp = U^\perp \). This follows because if \( v \in U^\perp \) and \( u \in \overline{U} \) with \( x_n \to u \) in \( U \), then \( \langle v, u \rangle = \lim_n \langle v, x_n \rangle = 0 \).

## Closed Subspaces of Hilbert Spaces and Orthogonal Projections

The orthogonal complement and direct sum decomposition from the previous section worked perfectly for finite-dimensional subspaces. In infinite dimensions, completeness — specifically, whether the subspace is closed — is what saves us. The following example shows concretely that without completeness, the decomposition \( V = U \oplus U^\perp \) can fail.

**Example 2.17.** Infinite-dimensional subspaces can behave differently from finite-dimensional ones. Let \( V = \mathbb{F}^\infty \) (finitely-supported sequences) with the standard inner product, and \( U = \{ a \in \mathbb{F}^\infty \mid \sum_k a_k = 0 \} \). One computes \( U^\perp = \{0\} \), so \( (U^\perp)^\perp = V \neq U \) and \( V \neq U \oplus U^\perp \). The issue is that \( V \) (having countable Hamel dimension) is not complete.

**Definition 2.18 (Convex Set).** A subset \( S \subseteq V \) is **convex** when for all \( a, b \in S \) and \( 0 \leq t \leq 1 \), \( a + t(b-a) \in S \).

The key tool for extending the finite-dimensional theory to Hilbert spaces is the Best Approximation Theorem. It asserts that a closed convex set always contains a unique nearest point to any given element. The proof is a beautiful application of the Parallelogram Law: convexity forces the midpoints of approximating sequences into the set, and the Parallelogram Law forces those midpoints to converge.

**Theorem 2.19 (Best Approximation in Hilbert Spaces).** Let \( H \) be a Hilbert space and \( S \subseteq H \) nonempty, closed, and convex. Then for every \( a \in H \) there exists a **unique** point \( b \in S \) nearest to \( a \).

The proof is a clean application of the Parallelogram Law: convexity forces the midpoints of a minimizing sequence back into \( S \), and the Parallelogram Law forces the distances between terms to zero, making the sequence Cauchy.

**Proof.** Let \( d = \operatorname{dist}(a, S) \). Choose \( x_n \in S \) with \( \|x_n - a\|^2 \to d^2 \). By the Parallelogram Law and convexity (\( \frac{x_k+x_\ell}{2} \in S \) so \( \|\frac{x_k+x_\ell}{2} - a\| \geq d \),

\[
\|x_k - x_\ell\|^2 = 2\|x_k-a\|^2 + 2\|x_\ell-a\|^2 - 4\Big\|\tfrac{x_k+x_\ell}{2}-a\Big\|^2 \leq 2\|x_k-a\|^2 + 2\|x_\ell-a\|^2 - 4d^2 \to 0,
\]
so \( (x_n) \) is Cauchy, converging to some \( b \in S \) (since \( S \) is closed and \( H \) is complete). Then \( \|b-a\| = \lim \|x_n-a\| = d \). Uniqueness follows similarly from the Parallelogram Law. \( \square \)

Theorem 2.20 is the cornerstone result of Hilbert space geometry: a subspace is closed if and only if it admits an orthogonal complement decomposition. In particular, every closed subspace of a Hilbert space has a well-defined orthogonal projection, and the projection is the nearest-point map.

**Theorem 2.20 (Characterization of Closed Subspaces).** Let \( H \) be a Hilbert space and \( U \subseteq H \) a subspace. Then \( U \) is closed if and only if \( H = U \oplus U^\perp \). In this case, \( U^\perp \) is closed, \( (U^\perp)^\perp = U \), and for \( x = u + v \) with \( u \in U, v \in U^\perp \), \( u \) is the unique point in \( U \) nearest \( x \).

**Proof sketch.** (\( \Leftarrow \) If \( H = U \oplus U^\perp \) and \( x_n \in U \) with \( x_n \to a \), write \( a = u + v \); then \( \|v\|^2 = \langle a, v \rangle = \lim \langle x_n, v \rangle = 0 \), so \( a = u \in U \). (\( \Rightarrow \) If \( U \) is closed, apply Theorem 2.19: for each \( x \in H \), the nearest point \( u \in U \) gives \( v = x - u \in U^\perp \) (verified by a variational argument). Uniqueness follows by the same Parallelogram Law argument. \( \square \)

**Definition 2.21.** When \( U \) is a closed subspace of a Hilbert space \( H \), the **orthogonal projection** onto \( U \) is the map \( P : H \to U \) given by \( Px = u \) where \( x = u + v \), \( u \in U \), \( v \in U^\perp \).

Now that we can project onto closed subspaces, we are ready to develop the formulas for Hilbert bases, which require summing over potentially uncountable index sets.

## Unordered Series

The classical theory of sequences and series extends naturally to uncountable index sets, which is essential for working with general Hilbert bases.

Absolute convergence implies unconditional convergence in finite-dimensional spaces, but the converse fails in general infinite-dimensional Banach spaces (though they coincide in Hilbert spaces, as the orthonormality makes rearrangements transparent). These distinctions become important when we ask whether a Fourier expansion \( \sum_k \langle x, u_k \rangle u_k \) converges in the unordered sense over an uncountable index set.

**Definition 2.22.** A series \( \sum_{k=1}^\infty a_k \) in a normed space \( V \) **converges absolutely** when \( \sum_{k=1}^\infty \|a_k\| < \infty \), and **converges unconditionally** when every rearrangement converges.

**Definition 2.24 (Unordered Series).** Let \( K \) be a nonempty (possibly uncountable) index set and \( (a_k)_{k \in K} \) an indexed set in a normed space \( X \). The **unordered series** \( \sum_{k \in K} a_k \) **converges** to \( s \in X \) when

\[
\forall \varepsilon > 0 \; \exists F \in \operatorname{Fin}(K) \; \forall I \in \operatorname{Fin}(K) \; I \supseteq F \implies \|s_I - s\| < \varepsilon,
\]
where \( s_I = \sum_{k \in I} a_k \) for finite \( I \). It **converges absolutely** when \( \sum_{k \in K} \|a_k\| < \infty \).

Theorem 2.26 is reassuring: even though our Hilbert basis may be uncountable, Bessel's Inequality (Theorem 2.32) will force all but countably many Fourier coefficients to be zero. So in practice, the Fourier expansion is always a countable sum.

**Theorem 2.26.** If \( (a_k)_{k \in K} \) with each \( a_k \geq 0 \) has \( \sum_{k \in K} a_k < \infty \), then at most countably many \( a_k \) are nonzero.

**Proof.** For each \( n \), let \( K_n = \{ k \mid a_k \geq \frac{1}{n} \} \). If any \( K_n \) were infinite, the sum would be infinite. Thus every \( K_n \) is finite, and \( \{ k \mid a_k > 0 \} = \bigcup_n K_n \) is at most countable. \( \square \)

**Theorem 2.28 (Cauchy Criterion).** Let \( (a_k)_{k \in K} \) be an indexed set in a normed space \( X \).
1. If \( \sum_{k \in K} a_k \) converges, it is Cauchy.
2. If \( X \) is complete and the series is Cauchy, it converges.

## Formulas Involving Orthonormal Indexed Sets

**Definition 2.29.** An indexed set \( (u_k)_{k \in K} \) in an inner product space is **orthonormal** when \( \|u_k\| = 1 \) for all \( k \) and \( \langle u_k, u_\ell \rangle = 0 \) for \( k \neq \ell \).

**Theorem 2.30.** Let \( H \) be a Hilbert space, \( (u_k)_{k \in K} \) orthonormal, \( B = \{u_k\} \), and \( x, y \in \overline{\operatorname{Span}\, B} \). Let \( a_k = \langle x, u_k \rangle \), \( b_k = \langle y, u_k \rangle \). Then:

\[
(1)\; \sum_{k \in K} a_k u_k = x, \qquad (2)\; \sum_{k \in K} |a_k|^2 = \|x\|^2, \qquad (3)\; \sum_{k \in K} a_k \overline{b_k} = \langle x, y \rangle.
\]

**Theorem 2.31.** Let \( (u_k)_{k \in K} \) be orthonormal in a Hilbert space \( H \) and let \( (c_k)_{k \in K} \) be scalars.
1. If \( \sum_{k \in K} c_k u_k \) converges to \( x \), then \( x \in \overline{\operatorname{Span}\, B} \) and \( c_k = \langle x, u_k \rangle \).
2. \( \sum_{k \in K} c_k u_k \) converges in \( H \) if and only if \( \sum_{k \in K} |c_k|^2 < \infty \).

Bessel's Inequality is the key estimate that makes the Hilbert basis theory work: even before knowing that \( B \) spans \( H \), we know the Fourier coefficients are square-summable. The inequality becomes an equality — Parseval's identity — precisely when \( B \) is a Hilbert basis.

**Theorem 2.32 (Bessel's Inequality).** Let \( (u_k)_{k \in K} \) be orthonormal in an inner product space \( V \). For all \( x \in V \),

\[
\sum_{k \in K} |\langle x, u_k \rangle|^2 \leq \|x\|^2.
\]

**Proof.** For any finite \( F \subseteq K \) and \( w_F = \sum_{k \in F} \langle x, u_k \rangle u_k \),

\[
0 \leq \|x - w_F\|^2 = \|x\|^2 - \sum_{k \in F} |\langle x, u_k \rangle|^2.
\]
Taking the supremum over all finite \( F \) gives the inequality. \( \square \)

**Theorem 2.33 (Orthogonal Projection Formula).** Let \( H \) be a Hilbert space, \( (u_k)_{k \in K} \) orthonormal, \( B = \{u_k\} \), \( U = \overline{\operatorname{Span}\, B} \). The orthogonal projection \( P : H \to U \) is given by

\[
Px = \sum_{k \in K} \langle x, u_k \rangle u_k,
\]
and \( \|P\| = 1 \).

**Proof.** By Bessel's Inequality, \( \sum_k |\langle x, u_k \rangle|^2 \leq \|x\|^2 < \infty \), so by Theorem 2.31(2) the sum converges, and by Theorem 2.31(1) it lies in \( U \). For any \( u_k \), \( \langle Px - x, u_k \rangle = \langle x, u_k \rangle - \langle x, u_k \rangle = 0 \), so \( x - Px \in U^\perp \). Thus \( P \) is the orthogonal projection. Since \( \|Px\|^2 = \sum_k |\langle x, u_k \rangle|^2 \leq \|x\|^2 \), we have \( \|P\| \leq 1 \); and \( P(u_k) = u_k \) gives \( \|P\| \geq 1 \). \( \square \)

## Hilbert Bases

We now arrive at one of the central structural results: every Hilbert space has an orthonormal basis (Hilbert basis), and any two Hilbert bases have the same cardinality. Unlike algebraic Hamel bases, a Hilbert basis \( B \) need not span \( H \) algebraically — instead, every element is a (potentially infinite) convergent sum of basis vectors, which is why we need the closed span. The Fourier expansion and Parseval's identity that follow are the infinite-dimensional analogues of the familiar coordinate formulas in \( \mathbb{R}^n \).

**Theorem 2.34.** Let \( H \) be a Hilbert space and \( B \) an orthonormal set. Then \( B \) is a **maximal orthonormal set** if and only if \( \overline{\operatorname{Span}\, B} = H \).

**Proof.** If \( B \) is not maximal, we can add a unit vector \( v \) orthogonal to all of \( B \), and then \( v \notin \overline{\operatorname{Span}\, B} \). Conversely, if \( \overline{\operatorname{Span}\, B} \neq H \), then \( (\overline{\operatorname{Span}\, B})^\perp \neq \{0\} \) and we can add a unit vector, so \( B \) is not maximal. \( \square \)

**Theorem 2.35.**
1. Every inner product space contains a maximal orthonormal set (by Zorn's Lemma).
2. In a Hilbert space, any two maximal orthonormal sets have the same cardinality.

**Proof of (2) sketch.** Let \( B = \{u_k\}_{k \in K} \) and \( C = \{v_\ell\}_{\ell \in L} \) be maximal. For each \( k \in K \), let \( L_k = \{\ell \in L \mid \langle u_k, v_\ell \rangle \neq 0\} \); Bessel's Inequality gives \( |L_k| \leq \aleph_0 \). Since \( C \) is maximal (hence \( \overline{\operatorname{Span}\, C} = H \), for each \( \ell \in L \) there exists \( k \) with \( \langle u_k, v_\ell \rangle \neq 0 \), so \( L = \bigcup_{k \in K} L_k \). Cardinal arithmetic gives \( |L| \leq |K| \cdot \aleph_0 = |K| \). Symmetry gives \( |K| \leq |L| \). \( \square \)

**Definition 2.36.** A **Hilbert basis** (or **orthonormal basis**) for a Hilbert space \( H \) is a maximal orthonormal set. The **(Hilbert) dimension** \( \dim H \) is the cardinality of any Hilbert basis.

**Theorem 2.37.** Let \( H \) be a Hilbert space with orthonormal indexed set \( (u_k)_{k \in K} \) and \( B = \{u_k\} \). The following are equivalent:
1. \( B \) is a Hilbert basis.
2. For every \( x \in H \): \( x = \sum_{k \in K} \langle x, u_k \rangle u_k \) (**Fourier expansion**).
3. For every \( x \in H \): \( \|x\|^2 = \sum_{k \in K} |\langle x, u_k \rangle|^2 \) (**Parseval's identity**).
4. For every \( x, y \in H \): \( \langle x, y \rangle = \sum_{k \in K} \langle x, u_k \rangle \overline{\langle y, u_k \rangle} \).

**Theorem 2.38.** A Hilbert space \( H \) is separable if and only if its Hilbert basis is at most countable.

Theorem 2.38 is the bridge between the algebraic notion of Hilbert dimension and the analytic notion of separability. Since \( L^2[a,b] \) is separable (the polynomials are dense, by Weierstrass), it has a countable Hilbert basis — for instance, the trigonometric system \( \{e^{2\pi i n x}\} \). The isomorphism \( L^2[a,b] \cong \ell^2 \) is then just the Fourier transform repackaged as a unitary isomorphism of Hilbert spaces.

Parseval's identity says that the map \( x \mapsto (\langle x, u_k \rangle)_{k \in K} \) is an isometric isomorphism from \( H \) to \( \ell^2(K) \). This is the precise sense in which every Hilbert space "looks like" \( \ell^2 \) once you choose a basis — the Hilbert dimension \( |K| \) completely classifies the space up to isomorphism.

**Example 2.39-2.40 (\( \ell^2(K) \).** For any nonempty set \( K \), define \( \ell^2(K, \mathbb{F}) = \{ (c_k)_{k \in K} \mid \sum_{k \in K} |c_k|^2 < \infty \} \) with inner product \( \langle a, b \rangle = \sum_{k \in K} a_k \overline{b_k} \). The standard basis vectors \( (e_\ell)_{\ell \in K} \) form a Hilbert basis. Any Hilbert space over \( \mathbb{F} \) with \( \dim H = |K| \) is isomorphic to \( \ell^2(K, \mathbb{F}) \). In particular, every separable Hilbert space is isomorphic to \( \ell^2 \); for example, \( L^2[a,b] \cong \ell^2 \).

## The Dual Space and the Adjoint Map

Now that we understand the structure of Hilbert spaces through their orthonormal bases, we turn to their dual spaces. The Riesz Representation Theorem is one of the most elegant results in Hilbert space theory: every bounded linear functional is given by an inner product against a unique element of the space. This means \( H \) and \( H^* \) are essentially the same space — a feature that is special to Hilbert spaces and does not hold for general Banach spaces.

**Theorem 2.41 (Riesz Representation Theorem for Hilbert Spaces).** Let \( H \) be a Hilbert space over \( \mathbb{F} \). The map \( \varphi : H \to H^* \) given by \( \varphi(u)(x) = \langle x, u \rangle \) is a bijective norm-preserving map that is linear when \( \mathbb{F} = \mathbb{R} \) and conjugate-linear when \( \mathbb{F} = \mathbb{C} \).

**Proof.** For \( u \in H \), write \( \varphi_u = \varphi(u) \). Then \( \varphi_u(u) = \|u\|^2 \) gives \( \|\varphi_u\| \geq \|u\| \), and Cauchy-Schwarz gives \( |\varphi_u(x)| \leq \|x\|\,\|u\| \) so \( \|\varphi_u\| \leq \|u\| \). Hence \( \varphi \) is norm-preserving (thus injective). For surjectivity: let \( f \in H^* \), \( f \neq 0 \). Then \( U = \ker(f) \) is a closed proper subspace of \( H \), so \( U^\perp \neq \{0\} \). Choose \( v \in U^\perp \) with \( \|v\| = 1 \) and set \( u = \overline{f(v)} v \); then \( \varphi_u = f \). \( \square \)

**Definition 2.42.** Using the bijection \( \varphi \) of Theorem 2.41, we define an inner product on \( H^* \) by \( \langle f, g \rangle_{H^*} = \langle \varphi^{-1}(g), \varphi^{-1}(f) \rangle_H \) (note the reversal for conjugate-linearity).

Using the Riesz Representation Theorem, every bounded operator \( F : H \to K \) has a unique adjoint \( F^* : K \to H \). The adjoint plays the role that the transpose plays for matrices, and the self-adjoint operators — those with \( F^* = F \) — are the operator-theoretic analogues of symmetric matrices. Their spectral theory is the subject of the chapter's final section.

**Definition 2.43 (Adjoint).** When \( H \) and \( K \) are Hilbert spaces and \( F \in B(H,K) \), the **(Hilbert space) adjoint** of \( F \) is the unique map \( F^* : K \to H \) satisfying

\[
\langle Fx, y \rangle = \langle x, F^* y \rangle \quad \forall x \in H, y \in K.
\]
We have \( \|F^*\| = \|F\| \).

## Weak Convergence

Strong (norm) convergence is often too much to ask for in infinite-dimensional spaces. Weak convergence — convergence when tested against each bounded functional — is the natural substitute and is well-suited to compactness arguments. The key fact (Theorem 2.47) is that bounded sequences in Hilbert spaces always have weakly convergent subsequences, a property that will later be used to extract eigenvalues of compact operators.

**Definition 2.45.** Let \( V \) be an inner product space and \( (u_n) \) a sequence in \( V \). We say \( u_n \to w \) **weakly** when \( \langle u_n, x \rangle \to \langle w, x \rangle \) for all \( x \in V \).

**Note 2.46.** Strong convergence (\( \|u_n - w\| \to 0 \) implies weak convergence, but not conversely. For example, any orthonormal sequence \( (u_n) \) in a Hilbert space converges weakly to \( 0 \) (by Parseval's identity) but does not converge strongly.

**Theorem 2.47.** Every bounded sequence in a Hilbert space has a weakly convergent subsequence.

This result is the Hilbert space analogue of the Bolzano-Weierstrass Theorem: bounded sequences have convergent subsequences, but now "convergent" means weakly convergent. The proof uses a diagonal argument on a countable dense set to extract the subsequence, and the Riesz Representation Theorem to identify the weak limit. This kind of compactness in the weak topology is essential for variational problems and spectral theory.

**Proof sketch.** When \( H \) is separable with dense set \( \{a_1, a_2, \ldots\} \): given a bounded sequence \( (u_n) \), use a diagonal subsequence argument to extract a subsequence \( (v_k) \) such that \( \langle v_k, a_m \rangle \) converges for every \( m \). The functional \( f(x) = \lim_k \langle v_k, x \rangle \) is bounded; by the Riesz Representation Theorem there exists \( w \in H \) with \( f(x) = \langle x, w \rangle \), and \( v_k \to w \) weakly. For non-separable \( H \), the sequence lies in a separable subspace, and the result reduces to the separable case. \( \square \)

## The Spectral Theorem for Compact Self-Adjoint Operators

The Spectral Theorem is the capstone of the Hilbert space chapter. It says that a compact self-adjoint operator on a Hilbert space can be diagonalized in an orthonormal basis of eigenvectors — exactly as a symmetric matrix over \( \mathbb{R}^n \) can be diagonalized. The two key hypotheses do different work: self-adjointness forces all eigenvalues to be real and eigenspaces for distinct eigenvalues to be orthogonal, while compactness ensures there are only countably many eigenvalues and that they accumulate only at zero.

**Definition 2.48.** A **compact operator** on a Hilbert space \( H \) is a linear map \( F : H \to H \) that sends weakly convergent sequences to (strongly) convergent sequences: \( u_n \to w \) weakly \( \implies Fu_n \to Fw \) in norm.

Compactness of an operator is a strong condition that forces it to map bounded sets to "small" sets — sets whose closure is compact. The relationship between compact and continuous operators is analogous to the relationship between relatively compact and bounded sets in finite-dimensional spaces.

**Note 2.49.** Every compact operator is continuous (since strong convergence implies weak convergence), but not conversely. The identity on an infinite-dimensional Hilbert space is continuous but not compact, since any orthonormal sequence converges weakly to \( 0 \) but not in norm.

**Definition 2.50.** A **self-adjoint operator** on \( H \) is a continuous \( F : H \to H \) with \( F^* = F \), i.e., \( \langle Fx, y \rangle = \langle x, Fy \rangle \) for all \( x, y \in H \).

**Theorem 2.51.** Let \( F \) be a continuous self-adjoint operator on \( H \). Then:
1. \( \langle Fu, u \rangle \in \mathbb{R} \) for all \( u \). In particular, all eigenvalues of \( F \) are real.
2. \( \|F\| = \sup\{ |\langle Fu, u \rangle| \mid \|u\| = 1 \} \). Every eigenvalue satisfies \( |\lambda| \leq \|F\| \).

**Proof of (1).** \( \langle Fu, u \rangle = \langle u, F^*u \rangle = \langle u, Fu \rangle = \overline{\langle Fu, u \rangle} \). For (2): let \( M = \sup\{\langle Fu, u \rangle \mid \|u\| = 1\} \). Cauchy-Schwarz gives \( M \leq \|F\| \). For the reverse, use a polarization-type identity valid when \( \langle Fu, v \rangle \in \mathbb{R} \):

\[
\langle Fu, v \rangle = \tfrac{1}{4}(\langle F(u+v), u+v \rangle - \langle F(u-v), u-v \rangle) \leq \tfrac{M}{2}(\|u\|^2 + \|v\|^2),
\]
so choosing \( v = Fu/\|Fu\| \) (when \( Fu \neq 0 \) gives \( \|Fu\| \leq M \). \( \square \)

The multiplication operator in Example 2.52 is a good reminder that not every self-adjoint operator has eigenvalues. On \( L^2[0,1] \), multiplying by \( x \) has "continuous spectrum" — points near which the operator behaves like a very small multiple of the identity, but with no actual eigenvectors. This is why the Spectral Theorem below requires the compactness hypothesis in addition to self-adjointness.

**Example 2.52.** The multiplication operator \( F : L^2[0,1] \to L^2[0,1] \), \( F(f)(x) = xf(x) \), is self-adjoint and continuous with no eigenvalues.

**Theorem 2.53.** Let \( F \) be a compact self-adjoint operator on a Hilbert space \( H \) with \( F \neq 0 \). Then \( F \) has an eigenvalue \( \lambda \) with \( |\lambda| = \|F\| \).

**Proof.** By Theorem 2.51, either \( \|F\| = \sup\{\langle Fu, u \rangle \mid \|u\|=1\} \) or its negative is the infimum. WLOG suppose the former; choose \( (u_n) \) with \( \|u_n\| = 1 \) and \( \langle Fu_n, u_n \rangle \to \lambda = \|F\| \). Then

\[
\|Fu_n - \lambda u_n\|^2 = \|Fu_n\|^2 - 2\lambda\langle Fu_n, u_n \rangle + \lambda^2 \leq \|F\|^2 - 2\lambda\langle Fu_n, u_n \rangle + \lambda^2 \to 0.
\]
Since \( F \) is compact and \( (u_n) \) is bounded, a subsequence \( (v_k) \) gives \( Fv_k \to Fw \) weakly. Then \( \lambda v_k \to Fw \) in norm. Applying \( F \): \( F(Fw) = \lambda Fw \), so \( \lambda \) is an eigenvalue with eigenvector \( Fw \). \( \square \)

Before stating the full Spectral Theorem, we collect the auxiliary facts about eigenspaces of compact self-adjoint operators. These properties — orthogonality of distinct eigenspaces, finite-dimensionality of nonzero eigenspaces, and the projection formula — are the ingredients that make the diagonalization precise.

**Note 2.54 (Useful Properties for the Spectral Theorem).**
1. For continuous \( F \), the eigenspace \( E_\lambda = \ker(F - \lambda I) \) is closed.
2. For self-adjoint \( F \), eigenspaces for distinct eigenvalues are orthogonal.
3. If \( U \subseteq H \) is a closed subspace, the orthogonal projection \( P \) onto \( U \) is self-adjoint and (when \( U \) is finite-dimensional) compact.
4. If \( \lambda \) is a nonzero eigenvalue of a self-adjoint \( F \) with projection \( P \) onto \( E_\lambda \), then \( \lambda P = FP = PF \).
5. For compact \( F \), any eigenspace \( E_\lambda \) for \( \lambda \neq 0 \) is finite-dimensional (else choose an orthonormal sequence \( (e_n) \subset E_\lambda \); then \( e_n \to 0 \) weakly but \( Fe_n = \lambda e_n \not\to 0 \), contradicting compactness).

Theorem 2.53 is the crucial existence step: a nonzero compact self-adjoint operator always has an eigenvalue of largest absolute value. The proof uses the variational formula \( \|F\| = \sup\{|\langle Fu, u \rangle| \mid \|u\|=1\} \) from Theorem 2.51, extracts a maximizing sequence, and uses compactness to pass to a convergent subsequence. Once one eigenvalue is found, the process can be iterated on the orthogonal complement of its eigenspace.

**Theorem 2.55 (Spectral Theorem for Compact Self-Adjoint Operators).** Let \( H \) be a Hilbert space and \( F : H \to H \) a nonzero compact self-adjoint operator. Then:
- The set of nonzero eigenvalues is at most countable.
- Each nonzero eigenspace \( E_{\lambda_k} \) is finite-dimensional.
- If there are finitely many nonzero eigenvalues \( \lambda_1, \ldots, \lambda_n \):

\[
F = \sum_{k=1}^n \lambda_k P_{\lambda_k},
\]
where \( P_{\lambda_k} \) is the orthogonal projection onto \( E_{\lambda_k} \).
- If there are countably many eigenvalues, they can be arranged as \( \lambda_1, \lambda_2, \ldots \) in nonincreasing order of absolute value, with \( \lambda_n \to 0 \), and

\[
F = \sum_{k=1}^\infty \lambda_k P_{\lambda_k}
\]
in the operator norm topology.

The Spectral Theorem says that a compact self-adjoint operator is completely determined by its eigenvalues and the projections onto eigenspaces — the rest of the space (the null space \( \ker F \)) contributes nothing to the action of \( F \). The series \( \sum_k \lambda_k P_{\lambda_k} \) converges in operator norm because \( |\lambda_n| \to 0 \), so the tail of the partial sums has small operator norm.

**Proof sketch.** Non-compactness of infinite-dimensional eigenspaces follows from Note 2.54(5). Using Theorem 2.53 iteratively, one extracts eigenvalues \( \lambda_1, \lambda_2, \ldots \) with \( |\lambda_k| = \|F_k\| \) where \( F_{k+1} = F_k - \lambda_k P_{\lambda_k} \). The eigenvalues are in nonincreasing order. If the process is infinite: suppose \( |\lambda_n| \to r > 0 \); picking unit eigenvectors \( u_n \in E_{\lambda_n} \) (which are mutually orthogonal) yields \( \|Fu_{n_k} - Fu_{n_\ell}\|^2 = \lambda_{n_k}^2 + \lambda_{n_\ell}^2 \geq 2r^2 \), contradicting compactness of \( F \). So \( \lambda_n \to 0 \). The completeness of the spectral expansion follows by showing \( \|F_{n+1}\| = |\lambda_{n+1}| \to 0 \) in operator norm. \( \square \)

---

# Chapter 3: Banach Spaces

Chapter 3 develops the theory of general Banach spaces, where we no longer have an inner product and must work with the norm alone. The chapter has three major themes: the equivalence of norms in finite dimensions (Section 3.1), the Hahn-Banach Theorem and its geometric consequences (Sections 3.2–3.3), and the Open Mapping and Closed Graph Theorems (Section 3.4). These last two, together with the Uniform Boundedness Principle from Chapter 1, form the three pillars of classical Banach space theory.

## Finite-Dimensional Normed Linear Spaces

**Example 3.1.** For non-trivial finite-dimensional inner product spaces \( U, V \) over \( \mathbb{R} \) and a linear map \( F : U \to V \), the maximum of \( \|Fx\| \) on the closed unit ball is attained, and \( \|F\| = \sqrt{\lambda} \) where \( \lambda \) is the largest eigenvalue of \( F^*F \).

**Theorem 3.2.** Let \( U \) be an \( n \)-dimensional normed linear space over \( \mathbb{R} \), with basis \( \{u_1, \ldots, u_n\} \) and associated isomorphism \( F : \mathbb{R}^n \to U \), \( F(t) = \sum_k t_k u_k \). Then both \( F \) and \( F^{-1} \) are Lipschitz continuous.

**Proof.** Setting \( M = (\sum_k \|u_k\|^2)^{1/2} \), Cauchy-Schwarz gives \( \|F(t)\| \leq M\|t\| \), so \( F \) is Lipschitz. The map \( G = \|\cdot\| \circ F : \mathbb{R}^n \to \mathbb{R} \) is continuous, so attains its minimum \( m > 0 \) on the compact unit sphere. For all \( t \in \mathbb{R}^n \), \( \|F(t)\| \geq m\|t\| \), which gives \( \|F^{-1}(x)\| \leq \frac{1}{m}\|x\| \) and Lipschitz continuity of \( F^{-1} \). \( \square \)

**Corollary 3.3.** When \( U \) and \( V \) are finite-dimensional normed spaces, every linear map \( F : U \to V \) is Lipschitz continuous.

Corollary 3.4 is one of the most useful facts about finite-dimensional spaces: there is only one Hausdorff topology compatible with the vector space structure. This means that in finite dimensions, convergence, continuity, and completeness are all intrinsic — independent of the particular norm chosen.

**Corollary 3.4.** On a finite-dimensional vector space, any two norms induce the same topology, and convergence in one norm is equivalent to convergence in any other.

**Definition 3.5.** For a metric space \( Y \) and \( \emptyset \neq X \subseteq Y \), the **distance** from \( y \in Y \) to \( X \) is \( d(y, X) = \inf\{d(y,x) \mid x \in X\} \). When \( X \) is compact, the infimum is attained.

Since finite-dimensional subspaces are closed (Theorem 3.2 gives a homeomorphism with \( \mathbb{R}^n \), which is complete) and the distance function to a finite-dimensional subspace attains its infimum (by compactness of the unit ball in \( U \)), we get:

**Theorem 3.6.** Let \( W \) be a normed space and \( U \subseteq W \) finite-dimensional. Then for every \( w \in W \) there exists \( u \in U \) with \( d(w,u) = d(w,U) \).

Theorem 3.2 establishes that all norms on a finite-dimensional space are equivalent, making the topology canonical. In infinite dimensions this is spectacularly false — as Riesz's Theorem 3.8 will show, the difference between finite and infinite dimensions is exactly whether the closed unit ball is compact. The bridge between these two facts is Riesz's Lemma, which constructs "almost orthogonal" unit vectors in infinite-dimensional spaces.

**Lemma 3.7 (Riesz's Lemma).** Let \( W \) be a normed space and \( U \subsetneq W \) a proper closed subspace. For every \( 0 < r < 1 \) there exists \( w \in W \setminus U \) with \( \|w\| = 1 \) and \( d(w, U) \geq r \).

**Proof.** Choose \( v \in W \setminus U \). Let \( d = d(v, U) > 0 \). Choose \( u \in U \) with \( \|v-u\| < d/r \). Let \( w = (v-u)/\|v-u\| \). For any \( x \in U \), \( \|x - w\| = \|v - u\|^{-1} \cdot \|v - (u + \|v-u\|x)\| \geq d/(d/r) = r \). \( \square \)

**Theorem 3.8 (Riesz's Theorem).** A normed linear space \( U \) is finite-dimensional if and only if its closed unit ball is compact.

**Proof.** If \( U \) is finite-dimensional: via the isomorphism \( F : \mathbb{R}^n \to U \) of Theorem 3.2, the preimage of \( B(0,1) \) under \( F \) is closed and bounded in \( \mathbb{R}^n \), hence compact; since \( F \) is a homeomorphism, \( B(0,1) \) is compact. If \( U \) is infinite-dimensional: inductively apply Lemma 3.7 to produce a sequence \( (u_n) \) with \( \|u_n\| = 1 \) and \( \|u_n - u_k\| \geq \frac{1}{2} \) for \( k < n \), so \( B(0,1) \) has no convergent subsequence. \( \square \)

Riesz's Theorem (Theorem 3.8) has a striking consequence: in an infinite-dimensional Banach space, the closed unit ball is never compact. This means compactness arguments require either passing to a weaker topology (as in the Banach-Alaoglu Theorem in Chapter 4) or restricting to special classes of operators (as with compact operators in Chapter 2).

## The Hahn-Banach Theorem

The Hahn-Banach Theorem addresses a fundamental question: given a bounded linear functional defined only on a subspace, can it be extended to the whole space without increasing its norm? The answer is always yes, and this extension principle has far-reaching consequences. It implies that every normed space has "enough" bounded functionals to separate points, a fact that underlies the rich duality theory of Banach spaces.

**Definition 3.9.** A **seminorm** on a vector space \( W \) is a subadditive homogeneous map \( p : W \to \mathbb{R} \): \( p(x+y) \leq p(x)+p(y) \) and \( p(tx) = |t|p(x) \).

**Theorem 3.10 (Hahn-Banach, Real Version).** Let \( W \) be a real vector space, \( U \subseteq W \) a subspace, \( p : W \to \mathbb{R} \) subadditive and positively homogeneous. Every linear \( f : U \to \mathbb{R} \) with \( f(x) \leq p(x) \) for all \( x \in U \) extends to a linear \( g : W \to \mathbb{R} \) with \( g(x) \leq p(x) \) for all \( x \in W \).

The proof strategy is to show that a one-dimensional extension is always possible: if \( f \) is defined on \( U \) and dominated by \( p \), then for any vector \( w \notin U \) the value \( f(w) \) can be chosen to maintain the domination condition on \( U + \operatorname{Span}\{w\} \). Subadditivity of \( p \) ensures that the required interval for \( f(w) \) is nonempty. Zorn's Lemma then produces a maximal dominated extension, which must be total.

**Proof sketch.** One shows that an extension by one dimension is always possible: for \( w \in W \setminus U \) and \( V = U + \operatorname{Span}\{w\} \), the value \( r = g(w) \) must be chosen to satisfy \( -p(-y-w) - f(y) \leq r \leq p(x+w) - f(x) \) for all \( x, y \in U \); subadditivity ensures this interval is nonempty. An application of Zorn's Lemma on the poset of dominated extensions then produces a maximal (hence total) extension. \( \square \)

**Theorem 3.11 (Hahn-Banach, Complex Version).** Let \( W \) be a vector space over \( \mathbb{F} \), \( U \subseteq W \) a subspace, and \( p \) a seminorm on \( W \). Every linear \( f : U \to \mathbb{F} \) with \( |f(x)| \leq p(x) \) for all \( x \in U \) extends to a linear \( g : W \to \mathbb{F} \) with \( |g(x)| \leq p(x) \) for all \( x \in W \).

**Proof.** The real case is Theorem 3.10. For \( \mathbb{F} = \mathbb{C} \): write \( f = u + iv \) where \( u, v : U \to \mathbb{R} \). Note \( f(x) = u(x) - iu(ix) \). Extend \( u \) to \( w : W \to \mathbb{R} \) by the real theorem, then set \( g(x) = w(x) - iw(ix) \). One verifies \( g \) is \( \mathbb{C} \)-linear and \( |g(x)| = \operatorname{Re}(g(e^{-i\theta}x)) = w(e^{-i\theta}x) \leq p(e^{-i\theta}x) = p(x) \). \( \square \)

**Theorem 3.12 (Hahn-Banach for Bounded Functionals).** Let \( W \) be a normed space and \( U \subseteq W \) a subspace. Every \( f \in U^* \) extends to \( g \in W^* \) with \( \|g\| = \|f\| \).

**Proof.** Apply Theorem 3.11 with \( p(x) = \|f\|\,\|x\| \). \( \square \)

The real version of Hahn-Banach (Theorem 3.10) is proved by a Zorn's Lemma argument showing that any dominated extension can be extended further unless it is already defined on all of \( W \). The complex version follows by decomposing into real and imaginary parts. The most useful corollary for applications is Theorem 3.12: every bounded functional on a subspace extends isometrically to the whole space.

**Corollary 3.13.** For any \( 0 \neq w \in W \), there exists \( g \in W^* \) with \( g(w) = \|w\| \) and \( \|g\| = 1 \).

**Proof.** Define \( f : \operatorname{Span}\{w\} \to \mathbb{F} \) by \( f(tw) = t\|w\| \), so \( \|f\| = 1 \). Extend by Theorem 3.12. \( \square \)

Corollary 3.13 is sometimes stated as: the norm on \( W \) can be recovered from the dual: \( \|w\| = \sup\{|g(w)| \mid g \in W^*, \|g\| \leq 1\} \). Corollary 3.14 strengthens this: functionals can be chosen to vanish on a given closed subspace, which is the precise tool needed to detect membership in a closed subspace via the dual.

**Corollary 3.14.** Let \( U \subsetneq W \) be a proper closed subspace and \( w \in W \setminus U \). There exists \( g \in W^* \) with \( \|g\| = 1 \), \( g(w) = d(w, U) \), and \( g(u) = 0 \) for all \( u \in U \).

**Corollary 3.15.** If \( W^* \) is separable then \( W \) is separable.

**Proof.** Let \( (f_n) \) be dense in \( W^* \). For each \( n \), pick \( u_n \in W \) with \( \|u_n\| = 1 \) and \( f_n(u_n) > \frac{1}{2}\|f_n\| \). Claim \( \overline{\operatorname{Span}\{u_n\}} = W \): if not, Corollary 3.14 gives \( g \in W^* \) with \( \|g\|=1 \) vanishing on all \( u_n \). Since \( (f_n) \) is dense, choose \( n \) with \( \|f_n - g\| < \frac{1}{3} \). Then \( \frac{1}{3} < \frac{1}{2}\|f_n\| < f_n(u_n) = (f_n-g)(u_n) \leq \|f_n-g\| < \frac{1}{3} \), a contradiction. \( \square \)

**Note 3.16.** Since \( \ell^1 \) is separable but \( \ell^\infty \) is not, Corollary 3.15 implies \( F : \ell^1 \to (\ell^\infty)^* \) of Theorem 1.28 is not surjective (for if it were, \( (\ell^\infty)^* \cong \ell^1 \) would be separable, forcing \( \ell^\infty \) to be separable).

## The Hahn-Banach Separation Theorem

The Hahn-Banach Theorem has a geometric reformulation: disjoint convex sets can be separated by a hyperplane. This is the form most useful in convex analysis and optimization. The Minkowski functional is the key tool: it converts the geometry of a convex set into a subadditive functional, to which the analytic Hahn-Banach Theorem can be applied.

**Definition 3.17.** A point \( a \in A \) in a real vector space is an **internal point** of \( A \) when for every \( u \in U \) there exists \( r > 0 \) with \( a + tu \in A \) for all \( t \in (-r,r) \). The set of internal points is the **core** of \( A \), denoted \( \operatorname{Core}(A) \). The interior of \( A \) is always contained in its core.

**Definition 3.18 (Minkowski Functional).** Let \( U \) be a real vector space and \( A \subseteq U \) convex with \( 0 \in \operatorname{Core}(A) \). The **Minkowski functional** of \( A \) is

\[
p_A(x) = \inf\left\{ r > 0 \;\Big|\; \tfrac{1}{r}x \in A \right\}.
\]

**Theorem 3.19.** The Minkowski functional of a convex set with \( 0 \) in its core is positively homogeneous and subadditive.

**Theorem 3.20 (Hahn-Banach Separation Theorem).** Let \( U \) be a real vector space and \( A, B \subseteq U \) disjoint nonempty convex sets with \( \operatorname{Core}(A) \neq \emptyset \). Then there exists a nonzero linear \( f : U \to \mathbb{R} \) with \( f(x) \leq f(y) \) for all \( x \in A \), \( y \in B \).

**Proof sketch.** Let \( C = A - B - a + b \) (translating so \( 0 \in \operatorname{Core}(C) \) and \( b-a \notin C \). The Minkowski functional \( p \) of \( C \) satisfies \( p(b-a) \geq 1 \). Define \( f(t(b-a)) = t \cdot p(b-a) \); this satisfies \( f \leq p \) on \( \operatorname{Span}\{b-a\} \). Extend by Theorem 3.10. For \( x \in A \), \( y \in B \): \( x - y - a + b \in C \) so \( p(x-y-a+b) \leq 1 \leq p(b-a) \), yielding \( f(x) \leq f(y) \). \( \square \)

## The Riesz Representation Theorem for \( C[a,b]^* \)

We now give a concrete description of the dual of \( C[a,b] \), the space of continuous functions on a closed interval. While the Riesz Representation Theorem for Hilbert spaces identified \( H^* \cong H \), the dual of \( C[a,b] \) is more subtle: it consists of all bounded linear functionals representable as Riemann-Stieltjes integrals against functions of bounded variation. This brings us to a brief but essential detour through bounded variation and the Stieltjes integral.

**Definition 3.22 (Bounded Variation).** For \( f : [a,b] \to \mathbb{R} \) and a partition \( P = (x_0, \ldots, x_n) \), define \( V(f,P) = \sum_{k=1}^n |f(x_k) - f(x_{k-1})| \). The **total variation** is \( V(f,[a,b]) = \sup_P V(f,P) \). We say \( f \) is of **bounded variation** when \( V(f,[a,b]) < \infty \); the space is denoted \( BV[a,b] \).

**Definition 3.24 (Riemann-Stieltjes Integral).** For \( g \in BV[a,b] \) and \( f \in C[a,b] \), the **Riemann-Stieltjes integral** is

\[
\int_a^b f\,dg = \lim_{\|P\|\to 0} \sum_{k=1}^n f(t_k)(g(x_k) - g(x_{k-1})).
\]
One can show this limit exists and satisfies \( |\int_a^b f\,dg| \leq V(g,[a,b]) \cdot \|f\|_\infty \).

The total variation \( V(g,[a,b]) \) plays the role of the norm of the functional: the map \( g \mapsto L_g \) where \( L_g(f) = \int_a^b f\,dg \) is an isometric isomorphism from a suitable quotient of \( BV[a,b] \) onto \( C[a,b]^* \). This gives a concrete, measure-theoretic description of all continuous linear functionals on continuous functions.

**Theorem 3.26 (Riesz Representation for \( C[a,b]^* \).** For every \( L \in C[a,b]^* \) there exists \( g \in BV[a,b] \) with \( g(a) = 0 \), \( V(g,[a,b]) = \|L\| \), and

\[
L(f) = \int_a^b f\,dg \quad \forall f \in C[a,b].
\]

**Proof sketch.** Extend \( L \) to \( M \in B[a,b]^* \) with \( \|M\| = \|L\| \). Define \( g(x) = M(s_x) \) where \( s_x \) is the step function \( s_x(t) = \mathbf{1}_{t \leq x} \). Show \( g \in BV[a,b] \) by estimating variation against \( \|M\| \). For continuous \( f \), approximate by step functions \( f_n \) in the supremum norm; then \( M(f) = \lim M(f_n) = \lim \sum f(x_k)(g(x_k)-g(x_{k-1})) = \int_a^b f\,dg \). \( \square \)

## The Open Mapping Theorem and the Closed Graph Theorem

The Open Mapping Theorem and the Closed Graph Theorem are the third pillar of classical Banach space theory. The Open Mapping Theorem says that a surjective bounded operator between Banach spaces is automatically open — it sends open sets to open sets. This implies that a bijective bounded operator has a bounded inverse, so every algebraic isomorphism between Banach spaces is a topological isomorphism. The Closed Graph Theorem gives a practical criterion for checking continuity: a linear map with closed graph must be bounded.

**Theorem 3.27 (Open Mapping Theorem).** Let \( U \) and \( V \) be Banach spaces and \( F \in B(U,V) \) surjective. Then \( F \) is open: for every open \( A \subseteq U \), \( F(A) \) is open in \( V \).

**Proof.** Step 1: Show that for all \( R > 0 \) there exists \( r > 0 \) with \( B(0,r) \subseteq \overline{F(B(0,R))} \). Since \( V = \bigcup_n \overline{F(B(0,n))} \) and \( V \) is complete, Baire gives some \( \overline{F(B(0,n))} \) with nonempty interior; by scaling \( \overline{F(B(0,1))} \) has nonempty interior. Find \( c, r \) with \( B(c,2r) \subseteq \overline{F(B(0,1))} \); by symmetry \( B(0,r) \subseteq \overline{F(B(0,2))} \).

Step 2: Lift the closure: show \( B(0,r) \subseteq F(B(0,1)) \) by an iterative approximation. Given \( y \in B(0,r) \), find \( x_1 \in B(0,\frac{1}{2}) \) with \( \|y - Fx_1\| < \frac{r}{2} \), then \( x_2 \in B(0,\frac{1}{4}) \) with \( \|y - F(x_1+x_2)\| < \frac{r}{4} \), etc. The series \( u = \sum x_k \) converges in \( U \) (since \( \sum \|x_k\| < 1 \) and \( Fu = y \).

Step 3: For open \( A \subseteq U \) and \( v = Fu \in F(A) \) with \( B(u,R) \subseteq A \), find \( r \) with \( B(0,r) \subseteq F(B(0,R)) \); then \( B(v,r) \subseteq F(A) \). \( \square \)

The Open Mapping Theorem has an elegant corollary about equivalent norms: if two complete norms on the same space satisfy a one-sided inequality, they must be equivalent. The proof is a one-line application — the identity map is a surjective bounded operator and hence open, forcing its inverse to be bounded as well.

**Definition 3.28 (Equivalent Norms).** Two norms on a vector space \( U \) are **equivalent** when they induce the same topology, i.e., when there exist \( \ell, m > 0 \) with \( \|x\|_2 \leq \ell\|x\|_1 \) and \( \|x\|_1 \leq m\|x\|_2 \) for all \( x \).

**Corollary 3.29.** Let \( U \) be complete under norms \( \|\cdot\|_1 \) and \( \|\cdot\|_2 \). If \( \|x\|_2 \leq \ell\|x\|_1 \) for all \( x \), then the two norms are equivalent.

**Proof.** The identity \( I : (U,\|\cdot\|_1) \to (U,\|\cdot\|_2) \) is continuous (bounded) and surjective, hence open by the Open Mapping Theorem. So its inverse is also continuous. \( \square \)

**Definition 3.31 (Closed Graph).** A linear map \( F : U \to V \) has a **closed graph** when for every sequence \( (x_n) \), if \( x_n \to a \) in \( U \) and \( Fx_n \to b \) in \( V \), then \( b = Fa \).

The Open Mapping Theorem is proved using the Baire Category Theorem, much like the Uniform Boundedness Principle. The proof proceeds in two steps: first use Baire to show that the image of the unit ball has nonempty interior in the closure, then use completeness to lift the closure and show the image actually contains an open ball.

**Theorem 3.32 (Closed Graph Theorem).** Let \( U \) and \( V \) be Banach spaces and \( F : U \to V \) linear. If \( F \) has a closed graph, then \( F \) is continuous (bounded).

**Proof.** Define a second norm on \( U \) by \( \|x\|_3 = \|x\|_1 + \|Fx\|_2 \). If \( (x_n) \) is Cauchy in \( \|\cdot\|_3 \), it is Cauchy in both \( \|\cdot\|_1 \) and \( \|\cdot\|_2 \), so \( x_n \to a \) and \( Fx_n \to b \). Since \( F \) has closed graph, \( b = Fa \), and \( x_n \to a \) in \( \|\cdot\|_3 \). So \( (U, \|\cdot\|_3) \) is complete. Since \( \|x\|_1 \leq \|x\|_3 \), Corollary 3.29 gives \( \ell \) with \( \|x\|_3 \leq \ell\|x\|_1 \). Then \( \|Fx\|_2 \leq \|x\|_3 \leq \ell\|x\|_1 \), so \( F \) is bounded. \( \square \)

---

# Chapter 4: Topology

The final chapter develops the general topological framework needed for the Banach-Alaoglu Theorem — the compactness result for the dual unit ball in the weak\( ^* \) topology. While the previous chapters worked primarily in normed spaces (metric spaces with extra structure), the weak\( ^* \) topology on an infinite-dimensional dual space is not metrizable in general, which forces us to work in the broader setting of topological spaces and use nets instead of sequences. The path is: general topology \( \to \) product topology \( \to \) Tychonoff's Theorem \( \to \) Banach-Alaoglu.

## Topological Spaces and Bases

**Definition 4.1 (Topology).** A **topology** on a set \( X \) is a collection \( \mathcal{T} \) of subsets of \( X \) (the **open sets**) such that: (1) \( \emptyset, X \in \mathcal{T} \); (2) \( \mathcal{T} \) is closed under arbitrary unions; (3) \( \mathcal{T} \) is closed under finite intersections. A subset \( A \subseteq X \) is **closed** when \( A^c \in \mathcal{T} \). The **interior** \( A^\circ \) is the largest open set contained in \( A \); the **closure** \( \overline{A} \) is the smallest closed set containing \( A \).

A topology \( \mathcal{S} \) is **coarser** than \( \mathcal{T} \) (and \( \mathcal{T} \) is **finer**) when \( \mathcal{S} \subseteq \mathcal{T} \). Given any collection \( \mathcal{S} \) of subsets of \( X \), there is a unique coarsest topology containing \( \mathcal{S} \) (the **topology generated by** \( \mathcal{S} \), consisting of arbitrary unions of finite intersections of elements of \( \mathcal{S} \).

A **basis** for a topology on \( X \) is a collection \( \mathcal{B} \) with: (1) \( X = \bigcup \mathcal{B} \); (2) for all \( U, V \in \mathcal{B} \) and \( a \in U \cap V \), there exists \( W \in \mathcal{B} \) with \( a \in W \subseteq U \cap V \).

### Neighbourhood Systems and Bases

<div class="definition">
<strong>Definition 4.1a (Neighbourhood).</strong> Let \( (X, \mathcal{T}) \) be a topological space and \( x \in X \). A set \( U \subseteq X \) is a <strong>neighbourhood</strong> of \( x \) if there exists some open \( G \in \mathcal{T} \) with \( x \in G \subseteq U \). The <strong>neighbourhood system</strong> at \( x \) is \( \mathcal{U}_x := \{ U \subseteq X : U \text{ is a neighbourhood of } x \} \).
</div>

<div class="theorem">
<strong>Theorem 4.1b (Properties of neighbourhood systems).</strong> Let \( (X, \mathcal{T}) \) be a topological space and \( x \in X \). Then:
<ol>
<li>\( U \in \mathcal{U}_x \) implies \( x \in U \).</li>
<li>\( U, V \in \mathcal{U}_x \) implies \( U \cap V \in \mathcal{U}_x \).</li>
<li>For all \( U \in \mathcal{U}_x \), there exists \( V \in \mathcal{U}_x \) such that \( U \in \mathcal{U}_y \) for all \( y \in V \).</li>
<li>\( U \in \mathcal{U}_x \) and \( U \subseteq V \) implies \( V \in \mathcal{U}_x \).</li>
<li>\( G \subseteq X \) is open if and only if \( G \) contains a neighbourhood of each of its points.</li>
</ol>
Conversely, given collections \( \mathcal{U}_x \) for each \( x \in X \) satisfying (1)–(4), defining open sets via (5) yields a topology on \( X \) whose neighbourhood system at \( x \) is exactly \( \mathcal{U}_x \).
</div>

<div class="definition">
<strong>Definition 4.1c (Neighbourhood base).</strong> Let \( (X, \mathcal{T}) \) be a topological space. A collection \( \mathcal{B}_x \subseteq \mathcal{U}_x \) is a <strong>neighbourhood base</strong> at \( x \) if for every \( U \in \mathcal{U}_x \) there exists \( B \in \mathcal{B}_x \) with \( B \subseteq U \). Elements of \( \mathcal{B}_x \) are called <strong>basic neighbourhoods</strong> of \( x \).

A <strong>subbase</strong> for \( \mathcal{T} \) is a collection \( \mathcal{S} \subseteq \mathcal{T} \) such that the set of all finite intersections of elements of \( \mathcal{S} \) forms a base for \( \mathcal{T} \). Any collection \( \mathcal{C} \subseteq 2^X \) serves as a subbase for some topology on \( X \), called the <strong>topology generated by</strong> \( \mathcal{C} \).
</div>

In a metric space \( (X, d) \), the open balls \( \{V_r(x) : r > 0\} \) form a neighbourhood base at each \( x \); equivalently, any sequence \( r_n \to 0 \) gives \( \mathcal{B}_x = \{V_{r_n}(x) : n \geq 1\} \) as a countable neighbourhood base. This is the content of the first-countability axiom satisfied by all metric spaces.

### Separation Axioms

<div class="definition">
<strong>Definition 4.1d (Separation axioms).</strong> Let \( (X, \mathcal{T}) \) be a topological space.
<ul>
<li><strong>\( T_0 \)</strong>: For every \( x \neq y \in X \), either there is a neighbourhood \( U \in \mathcal{U}_x \) with \( y \notin U \), or a neighbourhood \( V \in \mathcal{U}_y \) with \( x \notin V \).</li>
<li><strong>\( T_1 \)</strong>: For every \( x \neq y \in X \), there exist \( U \in \mathcal{U}_x \) with \( y \notin U \) and \( V \in \mathcal{U}_y \) with \( x \notin V \). Equivalently, every singleton \( \{x\} \) is closed.</li>
<li><strong>\( T_2 \) (Hausdorff)</strong>: For every \( x \neq y \in X \), there exist disjoint \( U \in \mathcal{U}_x \) and \( V \in \mathcal{U}_y \).</li>
<li><strong>Regular</strong>: Whenever \( F \subseteq X \) is closed and \( x \notin F \), the sets \( F \) and \( \{x\} \) can be separated by disjoint open sets.</li>
<li><strong>Normal</strong>: Whenever \( F_1, F_2 \subseteq X \) are disjoint closed sets, they can be separated by disjoint open sets.</li>
<li><strong>\( T_3 \)</strong>: \( T_1 \) and regular.</li>
<li><strong>\( T_4 \)</strong>: \( T_1 \) and normal.</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem 4.1e.</strong> Every metric space equipped with the metric topology is \( T_4 \).
</div>

**Proof.** Given disjoint closed \( F_1, F_2 \subseteq X \), define \( g : X \to \mathbb{R} \) by \( g(x) = d(x, F_1) - d(x, F_2) \). Then \( F_1 \subseteq g^{-1}(-\infty, 0) \) and \( F_2 \subseteq g^{-1}(0, \infty) \), and these are disjoint open sets. \( \square \)

<div class="theorem">
<strong>Theorem 4.1f.</strong> Every compact Hausdorff topological space is \( T_3 \) and \( T_4 \).
</div>

**Proof sketch.** Let \( x \notin F \subseteq X \) closed. For every \( y \in F \), find disjoint open \( U_y \ni x \) and \( V_y \ni y \). Then \( F \subseteq \bigcup_{y \in F} V_y \) is an open cover of the compact set \( F \), so extract a finite subcover \( \{V_{y_1}, \ldots, V_{y_n}\} \). Then \( x \in \bigcap_i U_{y_i} \) and \( F \subseteq \bigcup_i V_{y_i} \) are disjoint open sets. The \( T_4 \) argument is similar. \( \square \)

<div class="proposition">
<strong>Proposition 4.1g.</strong> Every compact metric space is separable.
</div>

A basis simplifies the description of a topology: instead of specifying all open sets, we specify a collection of "basic" open sets and take all unions of finite intersections. In metric spaces the open balls form a natural basis, and this motivates the definition of a general topological basis.

**Theorem 4.2.** Let \( \mathcal{B} \) be a basis generating topology \( \mathcal{T} \). Then \( A \in \mathcal{T} \) iff for every \( a \in A \) there exists \( U \in \mathcal{B} \) with \( a \in U \subseteq A \), equivalently iff \( A \) is a union of elements of \( \mathcal{B} \).

**Example 4.3.** In a metric space \( X \), the collection of open balls \( \{B(a,r) \mid a \in X, r > 0\} \) is a basis for the metric topology.

**Theorem 4.4.** Let \( X \) be a topological space with basis \( \mathcal{B} \), and \( A \subseteq X \). Then \( a \in \overline{A} \) if and only if \( A \cap U \neq \emptyset \) for every \( U \in \mathcal{B} \) with \( a \in U \).

**Example 4.5 (Subspace Topology).** When \( X \subseteq Y \) and \( Y \) has topology \( \mathcal{T} \), the **subspace topology** on \( X \) is \( \{V \cap X \mid V \in \mathcal{T}\} \).

**Example 4.6 (Product Topology).** For topological spaces \( X, Y \), the **product topology** on \( X \times Y \) has basis \( \{U \times V \mid U \subseteq X, V \subseteq Y \text{ open}\} \).

**Example 4.7 (Quotient Topology).** For an equivalence relation \( \sim \) on a topological space \( X \) with quotient map \( q : X \to X/{\sim} \), the **quotient topology** is \( \{V \subseteq X/{\sim} \mid q^{-1}(V) \text{ open in } X\} \).

## Continuous Functions and Compact Sets

Compactness is the topological substitute for finiteness: a compact space is one where every open cover can be reduced to a finite subcover, which makes it possible to convert local information into global conclusions. The interplay between compactness and the Hausdorff condition (Theorems 4.16, 4.17, 4.21) will be central when we later prove the Banach-Alaoglu Theorem by embedding the dual unit ball into a compact product space.

**Definition 4.8 (Hausdorff).** A topological space \( X \) is **Hausdorff** when for all distinct \( a, b \in X \) there exist disjoint open sets \( U, V \) with \( a \in U \), \( b \in V \). All metric spaces are Hausdorff.

**Definition 4.10 (Continuity).** A function \( f : X \to Y \) between topological spaces is **continuous** when \( f^{-1}(V) \) is open in \( X \) for every open \( V \subseteq Y \).

**Definition 4.11 (Compactness).** A subset \( A \subseteq X \) is **compact** when every open cover of \( A \) has a finite subcover.

**Theorem 4.12.** A subset \( A \subseteq X \subseteq Y \) is compact in \( X \) (with the subspace topology) iff it is compact in \( Y \).

The finite intersection property (Theorem 4.15) is the reformulation of compactness in terms of closed sets rather than open covers. It is particularly natural when working with families of closed sets — such as the family of closures of projected sets that appears in the proof of Tychonoff's Theorem.

**Theorem 4.15.** A topological space \( X \) is compact iff it has the **finite intersection property on closed sets**: every collection of closed sets with the property that every finite subcollection has nonempty intersection has nonempty total intersection.

**Theorem 4.16.** Every closed subspace of a compact space is compact.

**Theorem 4.17.** Every compact subspace of a Hausdorff space is closed.

**Theorem 4.18.** The continuous image of a compact space is compact.

**Theorem 4.20 (Extreme Value Theorem).** A continuous map \( f : X \to \mathbb{R} \) on a compact space attains its maximum and minimum.

**Theorem 4.21.** Let \( X \) be compact, \( Y \) Hausdorff, and \( f : X \to Y \) continuous and bijective. Then \( f \) is a homeomorphism.

Theorem 4.21 is a topological analogue of Corollary 3.29 in Banach space theory: in the right structural setting (compact domain, Hausdorff codomain), a bijective continuous map is automatically an isomorphism. It is used, for instance, to show that a continuous bijection from a compact space to a Hausdorff space is a homeomorphism without needing to check continuity of the inverse directly.

## Urysohn's Lemma and the Tietze Extension Theorem

Urysohn's Lemma and the Tietze Extension Theorem are two powerful results about normal spaces — topological spaces where disjoint closed sets can be separated by open sets. Since all metric spaces are normal, these results apply freely in our normed space setting. Urysohn's Lemma constructs continuous functions that separate closed sets; the Tietze Theorem uses it to extend continuous functions from closed subsets to the whole space.

**Definition 4.23 (Normal Space).** A topological space is **normal** when all one-point sets are closed and for all disjoint closed sets \( A, B \) there exist disjoint open sets \( U, V \) with \( A \subseteq U \), \( B \subseteq V \). All metric spaces are normal.

**Theorem 4.25 (Urysohn's Lemma).** Let \( X \) be normal and \( A, B \subseteq X \) disjoint and closed. There exists a continuous \( f : X \to [0,1] \) with \( f|_A = 0 \) and \( f|_B = 1 \).

**Proof sketch.** Enumerate \( [0,1] \cap \mathbb{Q} = \{a_0, a_1, a_2, \ldots\} \) with \( a_0 = 0, a_1 = 1 \). Inductively construct open sets \( U_r \) for each \( r \in [0,1] \cap \mathbb{Q} \) such that \( r < s \implies \overline{U_r} \subseteq U_s \), with \( A \subseteq U_0 \) and \( B \cap U_1 = \emptyset \). Define \( f(x) = \inf\{r \in \mathbb{Q} \mid x \in U_r\} \) and verify continuity by showing preimages of open intervals are open. \( \square \)

**Theorem 4.26 (Tietze Extension Theorem).** Let \( X \) be normal, \( A \subseteq X \) closed, and \( a < b \).
1. Every continuous \( f : A \to [a,b] \) extends to continuous \( g : X \to [a,b] \).
2. Every continuous \( f : A \to (a,b) \) extends to continuous \( g : X \to (a,b) \).

**Proof sketch of (1).** WLOG \( [a,b] = [-1,1] \). Inductively, apply Urysohn's Lemma to construct a continuous approximation \( g_1 : X \to [-\frac{1}{3}, \frac{1}{3}] \) with \( \|f - g_1|_A\|_\infty \leq \frac{2}{3} \). Repeat on the residual \( f - g_1|_A \) scaled by \( \frac{2}{3} \), obtaining \( g_2 \) with \( \|g_k\|_\infty \leq \frac{2^{k-1}}{3^k} \). The series \( g = \sum_k g_k \) converges uniformly (Weierstrass M-test), defines a continuous extension with \( \|g\|_\infty \leq \sum \frac{2^{k-1}}{3^k} = 1 \). \( \square \)

## Infinite Products and Tychonoff's Theorem

Tychonoff's Theorem — that any product of compact spaces is compact in the product topology — is the technical cornerstone of the Banach-Alaoglu Theorem. The proof requires Zorn's Lemma (or equivalently, the Axiom of Choice), and the choice of the product topology over the box topology is essential: the box topology on an infinite product of compact spaces need not be compact. The distinction is that basic open sets in the product topology are allowed to impose conditions on only finitely many coordinates.

**Definition 4.27.** The **cartesian product** \( \prod_{k \in K} X_k \) is the set of all indexed families \( (a_k)_{k \in K} \) with \( a_k \in X_k \). When each \( X_k \) is a topological space, the **product topology** has basis

\[
\left\{ \prod_{k \in K} U_k \;\Big|\; U_k \subseteq X_k \text{ open}, \; U_k = X_k \text{ for all but finitely many } k \right\}.
\]
The coarser product topology differs from the finer **box topology** (which allows arbitrary open \( U_k \) at every index) when \( K \) is infinite.

**Theorem 4.29.** A function \( f : A \to \prod_{k \in K} X_k \) (with the product topology) is continuous iff each component \( f_k = p_k \circ f : A \to X_k \) is continuous, where \( p_k \) is the projection.

**Theorem 4.31 (Tychonoff's Theorem).** The product of any indexed family of compact spaces is compact in the product topology.

**Proof sketch.** Using Zorn's Lemma, extend any collection \( \mathcal{T} \) of closed sets with the finite intersection property to a maximal such collection \( \mathcal{S} \) (closed under finite intersections). For each \( k \), the collection \( \{p_k(A) \mid A \in \mathcal{S}\} \) of projected sets still has the finite intersection property in the compact space \( X_k \), so choose \( a_k \in \bigcap_{A \in \mathcal{S}} \overline{p_k(A)} \). The point \( a = (a_k) \) lies in every \( A \in \mathcal{S} \) (because every basic open neighbourhood of \( a \) meets every \( A \in \mathcal{S} \), hence in every element of \( \mathcal{T} \). \( \square \)

## Nets

Sequences are insufficient to describe convergence and closure in general topological spaces — only in spaces satisfying the first countability axiom (every point has a countable neighborhood basis, which metric spaces do) do sequences determine the topology. In the weak\( ^* \) topology on an infinite-dimensional dual space, sequences are not enough. Nets provide the correct generalization: they are indexed by directed sets rather than by \( \mathbb{N} \), and they characterize both closure (Theorem 4.34) and continuity (Theorem 4.35) in full generality.

**Definition 4.32.** A **directed set** is a set \( K \) with a binary relation \( \leq \) that is reflexive, transitive, and directed (for all \( a, b \) there exists \( c \) with \( a \leq c \) and \( b \leq c \)). A **net** in a topological space \( X \) is an indexed family \( (x_k)_{k \in K} \) where \( K \) is directed. A net **converges** to \( a \in X \) when for every open \( U \ni a \) there exists \( m \in K \) such that \( k \geq m \implies x_k \in U \).

<div class="example">
<strong>Example 4.32a (Examples of directed sets and nets).</strong>
<ul>
<li>The natural numbers \( \mathbb{N} \) under the usual \( \leq \) form a directed set, so every sequence is a net.</li>
<li>For a topological space \( X \) and \( x \in X \), the neighbourhood system \( \mathcal{U}_x \) directed by \( U_1 \leq U_2 \iff U_2 \subseteq U_1 \) is a directed set. Choosing any \( x_U \in U \) for each \( U \in \mathcal{U}_x \) gives a net \( (x_U)_{U \in \mathcal{U}_x} \) converging to \( x \).</li>
<li>The power set \( 2^X \) under inclusion is a directed set.</li>
</ul>
A subsequence is a subnet, but a subnet need not be a sequence since its domain need not be countable.
</div>

<div class="definition">
<strong>Definition 4.32b (Subnet).</strong> Let \( \varphi : M \to \Lambda \) be a function between directed sets. We say \( \varphi \) is <strong>increasing</strong> if \( \mu_1 \leq \mu_2 \implies \varphi(\mu_1) \leq \varphi(\mu_2) \), and <strong>cofinal</strong> if for each \( \lambda \in \Lambda \) there exists \( \mu \in M \) with \( \lambda \leq \varphi(\mu) \). A <strong>subnet</strong> of a net \( P : \Lambda \to X \) is a composition \( P \circ \varphi \) where \( \varphi : M \to \Lambda \) is increasing and cofinal. We write \( (x_{\varphi(\mu)})_{\mu \in M} \).
</div>

The Hausdorff property can be characterized entirely in terms of net convergence: a topological space \( X \) is Hausdorff if and only if every net in \( X \) has at most one limit.

**Theorem 4.34.** Let \( X \) be a topological space, \( A \subseteq X \), \( a \in X \). Then \( a \in \overline{A} \) iff there is a net \( (x_k) \) in \( A \) with \( x_k \to a \).

**Theorem 4.35.** Let \( f : A \subseteq X \to Y \). Then \( f \) is continuous on \( A \) iff for every net \( (x_k) \) in \( A \) with \( x_k \to a \in A \), we have \( f(x_k) \to f(a) \) in \( Y \).

Theorems 4.34 and 4.35 show that nets can replace sequences in all the standard characterizations of topology. When we work with the weak\( ^* \) topology on \( U^* \), we will freely use net-convergence: a net \( (f_\alpha) \) converges weak\( ^* \) to \( g \) if and only if \( f_\alpha(x) \to g(x) \) for every \( x \in U \), exactly as sequences do for the weak\( ^* \) topology on separable spaces.

## Strong and Weak Topologies and the Banach-Alaoglu Theorem

We now bring all the preceding machinery together. The weak and weak\( ^* \) topologies are the initial topologies generated by bounded functionals: they are coarser than the norm topology, meaning they have fewer open sets and hence more convergent nets. The weak\( ^* \) topology is the right topology on the dual unit ball \( B_{U^*}(0,1) \) because, as Remark 4.43 notes, the ball is far too large to be compact in the norm topology in infinite dimensions.

**Definition 4.36 (Final/Strong Topology).** Given functions \( f_k : X_k \to Y \), the **final (strong) topology** on \( Y \) is the finest topology making all \( f_k \) continuous.

The initial topology is the coarsest topology making a collection of functions continuous. It is the right notion when you want convergence to be determined by a family of "test functions" — exactly the situation for weak and weak\( ^* \) topologies on normed spaces.

**Definition 4.38 (Initial/Weak Topology).** Given functions \( f_k : X \to Y_k \), the **initial (weak) topology** on \( X \) is the coarsest topology making all \( f_k \) continuous — the topology generated by \( \{f_k^{-1}(U) \mid k \in K, \; U \subseteq Y_k \text{ open}\} \).

Now we specialize the initial topology construction to the setting of normed spaces, obtaining the two most important non-metric topologies in functional analysis.

**Definition 4.41 (Weak and Weak\( ^* \) Topologies).** Let \( U \) be a normed space.
- The **weak topology** on \( U \) is the initial topology with respect to \( (f)_{f \in U^*} \).
- The **weak\( ^* \) topology** on \( U^* \) is the initial topology with respect to \( (F_u)_{u \in U} \) where \( F_u(f) = f(u) \).

**Theorem 4.42.** In a normed space \( U \):
1. \( x_k \to a \) in the weak topology iff \( f(x_k) \to f(a) \) for all \( f \in U^* \).
2. \( f_k \to g \) in \( U^* \) with the weak\( ^* \) topology iff \( f_k(x) \to g(x) \) for all \( x \in U \).

**Remark 4.43.** When \( U \) is infinite-dimensional, the closed unit ball \( B_{U^*}(0,1) \) is **not** compact in the norm topology on \( U^* \) (by Riesz's Theorem 3.8). The Banach-Alaoglu Theorem shows it is compact in a weaker topology.

The weak and weak\( ^* \) topologies differ in an important way: the weak topology is generated by all elements of \( U^* \), while the weak\( ^* \) topology on \( U^* \) is generated only by the evaluation functionals \( F_u \) for \( u \in U \). When \( U \) is reflexive (\( U \cong U^{**} \)), these coincide on \( U^* \), but in general the weak\( ^* \) topology is strictly coarser.

**Theorem 4.44 (Banach-Alaoglu Theorem).** For any normed space \( U \), the closed unit ball \( B_{U^*}(0,1) = \{f \in U^* \mid \|f\| \leq 1\} \) is compact in the weak\( ^* \) topology.

**Proof.** Let \( B = \{x \in U \mid \|x\| \leq 1\} \), \( D = \{t \in \mathbb{F} \mid |t| \leq 1\} \), and \( P = D^B = \prod_{u \in B} D \) with the product topology. The restriction map \( R : B_{U^*}(0,1) \to P \), \( R(f)(x) = f(x) \), is injective and continuous (each component \( R_u(f) = f(u) \) is continuous in the weak\( ^* \) topology). The image \( R(B_{U^*}(0,1)) \) is closed in \( P \) (limit points of locally-linear functions on \( B \) extend to linear maps on \( U \). Since \( D \) is compact, \( P \) is compact by Tychonoff. As a closed subset of a compact space, \( R(B_{U^*}(0,1)) \) is compact. Since \( R \) is a homeomorphism onto its image (its inverse is also continuous), \( B_{U^*}(0,1) \) is compact. \( \square \)

The Banach-Alaoglu Theorem is proved by embedding \( B_{U^*}(0,1) \) continuously into the product space \( D^B = \prod_{u \in B} D \) (where \( D \) is the closed unit disk in \( \mathbb{F} \)), which is compact by Tychonoff. The image is shown to be closed in \( D^B \), hence compact, and the embedding is a homeomorphism onto its image. This is one of the few places in the course where the full strength of Tychonoff's Theorem — for uncountable products — is needed.

## Locally Convex Topological Vector Spaces

**Definition 4.45.** A **topological vector space** over \( \mathbb{F} \) is a Hausdorff vector space with a topology making addition and scalar multiplication continuous. It is **locally convex** when its topology has a basis of convex sets.

Every normed space carries at least three natural locally convex topologies: the norm topology (the finest), the weak topology (coarser), and when working with the dual, the weak\( ^* \) topology (the coarsest of the three on \( U^* \)). Locally convex spaces are exactly the setting where the Hahn-Banach separation results apply in their strongest form.

**Example 4.46.** For a normed space \( U \): the norm topology, the weak topology \( (U, \text{wk}) \), and the weak\( ^* \) topology \( (U^*, \text{wk}^*) \) are all locally convex topological vector spaces. In particular, the weak topology is Hausdorff (by the Hahn-Banach Theorem, distinct points are separated by functionals) and has a basis of convex sets (finite intersections of sets of the form \( f^{-1}(V) \).

**Note 4.49.** In a real topological vector space \( U \), the interior of any set is contained in its core: \( A^\circ \subseteq \operatorname{Core}(A) \).

**Theorem 4.50 (Hahn-Banach Separation for Topological Vector Spaces).** Let \( U \) be a real topological vector space and \( A, B \subseteq U \) disjoint nonempty convex subsets.
1. If \( A \) is open, there exists \( 0 \neq f \in U^* \) and \( c \in \mathbb{R} \) with \( f(x) < c \leq f(y) \) for all \( x \in A \), \( y \in B \).
2. If \( U \) is locally convex, \( A \) is compact, and \( B \) is closed, there exists \( 0 \neq f \in U^* \) and \( c \in \mathbb{R} \) with \( f(x) < c < f(y) \) for all \( x \in A \), \( y \in B \).

---

# Chapter 5: Topological Vector Spaces

Topological vector spaces (TVS) provide the most general setting in which linear algebra and topology coexist harmoniously. Every normed space is a TVS, but the category is much broader: it includes spaces equipped with families of seminorms (locally convex spaces), spaces of distributions, and the weak and weak\( ^* \) topologies on Banach spaces. The key structural results of this chapter are the uniqueness of the topology on finite-dimensional TVS and the equivalence of local compactness with finite dimensionality.

## Topological Vector Spaces: Definitions and Basic Properties

<div class="definition">
<strong>Definition 5.1 (Compatible topology).</strong> Let \( W \) be a vector space over \( \mathbb{K} \) and \( \mathcal{T} \) a topology on \( W \). We say \( \mathcal{T} \) is <strong>compatible</strong> with the vector space structure if the maps \( \sigma : W \times W \to W \), \( (x,y) \mapsto x+y \), and \( \mu : \mathbb{K} \times W \to W \), \( (k,x) \mapsto kx \), are continuous (where \( W \times W \) and \( \mathbb{K} \times W \) carry the respective product topologies).
</div>

<div class="definition">
<strong>Definition 5.2 (Topological vector space).</strong> A <strong>topological vector space (TVS)</strong> is a pair \( (W, \mathcal{T}) \) where \( W \) is a vector space over \( \mathbb{K} \) equipped with a compatible Hausdorff topology \( \mathcal{T} \).
</div>

Every normed linear space is a TVS under the norm topology. Less obvious examples include the weak topology and the weak\( ^* \) topology on the dual of a Banach space, which are TVS topologies but not (in general) norm topologies.

<div class="proposition">
<strong>Proposition 5.3 (Neighbourhoods of 0 are absorbing).</strong> Let \( (V, \mathcal{T}) \) be a topological vector space. If \( U \in \mathcal{U}_0 \) is any neighbourhood of \( 0 \), then

\[
V = \bigcup_{n \geq 1} nU.
\]
</div>

This says that every neighbourhood of \( 0 \) in a TVS is <em>absorbing</em>: scaling it by large integers covers the whole space. The proof uses the continuity of scalar multiplication: for any \( x \in V \), the map \( t \mapsto tx \) is continuous, so \( tx \in U \) for small enough \( t > 0 \), which means \( x \in nU \) for large enough \( n \).

<div class="definition">
<strong>Definition 5.4 (Balanced set).</strong> A set \( N \subseteq V \) in a TVS is <strong>balanced</strong> if \( kN \subseteq N \) for all \( k \in \mathbb{K} \) with \( |k| \leq 1 \).
</div>

The open ball of radius \( \delta \) in any normed linear space is a balanced neighbourhood of \( 0 \).

<div class="proposition">
<strong>Proposition 5.5.</strong> Every neighbourhood of \( 0 \) in a topological vector space contains a balanced open neighbourhood of \( 0 \).
</div>

<div class="proposition">
<strong>Proposition 5.6.</strong> Let \( (V, \mathcal{T}) \) be a TVS and \( Y \) a linear manifold in \( V \). Then: (a) \( Y \) is a TVS with the relative topology; (b) \( \overline{Y} \) is a closed subspace of \( V \). Moreover, if \( C \subseteq V \) is convex then so is \( \overline{C} \), and if \( E \subseteq V \) is balanced then so is \( \overline{E} \).
</div>

<div class="definition">
<strong>Definition 5.7 (Cauchy net and completeness in a TVS).</strong> Let \( (V, \mathcal{T}) \) be a TVS and \( (x_\lambda)_\lambda \) a net in \( V \). The net is <strong>Cauchy</strong> if for every \( U \in \mathcal{U}_0 \) there exists \( \lambda_0 \) such that \( \lambda_1, \lambda_2 \geq \lambda_0 \implies x_{\lambda_1} - x_{\lambda_2} \in U \). A subset \( K \subseteq V \) is <strong>Cauchy complete</strong> if every Cauchy net in \( K \) converges to some element of \( K \).
</div>

In a normed linear space, Cauchy nets and Cauchy sequences coincide on bounded sets, so the TVS notion of completeness recovers the familiar Banach space completeness.

## Quotient Topological Vector Spaces

<div class="proposition">
<strong>Proposition 5.8 (Quotient TVS).</strong> Let \( (V, \mathcal{T}) \) be a TVS and \( W \subseteq V \) a closed subspace. Equip \( V/W \) with the quotient topology (a set \( G \subseteq V/W \) is open iff \( q^{-1}(G) \) is open in \( V \)). Then \( V/W \) is a TVS, the canonical quotient map \( q : V \to V/W \) is continuous and open (maps open sets to open sets), and \( V/W \) is Hausdorff.
</div>

## Finite-Dimensional Topological Vector Spaces

The next theorem is one of the most elegant results in TVS theory: every finite-dimensional TVS over \( \mathbb{K} \) is homeomorphic to \( \mathbb{K}^n \). This says that no matter how strange the topology looks, as long as it is Hausdorff and compatible with the vector space structure, it must agree with the standard Euclidean topology in finite dimensions.

<div class="lemma">
<strong>Lemma 5.9.</strong> Let \( (V, \mathcal{T}) \) be a one-dimensional TVS over \( \mathbb{K} \) with basis \( \{e\} \). The map \( \tau : \mathbb{K} \to V \), \( k \mapsto ke \), is a homeomorphism.
</div>

<div class="proposition">
<strong>Proposition 5.10.</strong> Let \( n \in \mathbb{Z}^+ \) and \( (V, \mathcal{T}) \) an \( n \)-dimensional TVS over \( \mathbb{K} \) with basis \( \{e_1, \ldots, e_n\} \). The map \( \tau : \mathbb{K}^n \to V \) given by \( (k_1, \ldots, k_n) \mapsto \sum_j k_j e_j \) is a homeomorphism.
</div>

<div class="corollary">
<strong>Corollary 5.11.</strong> There is a unique topology on any finite-dimensional vector space \( V \) making it a TVS. In particular, any two norms on a finite-dimensional vector space are equivalent.
</div>

<div class="corollary">
<strong>Corollary 5.12.</strong> Every finite-dimensional linear manifold of a TVS is closed.
</div>

## Local Compactness

<div class="definition">
<strong>Definition 5.13 (Local compactness).</strong> A topological space \( (X, \mathcal{T}) \) is <strong>locally compact</strong> if each point \( x \in X \) has a neighbourhood base consisting of compact sets.
</div>

The space \( \mathbb{K}^n \) is locally compact: the closed balls around any point form a compact neighbourhood base. The following theorem shows this is the only locally compact TVS.

<div class="theorem">
<strong>Theorem 5.14.</strong> A topological vector space \( (V, \mathcal{T}) \) is locally compact if and only if \( V \) is finite-dimensional.
</div>

The proof of the non-trivial direction uses the following: if \( V \) is locally compact, choose a compact neighbourhood \( K \) of \( 0 \). Find a smaller open neighbourhood \( N \) with \( N + N \subseteq K \). By compactness, \( K \subseteq \{x_1, \ldots, x_r\} + N \) for finitely many \( x_i \). Let \( M = \operatorname{Span}\{x_1, \ldots, x_r\} \). Repeated scaling shows \( V = M \), hence \( V \) is finite-dimensional.

<div class="corollary">
<strong>Corollary 5.15.</strong> The closed unit ball of a normed linear space \( X \) is compact if and only if \( X \) is finite-dimensional.
</div>

## Uniform Continuity and Extension in TVS

<div class="definition">
<strong>Definition 5.16 (Uniform continuity in TVS).</strong> Let \( (V, \mathcal{T}_V) \) and \( (W, \mathcal{T}_W) \) be TVS. A map \( f : V \to W \) is <strong>uniformly continuous</strong> if for every \( U \in \mathcal{U}_0^W \) there exists \( N \in \mathcal{U}_0^V \) such that \( x - y \in N \implies f(x) - f(y) \in U \).
</div>

<div class="theorem">
<strong>Theorem 5.17.</strong> Let \( T : V \to W \) be linear. The following are equivalent: (a) \( T \) is continuous at some \( x_0 \in V \); (b) \( T \) is uniformly continuous on \( V \).
</div>

<div class="corollary">
<strong>Corollary 5.18.</strong> If \( \dim V < \infty \) and \( T : V \to W \) is linear, then \( T \) is continuous.
</div>

<div class="proposition">
<strong>Proposition 5.19 (Extension by continuity).</strong> Suppose \( W \) is Cauchy complete. If \( X \subseteq V \) is a linear manifold and \( T_0 : X \to W \) is continuous and linear, then \( T_0 \) extends to a unique continuous linear map \( T : \overline{X} \to W \).
</div>

<div class="corollary">
<strong>Corollary 5.20.</strong> If \( X, Y \) are Banach spaces and \( M \subseteq X \) is a linear manifold, then any bounded \( T_0 : M \to Y \) extends to a bounded linear map \( T : \overline{M} \to Y \) with \( \|T\| = \|T_0\| \).
</div>

---

# Chapter 6: Seminorms and Locally Convex Spaces

Locally convex spaces are topological vector spaces whose topology is generated by a family of seminorms. This is a rich class that includes all Banach spaces, all Hilbert spaces, and all the weak and weak\( ^* \) topologies encountered in duality theory. The key feature of locally convex spaces is that the Hahn-Banach extension and separation theorems hold in their strongest forms, making them the natural domain for functional-analytic duality.

## Seminorms and the Locally Convex Topology

<div class="definition">
<strong>Definition 6.1 (Seminorm).</strong> Let \( V \) be a vector space over \( \mathbb{K} \). A <strong>seminorm</strong> on \( V \) is a map \( p : V \to \mathbb{R} \) satisfying: (i) \( p(x) \geq 0 \) for all \( x \); (ii) \( p(\lambda x) = |\lambda| p(x) \) for all \( x \in V \), \( \lambda \in \mathbb{K} \); (iii) \( p(x+y) \leq p(x) + p(y) \) for all \( x, y \in V \). A seminorm satisfying \( p(x) = 0 \implies x = 0 \) is a norm.
</div>

Note that the triangle inequality implies \( |p(x) - p(z)| \leq p(z - x) \) for any seminorm \( p \), so seminorms are always Lipschitz continuous once they are continuous at a single point.

<div class="example">
<strong>Example 6.2.</strong> Let \( V = C([0,1], \mathbb{C}) \). For each \( t \in [0,1] \), the map \( p_t : V \to \mathbb{R} \), \( p_t(f) = |f(t)| \), is a seminorm. The family \( \{p_t : t \in [0,1] \cap \mathbb{Q}\} \) is a <em>separating</em> family of seminorms (see Definition 6.6 below).
</div>

<div class="definition">
<strong>Definition 6.3 (Minkowski functional on TVS).</strong> Let \( W \) be a TVS and \( E \in \mathcal{U}_0 \) a convex neighbourhood of \( 0 \). The <strong>Minkowski (gauge) functional</strong> of \( E \) is

\[
p_E(x) := \inf\{r > 0 : x \in rE\}.
\]
</div>

<div class="proposition">
<strong>Proposition 6.4.</strong> Let \( W \) be a TVS and \( E \in \mathcal{U}_0 \) convex. Then: (a) \( p_E \) is a sublinear functional; (b) if \( E \) is open, then \( E = \{w \in W : p_E(w) < 1\} \); (c) if \( E \) is balanced, then \( p_E \) is a seminorm.
</div>

<div class="proposition">
<strong>Proposition 6.5.</strong> Let \( W \) be a TVS and \( p \) a seminorm on \( W \). The following are equivalent: (a) \( p \) is continuous on \( W \); (b) there exists \( U \in \mathcal{U}_0^W \) on which \( p \) is bounded above.
</div>

<div class="definition">
<strong>Definition 6.6 (Separating family of seminorms).</strong> A family \( \Gamma \) of seminorms on a vector space \( W \) is <strong>separating</strong> if for every \( 0 \neq x \in W \) there exists \( p \in \Gamma \) with \( p(x) \neq 0 \).
</div>

<div class="definition">
<strong>Definition 6.7 (Locally convex topology).</strong> A topology \( \mathcal{T} \) on a TVS \( W \) is <strong>locally convex</strong> if it admits a base of convex sets. We call \( (W, \mathcal{T}) \) a <strong>locally convex (topological vector) space</strong>. Any locally convex space admits a neighbourhood base at \( 0 \) consisting of balanced, open, convex sets.
</div>

<div class="theorem">
<strong>Theorem 6.8.</strong> If \( \Gamma \) is a separating family of seminorms on a vector space \( W \), then

\[
\mathcal{B} := \{N(x, F, \varepsilon) : x \in W, \varepsilon > 0, F \subseteq \Gamma \text{ finite}\},
\]
where \( N(x, F, \varepsilon) = \{y \in W : p(x-y) < \varepsilon \text{ for all } p \in F\} \), is a base for a locally convex topology \( \mathcal{T} \) on \( W \) in which each \( p \in \Gamma \) is continuous. Conversely, every locally convex topology is generated by some separating family of seminorms (Theorem 6.9).
</div>

<div class="proposition">
<strong>Proposition 6.10.</strong> Let \( V \) be a vector space with separating family of seminorms \( \Gamma \) generating the locally convex topology \( \mathcal{T} \). A net \( (x_\lambda)_\lambda \) in \( V \) converges to \( x \in V \) in \( (V, \mathcal{T}) \) if and only if \( \lim_\lambda p(x - x_\lambda) = 0 \) for all \( p \in \Gamma \).
</div>

<div class="proposition">
<strong>Proposition 6.11.</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( W \subseteq V \) a closed subspace. Then \( V/W \) is also a locally convex space in the quotient topology.
</div>

## Strong and Weak Operator Topologies

The bounded operators \( B(H) \) on a Hilbert space \( H \) carry not just the operator norm topology but two important coarser locally convex topologies. These arise naturally in the theory of von Neumann algebras and in the spectral theorem for unbounded operators.

<div class="definition">
<strong>Definition 6.12 (Strong Operator Topology).</strong> For each \( x \in H \), let \( p_x : B(H) \to \mathbb{R} \) be the seminorm \( p_x(T) = \|Tx\| \). The family \( \Gamma_\mathrm{SOT} = \{p_x : x \in H\} \) is separating. The locally convex topology generated by \( \Gamma_\mathrm{SOT} \) is called the <strong>strong operator topology (SOT)</strong> on \( B(H) \). A net \( (T_\lambda) \) converges to \( T \) in SOT if and only if \( \|T_\lambda x - Tx\| \to 0 \) for all \( x \in H \) (pointwise convergence of operators). A neighbourhood base for SOT at \( T \in B(H) \) is

\[
\{N(T, \{x_1,\ldots,x_m\}, \varepsilon) : m \geq 1, x_i \in H, \varepsilon > 0\},
\]
where \( N(T, F, \varepsilon) = \{R \in B(H) : \|Rx_i - Tx_i\| < \varepsilon, \, i \in [m]\} \).
</div>

<div class="definition">
<strong>Definition 6.13 (Weak Operator Topology).</strong> For each \( (x, y) \in H \times H \), let \( q_{x,y} : B(H) \to \mathbb{R} \) be the seminorm \( q_{x,y}(T) = |\langle Tx, y \rangle| \). The locally convex topology generated by \( \Gamma_\mathrm{WOT} = \{q_{x,y} : (x,y) \in H \times H\} \) is called the <strong>weak operator topology (WOT)</strong> on \( B(H) \). A net \( (T_\lambda) \) converges to \( T \) in WOT if and only if \( \langle T_\lambda x, y \rangle \to \langle Tx, y \rangle \) for all \( x, y \in H \). The three topologies on \( B(H) \) satisfy: norm topology \( \supseteq \) SOT \( \supseteq \) WOT.
</div>

<div class="proposition">
<strong>Proposition 6.14.</strong> Let \( T : V \to W \) be a linear map between locally convex spaces with separating seminorm families \( \Gamma_V \) and \( \Gamma_W \). The following are equivalent: (a) \( T \) is continuous; (b) for every \( q \in \Gamma_W \), there exist \( \kappa > 0 \) and \( p_1, \ldots, p_m \in \Gamma_V \) with \( q(Tx) \leq \kappa \max_i p_i(x) \) for all \( x \in V \).
</div>

<div class="corollary">
<strong>Corollary 6.15.</strong> A linear functional \( f \) on a locally convex space \( (V, \mathcal{T}) \) is continuous if and only if there exists a continuous seminorm \( p \) on \( V \) such that \( |f(x)| \leq p(x) \) for all \( x \in V \).
</div>

---

# Chapter 7: The Hahn-Banach Theorem

The Hahn-Banach Theorem is one of the cornerstones of functional analysis. In its analytic form it allows extension of linear functionals; in its geometric form it separates disjoint convex sets by hyperplanes. Both forms are essential tools throughout the subject.

## Linear Functionals and Hyperplanes

<div class="definition">
<strong>Definition 7.1 (Algebraic and topological duals).</strong> Let \( W \) be a vector space over \( \mathbb{K} \). The <strong>algebraic dual</strong> \( W^\# \) is the vector space of all linear functionals \( f : W \to \mathbb{K} \). If \( W \) is a TVS, the <strong>topological dual</strong> \( W^* \) is the subspace of continuous linear functionals. The two coincide when \( W \) is finite-dimensional.
</div>

<div class="example">
<strong>Example 7.2.</strong> The map \( f(x) = \sum_{n \geq 1} x_n \) on \( c_{00}(\mathbb{K}) \) (finitely supported sequences under the sup norm) is an unbounded, hence discontinuous, linear functional. This shows \( W^\# \supsetneq W^* \) in general.
</div>

<div class="lemma">
<strong>Lemma 7.3 (Complexification of real functionals).</strong> Let \( V \) be a vector space over \( \mathbb{C} \).
<ol>
<li>If \( f : V \to \mathbb{R} \) is \( \mathbb{R} \)-linear, then \( f_\mathbb{C}(x) := f(x) - if(ix) \) is a \( \mathbb{C} \)-linear functional with \( \operatorname{Re} f_\mathbb{C} = f \).</li>
<li>If \( g : V \to \mathbb{C} \) is \( \mathbb{C} \)-linear and \( f = \operatorname{Re} g \), then \( g = f_\mathbb{C} \).</li>
<li>If \( p \) is a \( \mathbb{C} \)-seminorm and \( |f(x)| \leq p(x) \) for all \( x \), then \( |f_\mathbb{C}(x)| \leq p(x) \) for all \( x \).</li>
<li>If \( V \) is a normed space, then \( \|f\| = \|f_\mathbb{C}\| \).</li>
</ol>
</div>

<div class="definition">
<strong>Definition 7.4 (Hyperplane).</strong> A <strong>hyperplane</strong> \( M \) in a vector space \( V \) is a linear manifold with \( \dim(V/M) = 1 \). Every nonzero \( \varphi \in V^\# \) has kernel \( M = \ker \varphi \) which is a hyperplane; conversely every hyperplane arises as a kernel of some linear functional.
</div>

<div class="proposition">
<strong>Proposition 7.5.</strong> If \( (V, \mathcal{T}) \) is a TVS and \( M \subseteq V \) is a hyperplane, then either \( M \) is closed or \( M \) is dense in \( V \).
</div>

<div class="corollary">
<strong>Corollary 7.6.</strong> Let \( V \) be a TVS and \( \rho \in V^\# \). The following are equivalent: (a) \( \rho \) is continuous on \( V \) (i.e., \( \rho \in V^* \)); (b) \( \ker \rho \) is closed.
</div>

<div class="proposition">
<strong>Proposition 7.7.</strong> Let \( V \) be a vector space and \( f \in V^\# \).
<ol>
<li>If \( g \in V^\# \) and \( g|_{\ker f} = 0 \), then \( g = kf \) for some \( k \in \mathbb{K} \).</li>
<li>If \( g, f_1, \ldots, f_N \in V^\# \) and \( g(x) = 0 \) for all \( x \in \bigcap_{j=1}^N \ker f_j \), then \( g \in \operatorname{Span}\{f_1, \ldots, f_N\} \).</li>
</ol>
</div>

## The Extension Theorems

The classical Hahn-Banach theorems extend dominated or bounded linear functionals from subspaces to the whole space, preserving the domination or the norm.

<div class="theorem">
<strong>Theorem 7.8 (Hahn-Banach I — real sublinear domination).</strong> Let \( V \) be a vector space over \( \mathbb{R} \) and \( p : V \to \mathbb{R} \) a sublinear functional. If \( M \subseteq V \) is a linear manifold and \( f : M \to \mathbb{R} \) is linear with \( f(m) \leq p(m) \) for all \( m \in M \), then there exists a linear \( g : V \to \mathbb{R} \) with \( g|_M = f \) and \( g(x) \leq p(x) \) for all \( x \in V \).
</div>

<div class="theorem">
<strong>Theorem 7.9 (Hahn-Banach II — seminorm domination over \( \mathbb{K} \)).</strong> Let \( V \) be a vector space over \( \mathbb{K} \), \( M \subseteq V \) a linear manifold, and \( p : V \to \mathbb{R} \) a seminorm. If \( f : M \to \mathbb{K} \) is linear with \( |f(m)| \leq p(m) \) for all \( m \in M \), then there exists a linear \( g : V \to \mathbb{K} \) with \( g|_M = f \) and \( |g(x)| \leq p(x) \) for all \( x \in V \).
</div>

<div class="theorem">
<strong>Theorem 7.10 (Hahn-Banach III — norm-preserving extension).</strong> Let \( (X, \|\cdot\|) \) be a normed linear space, \( M \subseteq X \) a linear manifold, and \( f \in M^* \). There exists \( g \in X^* \) with \( g|_M = f \) and \( \|g\| = \|f\| \).
</div>

<div class="corollary">
<strong>Corollary 7.11 (Extension in locally convex spaces).</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( W \subseteq V \) a linear manifold. Then every \( f \in W^* \) extends to some \( g \in V^* \).
</div>

<div class="corollary">
<strong>Corollary 7.12.</strong> Let \( (V, \mathcal{T}) \) be a locally convex space.
<ol>
<li>For any linearly independent \( \{x_j : j \in [m]\} \subseteq V \) and any scalars \( \{k_j\} \), there exists \( g \in V^* \) with \( g(x_j) = k_j \) for all \( j \).</li>
<li>For every \( 0 \neq y \in V \), there exists \( g \in V^* \) with \( g(y) \neq 0 \).</li>
</ol>
</div>

<div class="proposition">
<strong>Proposition 7.13.</strong> Every finite-dimensional subspace of a locally convex space \( (V, \mathcal{T}) \) is topologically complemented.
</div>

<div class="theorem">
<strong>Theorem 7.14.</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( W \subseteq V \) a linear manifold. Then

\[
\overline{W} = \bigcap \{ \ker f : f \in V^*, \; W \subseteq \ker f \}.
\]
In particular: (a) \( W \) is dense iff \( f \in V^* \) and \( f|_W = 0 \) implies \( f = 0 \); (b) the canonical embedding \( J : X \to X^{**} \) is an isometry (so \( \|x\| = \sup\{|x^*(x)| : x^* \in X^*, \|x^*\| \leq 1\} \)).

</div>

<div class="corollary">
<strong>Corollary 7.15.</strong> Let \( (X, \|\cdot\|) \) be a normed linear space and \( Y \subseteq X \) a closed subspace. For any \( z \in X \setminus Y \), setting \( d = d(z, Y) \), there exists \( x^* \in X^* \) with \( \|x^*\| = 1 \), \( x^*|_Y = 0 \), and \( x^*(z) = d \).
</div>

## The Separation Theorems

<div class="proposition">
<strong>Proposition 7.16.</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( \emptyset \neq G \subseteq V \) open, convex, with \( 0 \notin G \). There exists a closed hyperplane \( M \subseteq V \) with \( G \cap M = \emptyset \).
</div>

<div class="definition">
<strong>Definition 7.17 (Half-spaces and separation).</strong> In a real TVS \( (V, \mathcal{T}) \), an <strong>open half-space</strong> is \( \{x \in V : f(x) > k\} \) for some \( 0 \neq f \in V^* \) and \( k \in \mathbb{R} \). Sets \( A, B \subseteq V \) are <strong>separated</strong> if there are closed half-spaces \( S_A, S_B \) with \( A \subseteq S_A \), \( B \subseteq S_B \), and \( S_A \cap S_B \) a closed affine hyperplane. They are <strong>strictly separated</strong> if there are disjoint open half-spaces.
</div>

<div class="theorem">
<strong>Theorem 7.18 (Hahn-Banach IV — separation of open convex sets).</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( A, B \subseteq V \) nonempty, disjoint, open, and convex. Then \( A \) and \( B \) are strictly separated: there exists a continuous linear \( f : V \to \mathbb{R} \) (or \( \mathbb{C} \) with \( \operatorname{Re} f \) separating) and \( k \in \mathbb{R} \) with \( \operatorname{Re} f(a) > k > \operatorname{Re} f(b) \) for all \( a \in A \), \( b \in B \).
</div>

<div class="theorem">
<strong>Theorem 7.19 (Hahn-Banach IV — strict separation with compact/closed sets).</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( A, B \subseteq V \) nonempty, disjoint, closed, and convex, with \( B \) compact. There exist \( \alpha > \beta \in \mathbb{R} \) and a continuous \( f \in V^* \) with \( \operatorname{Re} f(a) \geq \alpha > \beta \geq \operatorname{Re} f(b) \) for all \( a \in A \), \( b \in B \).
</div>

<div class="corollary">
<strong>Corollary 7.20.</strong> In a locally convex space, the closed convex hull of any nonempty set \( A \) is the intersection of all closed half-spaces containing \( A \).
</div>

---

# Chapter 8: Weak Topologies and Dual Spaces

This chapter develops the theory of weak topologies in the context of Banach spaces, establishing the key results on reflexivity, weak compactness, and the annihilator calculus. The Banach-Alaoglu Theorem (proved in Chapter 4) is the foundation; here we draw its algebraic and metrizability consequences.

## Dual Pairs and the Weak\( ^* \) Topology

<div class="definition">
<strong>Definition 8.1 (Dual pair).</strong> A <strong>dual pair</strong> is a pair \( (V, L) \) where \( V \) is a vector space and \( L \subseteq V^\# \) is a separating linear manifold of functionals.
</div>

For a locally convex space \( (V, \mathcal{T}) \), the pair \( (V, V^*) \) is a dual pair. The weak topology \( \sigma(V, V^*) \) is the coarsest topology making every \( f \in V^* \) continuous; a net \( (x_\lambda) \) converges weakly to \( x \) iff \( f(x_\lambda) \to f(x) \) for all \( f \in V^* \). It follows that \( \sigma(V, V^*) \subseteq \mathcal{T} \), so norm convergence implies weak convergence.

<div class="definition">
<strong>Definition 8.2 (Weak\( ^* \) topology).</strong> For a locally convex space \( (V, \mathcal{T}) \) and its dual \( V^* \), identify each \( x \in V \) with the functional \( \hat{x} : V^* \to \mathbb{K} \), \( \hat{x}(\rho) = \rho(x) \). The pair \( (V^*, \hat{V}) \) is a dual pair, and the <strong>weak\( ^* \) topology</strong> \( \sigma(V^*, \hat{V}) \) on \( V^* \) is the coarsest topology making each \( \hat{x} \) continuous. A net \( (\rho_\lambda) \) converges weak\( ^* \) to \( \rho \) iff \( \rho_\lambda(x) \to \rho(x) \) for every \( x \in V \).
</div>

<div class="theorem">
<strong>Theorem 8.3.</strong> Let \( (V, L) \) be a dual pair. The continuous linear functionals on \( (V, \sigma(V,L)) \) are exactly the elements of \( L \). That is, \( (V, \sigma(V, L))^* = L \).
</div>

<div class="theorem">
<strong>Theorem 8.4.</strong> Let \( C \) be a convex subset of a locally convex space \( (V, \mathcal{T}) \). The closure of \( C \) in \( \mathcal{T} \) coincides with its weak closure in \( \sigma(V, V^*) \).
</div>

This is a profound result: for convex sets, norm closure and weak closure agree. This is because closed convex sets are precisely the intersections of closed half-spaces, and half-spaces are defined by continuous linear functionals.

## Uniform Boundedness, Banach-Steinhaus, and Goldstein

<div class="theorem">
<strong>Theorem 8.5 (Uniform Boundedness Principle — general form).</strong> Let \( (X, d) \) be a complete metric space and \( H \subseteq C(X, \mathbb{K}) \) a nonempty family of continuous functions such that \( \sup_{h \in H} |h(x)| < \infty \) for each \( x \in X \). Then there exists an open set \( G \subseteq X \) and a constant \( M > 0 \) with \( |h(x)| \leq M \) for all \( h \in H \), \( x \in G \).
</div>

<div class="corollary">
<strong>Corollary 8.6 (Uniform Boundedness for Banach spaces).</strong> Let \( X, Y \) be Banach spaces and \( \mathcal{A} \subseteq B(X, Y) \) such that \( \sup_{T \in \mathcal{A}} \|Tx\| < \infty \) for each \( x \in X \). Then \( \sup_{T \in \mathcal{A}} \|T\| < \infty \).
</div>

<div class="corollary">
<strong>Corollary 8.7.</strong> Let \( X \) be a Banach space. (a) A set \( S \subseteq X \) is bounded iff \( \sup_{s \in S} |x^*(s)| < \infty \) for all \( x^* \in X^* \). (b) A set \( G \subseteq X^* \) is bounded iff \( \sup_{s^* \in G} |s^*(x)| < \infty \) for all \( x \in X \).
</div>

<div class="theorem">
<strong>Theorem 8.8 (Banach-Steinhaus).</strong> Let \( X, Y \) be Banach spaces and \( (T_n)_{n \geq 1} \subseteq B(X,Y) \) such that for every \( x \in X \) the limit \( T x := \lim_n T_n x \) exists in \( Y \). Then: (a) \( \sup_n \|T_n\| < \infty \); (b) \( T \in B(X,Y) \); (c) \( \|T\| \leq \liminf_n \|T_n\| \).
</div>

<div class="corollary">
<strong>Corollary 8.9.</strong> If \( (x_n)_n \) converges weakly to \( x \) in a Banach space \( X \), then \( \sup_n \|x_n\| < \infty \) and \( \|x\| \leq \liminf_n \|x_n\| \). Similarly if \( (y_n^*)_n \to y^* \) in the weak\( ^* \) topology on \( X^* \).
</div>

<div class="theorem">
<strong>Theorem 8.10 (Goldstein's Theorem).</strong> Let \( X \) be a Banach space and \( J : X \to X^{**} \) the canonical embedding. Then \( J(X_1) \) is weak\( ^* \)-dense in \( X_1^{**} \) (where \( X_1, X_1^{**} \) denote the respective closed unit balls). Consequently, \( J(X) \) is weak\( ^* \)-dense in \( X^{**} \).

</div>

<div class="proposition">
<strong>Proposition 8.11 (Reflexivity and weak compactness).</strong> Let \( X \) be a Banach space. The following are equivalent: (a) \( X \) is reflexive; (b) the unit ball \( X_1 \) is weakly compact.
</div>

## Metrizability of the Dual Unit Ball

Although weak and weak\( ^* \) topologies are not metrizable in general, their restrictions to bounded sets can be.

<div class="theorem">
<strong>Theorem 8.12.</strong> Let \( X \) be a Banach space. Then \( X_1^* \) is weak\( ^* \)-metrizable if and only if \( X \) is separable.
</div>

<div class="corollary">
<strong>Corollary 8.13.</strong> If \( X \) is a separable Banach space, then \( X_1^* \) is separable in the weak\( ^* \) topology (in fact sequentially compact and compact).
</div>

<div class="theorem">
<strong>Theorem 8.14.</strong> Let \( X \) be a Banach space. Then \( X_1 \) is weakly metrizable if and only if \( X^* \) is separable.
</div>

## Annihilators and Quotient Duals

<div class="definition">
<strong>Definition 8.15 (Annihilator and pre-annihilator).</strong> Let \( X \) be a Banach space, \( M \subseteq X \), \( N \subseteq X^* \). The <strong>annihilator</strong> of \( M \) is

\[
M^\perp = \{x^* \in X^* : x^*(m) = 0 \text{ for all } m \in M\}.
\]
The <strong>pre-annihilator</strong> of \( N \) is

\[
{}^\perp N = \{x \in X : n^*(x) = 0 \text{ for all } n^* \in N\}.
\]
</div>

<div class="theorem">
<strong>Theorem 8.16.</strong> Let \( X \) be a Banach space and \( M \subseteq X \) a closed subspace. Let \( q : X \to X/M \) be the canonical quotient map. Then the map \( \Theta : (X/M)^* \to M^\perp \), \( \xi \mapsto \xi \circ q \), is an isometric isomorphism of Banach spaces.
</div>

<div class="theorem">
<strong>Theorem 8.17.</strong> Let \( X \) be a Banach space and \( M \subseteq X \) a closed subspace. The map \( \Theta : X^*/M^\perp \to M^* \), \( x^* + M^\perp \mapsto x^*|_M \), is an isometric isomorphism.
</div>

<div class="theorem">
<strong>Theorem 8.18 (Riesz Representation for \( C_0(X)^* \)).</strong> Let \( X \) be a locally compact Hausdorff space and \( \mathcal{M}(X) \) the space of \( \mathbb{K} \)-valued finite regular Borel measures on \( X \) with the total variation norm \( \|\mu\| = |\mu|(X) \). The map \( \Theta : \mathcal{M}(X) \to C_0(X, \mathbb{K})^* \), \( \mu \mapsto \beta_\mu \) where \( \beta_\mu(f) = \int_X f \, d\mu \), is an isometric linear isomorphism.
</div>

<div class="corollary">
<strong>Corollary 8.19 (Banach-Alaoglu consequences).</strong>
<ol>
<li>Every Banach space \( X \) is isometrically isomorphic to a subspace of \( (C(L, \mathbb{K}), \|\cdot\|_\infty) \) for some compact Hausdorff space \( L \).</li>
<li>If \( A \subseteq X^* \) is weak\( ^* \)-closed and bounded, then \( A \) is weak\( ^* \)-compact.</li>
</ol>
</div>

---

# Chapter 9: Extremal Points

The Krein-Milman Theorem is the capstone result connecting convexity theory with the structure of compact convex sets in locally convex spaces. It asserts that every compact convex set is the closed convex hull of its extreme points — those points that cannot be expressed as a proper convex combination of other points in the set. This has profound applications in optimization, operator algebras, and mathematical physics.

## Extreme Points and Faces

<div class="definition">
<strong>Definition 9.1 (Extreme point).</strong> Let \( V \) be a vector space and \( C \subseteq V \) a convex subset. A point \( e \in C \) is an <strong>extreme point</strong> of \( C \) if whenever \( x, y \in C \) and \( e = tx + (1-t)y \) for some \( t \in (0,1) \), then \( x = y = e \). The set of all extreme points of \( C \) is denoted \( \operatorname{Ext}(C) \).
</div>

<div class="example">
<strong>Example 9.2.</strong> In \( B(\mathbb{C}^n) \), the state space \( \mathcal{S}(B(\mathbb{C}^n)) \) — the set of positive, norm-one linear functionals — is a compact convex subset of \( B(\mathbb{C}^n)^* \). Its extreme points are the <em>pure states</em>. The normalized trace functional \( T \mapsto \frac{1}{n} \sum_{k=1}^n \langle Te_k, e_k \rangle \) is a positive state of norm one.
</div>

<div class="definition">
<strong>Definition 9.3 (Face).</strong> Let \( C \subseteq V \) be a nonempty convex set. A nonempty convex subset \( F \subseteq C \) is a <strong>face</strong> of \( C \) if whenever \( x, y \in C \) and \( tx + (1-t)y \in F \) for some \( t \in (0,1) \), then \( x, y \in F \). The singleton \( \{e\} \) is a face of \( C \) iff \( e \in \operatorname{Ext}(C) \).
</div>

<div class="lemma">
<strong>Lemma 9.4.</strong> Let \( C \subseteq V \) be convex and \( F \subseteq C \) a face. If \( \{x_j : j \in [n]\} \subseteq C \) and \( x = \sum_{j=1}^n t_j x_j \) is a convex combination with \( x \in F \) and all \( t_j \in (0,1) \), then \( x_j \in F \) for all \( j \).
</div>

<div class="lemma">
<strong>Lemma 9.5.</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( K \subseteq V \) nonempty, compact, and convex. For any \( \rho \in V^* \), the set

\[
F := \{x \in K : \operatorname{Re} \rho(x) = \sup_{w \in K} \operatorname{Re} \rho(w)\}
\]
is a nonempty, compact face of \( K \).
</div>

<div class="lemma">
<strong>Lemma 9.6.</strong> Every nonempty, compact, convex subset of a locally convex space has at least one extreme point: \( \operatorname{Ext}(K) \neq \emptyset \).
</div>

<div class="theorem">
<strong>Theorem 9.7 (Krein-Milman).</strong> Let \( (V, \mathcal{T}) \) be a locally convex space and \( K \subseteq V \) nonempty, compact, and convex. Then

\[
K = \overline{\operatorname{conv}}(\operatorname{Ext}(K)),
\]
the closed convex hull of the extreme points of \( K \).
</div>

The Krein-Milman Theorem is proved by the repeated application of Lemma 9.5: any continuous linear functional attains its supremum on a face, and Zorn's Lemma produces a minimal face, which must be a singleton extreme point. The full statement then follows from the Hahn-Banach separation theorems.

<div class="corollary">
<strong>Corollary 9.8.</strong> For any \( \rho \in V^* \), there exists \( e \in \operatorname{Ext}(K) \) such that \( \operatorname{Re} \rho(w) \leq \operatorname{Re} \rho(e) \) for all \( w \in K \).
</div>

<div class="corollary">
<strong>Corollary 9.9.</strong> Let \( X \) be a Banach space and \( A \subseteq X^* \) weak\( ^* \)-closed and bounded. Then \( A \) is weak\( ^* \)-compact. If \( A \) is also convex, then \( A = \overline{\operatorname{conv}}^{w^*}(\operatorname{Ext}(A)) \).
</div>

---

# Chapter 10: Named Theorems

This chapter collects the structural theorems of Banach space theory — the Open Mapping Theorem, Closed Graph Theorem, and their consequences for complemented subspaces and idempotent operators. These results, together with the Hahn-Banach Theorem and the Uniform Boundedness Principle, form the classical core of functional analysis.

## The Open Mapping and Closed Graph Theorems (Marcoux's Formulation)

<div class="lemma">
<strong>Lemma 10.1.</strong> Let \( X, Y \) be Banach spaces and \( T \in B(X, Y) \). If \( Y_{1/2} \subseteq \overline{T(X_m)} \) for some \( m \geq 1 \), then \( Y_1 \subseteq T(X_{2m}) \) (where \( X_r \) denotes the ball of radius \( r \)).
</div>

<div class="theorem">
<strong>Theorem 10.2 (Open Mapping Theorem).</strong> Let \( X, Y \) be Banach spaces and \( T \in B(X, Y) \) surjective. Then \( T \) is an open map: it sends open sets to open sets.
</div>

<div class="corollary">
<strong>Corollary 10.3 (Inverse Mapping Theorem).</strong> Let \( X, Y \) be Banach spaces and \( T \in B(X, Y) \) bijective. Then \( T^{-1} \) is continuous, so \( T \) is a homeomorphism of Banach spaces.
</div>

<div class="corollary">
<strong>Corollary 10.4 (Closed Graph Theorem).</strong> Let \( X, Y \) be Banach spaces and \( T : X \to Y \) linear. If the graph \( \mathcal{G}(T) = \{(x, Tx) : x \in X\} \) is closed in \( X \oplus_1 Y \), then \( T \) is continuous. Equivalently: (a) \( \mathcal{G}(T) \) is closed; (b) \( T \) is continuous; (c) if \( \lim_n x_n = 0 \) and \( \lim_n Tx_n = y \), then \( y = 0 \).
</div>

## Complemented Subspaces and Projections

The following results give a clean algebraic characterization of topological complementation in Banach spaces via bounded idempotents.

<div class="lemma">
<strong>Lemma 10.5.</strong> Two closed subspaces \( Y, Z \) of a Banach space \( X \) topologically complement each other if and only if the map \( \iota : Y \oplus_1 Z \to X \), \( (y,z) \mapsto y+z \), is a homeomorphism of Banach spaces.
</div>

<div class="proposition">
<strong>Proposition 10.6.</strong> Let \( X \) be a Banach space and \( Y, Z \) topologically complementary subspaces. For each \( x \in X \), write \( x = y_x + z_x \) uniquely with \( y_x \in Y \), \( z_x \in Z \). Define \( E : X \to Y \) by \( Ex = y_x \). Then:
<ol>
<li>\( E \) is a continuous linear map with \( E^2 = E \), \( \operatorname{Im} E = Y \), and \( \ker E = Z \).</li>
<li>Conversely, if \( E \in B(X) \) satisfies \( E^2 = E \), then \( \operatorname{Im} E \) and \( \ker E \) are topologically complementary closed subspaces.</li>
</ol>
A subspace \( Y \) of \( X \) is topologically complemented if and only if it is the range of a bounded idempotent in \( B(X) \).
</div>

---

# Chapter 11: Operator Theory

This chapter develops the theory of compact operators on Banach and Hilbert spaces, culminating in the Spectral Theorem for compact normal operators (which subsumes and strengthens the self-adjoint case developed in Chapter 2).

## The Banach Space Adjoint

For a bounded operator between Banach spaces, the adjoint acts on the dual spaces. Unlike the Hilbert space adjoint (which lands in the same space), the Banach space adjoint is a map between the dual spaces.

<div class="definition">
<strong>Definition 11.1 (Banach space adjoint).</strong> Let \( X, Y \) be Banach spaces and \( T \in B(X, Y) \). For \( y^* \in Y^* \), the map \( x \mapsto y^*(Tx) \) defines an element \( T^* y^* \in X^* \). The <strong>Banach space adjoint</strong> of \( T \) is the map \( T^* : Y^* \to X^* \), \( T^* y^*(x) = y^*(Tx) \). We have \( \|T^*\| = \|T\| \).
</div>

<div class="proposition">
<strong>Proposition 11.2.</strong> Let \( X, Y, Z \) be Banach spaces, \( S, T \in B(X,Y) \), and \( R \in B(Y,Z) \). Then \( (k_1 S + k_2 T)^* = k_1 S^* + k_2 T^* \) and \( (R \circ T)^* = T^* \circ R^* \).
</div>

<div class="proposition">
<strong>Proposition 11.3.</strong> Let \( X \) be an \( n \)-dimensional Banach space with Hamel basis \( E = \{e_i : i \in [n]\} \) and let \( [A] = [a_{ij}] \) be the matrix of \( A \in B(X) \) relative to \( E \). The matrix of the Banach space adjoint \( A^* \) relative to the dual basis \( E^* \) is the transpose \( [A]^T = [a_{ji}] \).
</div>

The Hilbert space adjoint defined in Chapter 2 is related: for \( T \in B(H) \) with \( H \) a Hilbert space, identifying \( H \cong H^* \) via the Riesz Representation Theorem converts the Banach space adjoint \( T^* : H^* \to H^* \) into the Hilbert space adjoint \( T^* : H \to H \).

<div class="theorem">
<strong>Theorem 11.4.</strong> Let \( H \) be a Hilbert space and \( T \in B(H) \). Then \( (T^*)^* = T \), \( \|T\| = \|T^*\| \), and \( \|T^* T\| = \|T\|^2 \) (the \( C^* \)-equation). A norm-closed subalgebra of \( B(H) \) that is closed under the adjoint operation is a <strong>concrete \( C^* \)-algebra</strong>.
</div>

<div class="proposition">
<strong>Proposition 11.5.</strong> Let \( H \) be a Hilbert space and \( T \in B(H) \). Then \( (\operatorname{Im} T)^\perp = \ker T^* \). Consequently: (a) \( \overline{\operatorname{Im} T} = (\ker T^*)^\perp \); (b) \( \operatorname{Im} T \) is not dense in \( H \) iff \( \ker T^* \neq \{0\} \).
</div>

## Compact Operators on Banach Spaces

<div class="definition">
<strong>Definition 11.6 (Compact operator).</strong> Let \( X, Y \) be Banach spaces and \( T \in B(X,Y) \). We say \( T \) is <strong>compact</strong> if \( T(X_1) \) (the image of the closed unit ball) is compact in \( Y \). The space of compact operators from \( X \) to \( Y \) is denoted \( K(X, Y) \); we write \( K(X) = K(X,X) \).
</div>

<div class="proposition">
<strong>Proposition 11.7.</strong> Let \( T \in B(X, Y) \). The following are equivalent:
<ol>
<li>\( T \) is compact.</li>
<li>\( T(F) \) is compact in \( Y \) for every bounded \( F \subseteq X \).</li>
<li>Every bounded sequence \( (x_n) \) in \( X \) has a subsequence such that \( (Tx_{n_k}) \) converges in \( Y \).</li>
<li>\( T(X_1) \) is totally bounded in \( Y \).</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem 11.8.</strong> Let \( X, Y \) be Banach spaces. Then \( K(X,Y) \) is a closed subspace of \( B(X,Y) \).
</div>

<div class="theorem">
<strong>Theorem 11.9 (Ideal property).</strong> Let \( M, X, Y, Z \) be Banach spaces, \( R \in B(M, X) \), \( K \in K(X, Y) \), and \( T \in B(Y, Z) \). Then \( TK \in K(X, Z) \) and \( KR \in K(M, Y) \). In particular, \( K(X) \) is a closed two-sided ideal in \( B(X) \).
</div>

<div class="definition">
<strong>Definition 11.10 (Finite rank operator).</strong> An operator \( F \in B(X, Y) \) is <strong>finite rank</strong> if \( \dim F(X) < \infty \). The set of finite rank operators is denoted \( \mathcal{F}(X, Y) \subseteq K(X, Y) \).
</div>

<div class="proposition">
<strong>Proposition 11.11.</strong>
<ol>
<li>Every finite rank operator is compact: \( \mathcal{F}(X,Y) \subseteq K(X,Y) \).</li>
<li>For a Banach space \( X \): \( K(X) = B(X) \) iff \( X \) is finite-dimensional.</li>
<li>If \( K \in K(X,Y) \), the image \( K(X) \) is closed in \( Y \) iff \( \dim K(X) < \infty \).</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem 11.12 (Compactness passes to adjoint).</strong> If \( X, Y \) are Banach spaces and \( K \in K(X, Y) \), then \( K^* \in K(Y^*, X^*) \).
</div>

<div class="theorem">
<strong>Theorem 11.13 (Compact operators on Hilbert spaces).</strong> For \( K \in B(H) \) where \( H \) is a Hilbert space, the following are equivalent:
<ol>
<li>\( K \) is compact.</li>
<li>\( K^* \) is compact.</li>
<li>There exists a sequence \( (F_n)_{n \geq 1} \subseteq \mathcal{F}(H) \) of finite rank operators such that \( K = \lim_n F_n \) in operator norm.</li>
</ol>
</div>

## Normal Operators and the Spectral Theorem

<div class="definition">
<strong>Definition 11.14 (Normal, self-adjoint, unitary).</strong> Let \( H \) be a Hilbert space and \( T \in B(H) \). We say \( T \) is:
<ul>
<li><strong>Normal</strong> if \( TT^* = T^*T \).</li>
<li><strong>Self-adjoint</strong> if \( T^* = T \).</li>
<li><strong>Unitary</strong> if \( T^*T = TT^* = I \).</li>
</ul>
Every self-adjoint operator is normal. The adjoint operation \( * : B(H) \to B(H) \) satisfies: \( (\alpha A)^* = \bar\alpha A^* \), \( (A+B)^* = A^* + B^* \), \( (AB)^* = B^*A^* \), \( (A^*)^* = A \).
</div>

<div class="definition">
<strong>Definition 11.15 (Reducing subspace).</strong> A closed subspace \( M \subseteq H \) is <strong>invariant</strong> for \( T \in B(H) \) if \( TM \subseteq M \). It is <strong>reducing</strong> for \( T \) if \( M \) is invariant for both \( T \) and \( T^* \). When \( M \) reduces \( T \), we have the decomposition \( T = T_1 \oplus T_4 \) (as a block diagonal) with respect to \( H = M \oplus M^\perp \); \( T \) is compact iff both \( T_1, T_4 \) are compact; \( T \) is normal iff both \( T_1, T_4 \) are normal.
</div>

<div class="proposition">
<strong>Proposition 11.16.</strong> Let \( N \in B(H) \) be normal. Then:
<ol>
<li>\( \|Nx\| = \|N^*x\| \) for all \( x \in H \).</li>
<li>For any polynomial \( p(x,y) \) in two non-commuting variables and \( \alpha \in \mathbb{C} \), the kernel \( \ker(p(N, N^*) - \alpha I) \) is a reducing subspace for \( N \).</li>
<li>If \( \alpha \neq \beta \), then \( \ker(N - \alpha I) \perp \ker(N - \beta I) \).</li>
</ol>
</div>

<div class="definition">
<strong>Definition 11.17 (Spectrum).</strong> Let \( X \) be a complex Banach space and \( T \in B(X) \). The <strong>spectrum</strong> of \( T \) is \( \sigma(T) = \{\alpha \in \mathbb{K} : (T - \alpha I) \text{ is not invertible in } B(X)\} \). The <strong>point spectrum</strong> \( \sigma_p(T) \) is the set of eigenvalues of \( T \). We always have \( \sigma_p(T) \subseteq \sigma(T) \).
</div>

For compact operators, the spectrum is almost entirely point spectrum:

If \( T \) is compact, then \( \sigma(T) = \sigma_p(T) \cup \{0\} \). For every \( \varepsilon > 0 \), the set \( \sigma(T) \cap \{z \in \mathbb{C} : |z| > \varepsilon\} \) is finite. Every nonzero eigenvalue has \( \dim \ker(T - \alpha I) < \infty \). Thus the nonzero eigenvalues form a sequence converging to \( 0 \).

<div class="theorem">
<strong>Theorem 11.18 (Decomposition for compact normal operators).</strong> Let \( H \) be a complex Hilbert space and \( N \in B(H) \) compact and normal. If \( \sigma_p(N) = \{\alpha_n : n \in \Omega\} \), then

\[
H = \bigoplus_{n \in \Omega} \ker(N - \alpha_n I).
\]
</div>

<div class="theorem">
<strong>Theorem 11.19 (Spectral Theorem for Compact Normal Operators).</strong> Let \( H \) be a Hilbert space and \( N \in B(H) \) a compact normal operator. Let \( \{\alpha_n : n \in \Omega\} \) be the distinct nonzero eigenvalues of \( N \) and \( P_n \) the orthogonal projection onto \( M_n := \ker(N - \alpha_n I) \) for each \( n \in \Omega \). Then \( P_n P_m = 0 \) for \( n \neq m \) and

\[
N = \sum_{n \in \Omega} \alpha_n P_n,
\]
where the series converges in operator norm. Each \( M_n \) is finite-dimensional, \( |\alpha_n| \to 0 \), and the eigenvalues accumulate only at \( 0 \).
</div>

<div class="corollary">
<strong>Corollary 11.20.</strong> Let \( H \) be a Hilbert space and \( N \in B(H) \) a compact normal operator. There exists an orthonormal basis \( \{e_\alpha\}_{\alpha \in \Lambda} \) for \( H \) such that each \( e_\alpha \) is an eigenvector for \( N \).
</div>

---

## Banach Algebras and the Spectral Calculus

The operator-theoretic results of this chapter established the spectral decomposition for compact normal operators and stated that the spectrum consists of eigenvalues accumulating at zero. Two facts were used without full justification: that \( \sigma(T) \) is always nonempty, and that the spectral radius \( \operatorname{spr}(T) = \sup\{|\lambda| : \lambda \in \sigma(T)\} \) can be computed from norm data alone. Both follow cleanly from the theory of **Banach algebras**, where the resolvent function becomes a vector-valued analytic function and Liouville's theorem delivers the key conclusions.

<div class="definition">
<strong>Definition 11.21 (Banach Algebra).</strong> A <strong>Banach algebra</strong> over \( \mathbb{K} \) is a Banach space \( A \) equipped with an associative bilinear multiplication satisfying the submultiplicativity condition \( \|ab\| \leq \|a\|\,\|b\| \) for all \( a, b \in A \). We call \( A \) <strong>unital</strong> if it contains a multiplicative identity \( \mathbf{1} \) with \( \|\mathbf{1}\| = 1 \).
</div>

The prototype is \( B(X) \) for any Banach space \( X \): multiplication is composition and submultiplicativity is the standard inequality \( \|TS\| \leq \|T\|\,\|S\| \). Further natural examples include: \( C(K) \) (continuous functions on a compact Hausdorff space \( K \)) under pointwise multiplication and the sup norm; the disc algebra \( A(\mathbb{D}) \) from Example 1.B; and \( \ell^1(\mathbb{Z}) \) under convolution. If \( A \) is not unital, one forms the **unitization** \( A^+ = A \times \mathbb{K} \) with multiplication \( (a, \lambda)(b, \mu) = (ab + \mu a + \lambda b, \lambda\mu) \) and identity \( (\mathbf{0}, 1) \); this embeds \( A \) isometrically as a closed ideal of codimension one, and all spectral questions can be formulated in \( A^+ \).

<div class="definition">
<strong>Definition 11.22 (Resolvent, Spectrum, Spectral Radius).</strong> Let \( A \) be a unital Banach algebra and \( a \in A \). The <strong>resolvent set</strong> of \( a \) is

\[
\rho(a) = \{\lambda \in \mathbb{C} : \lambda\mathbf{1} - a \text{ is invertible in } A\},
\]
and the <strong>spectrum</strong> of \( a \) is \( \sigma(a) = \mathbb{C} \setminus \rho(a) \). The <strong>resolvent function</strong> of \( a \) is

\[
R(\cdot, a) : \rho(a) \to A, \qquad R(\lambda, a) = (\lambda\mathbf{1} - a)^{-1}.
\]
The <strong>spectral radius</strong> of \( a \) is \( \operatorname{spr}(a) = \sup\{|\lambda| : \lambda \in \sigma(a)\} \).
</div>

For \( T \in B(X) \), Definition 11.22 recovers Definition 11.17 verbatim. That \( \sigma(a) \) is compact follows from two elementary observations: the set of invertible elements in a Banach algebra is open (if \( a \) is invertible and \( \|b - a\| < \|a^{-1}\|^{-1} \), the Neumann series \( b^{-1} = \sum_{n \geq 0} a^{-1}(I - ba^{-1})^n \) converges), so \( \rho(a) \) is open. Boundedness: \( |\lambda| > \|a\| \) implies \( \lambda\mathbf{1} - a = \lambda(\mathbf{1} - \lambda^{-1}a) \) is invertible by the geometric series \( (\mathbf{1} - \lambda^{-1}a)^{-1} = \sum_{n \geq 0} \lambda^{-n}a^n \) (converging since \( \|\lambda^{-1}a\| < 1 \)), so \( \sigma(a) \subseteq \overline{B}(0, \|a\|) \).

<div class="theorem">
<strong>Theorem 11.23 (Resolvent is Analytic).</strong> For any \( a \) in a unital Banach algebra \( A \), the resolvent function \( R(\cdot, a) : \rho(a) \to A \) is analytic. For \( |\lambda| > \|a\| \), the Neumann expansion

\[
R(\lambda, a) = \sum_{n=0}^{\infty} \frac{a^n}{\lambda^{n+1}}
\]
converges absolutely in \( A \).
</div>

Analyticity follows from the **Common Denominator Formula**: for \( \lambda, \mu \in \rho(a) \),

\[
R(\lambda, a) - R(\mu, a) = (\mu - \lambda)\,R(\lambda, a)\,R(\mu, a),
\]
which gives the Newton quotient \( (R(\lambda, a) - R(\lambda_0, a))/(\lambda - \lambda_0) \to -R(\lambda_0, a)^2 \) as \( \lambda \to \lambda_0 \). The Neumann expansion for \( |\lambda| > \|a\| \) is the formal series for \( \lambda^{-1}(\mathbf{1} - \lambda^{-1}a)^{-1} \).

To prove non-emptiness of the spectrum, we need Liouville's theorem for Banach-space-valued functions.

<div class="theorem">
<strong>Theorem 11.24 (Liouville for Banach-Valued Functions).</strong> Every bounded entire function \( f : \mathbb{C} \to X \) into a Banach space \( X \) is constant.
</div>

<div class="proof">
<strong>Proof.</strong> For each \( x^* \in X^* \), the scalar function \( z \mapsto x^*(f(z)) \) is bounded and entire, hence constant by the classical Liouville theorem. Since \( X^* \) separates points of \( X \) (Hahn-Banach), \( f \) is constant. \( \square \)
</div>

<div class="theorem">
<strong>Theorem 11.25 (Gelfand: Spectrum is Nonempty).</strong> For any element \( a \) of a unital Banach algebra \( A \), \( \sigma(a) \neq \emptyset \).
</div>

<div class="proof">
<strong>Proof.</strong> Suppose for contradiction that \( \sigma(a) = \emptyset \), so \( \rho(a) = \mathbb{C} \) and \( R(\cdot, a) \) is entire. For \( |\lambda| > \|a\| \), the Neumann bound gives

\[
\|R(\lambda, a)\| \leq \sum_{n=0}^\infty \frac{\|a\|^n}{|\lambda|^{n+1}} = \frac{1}{|\lambda| - \|a\|} \xrightarrow{|\lambda| \to \infty} 0.
\]
In particular \( R(\cdot, a) \) is bounded on \( \{|\lambda| > \|a\|\} \), and by continuity it is bounded on the compact disc \( \{|\lambda| \leq \|a\|\} \), so it is bounded on all of \( \mathbb{C} \). By Theorem 11.24, \( R(\cdot, a) \) is constant — but a constant whose norm tends to zero at infinity must be identically zero, contradicting \( R(\lambda, a) = (\lambda\mathbf{1} - a)^{-1} \neq \mathbf{0} \). Hence \( \sigma(a) \neq \emptyset \). \( \square \)
</div>

<div class="theorem">
<strong>Theorem 11.26 (Gelfand-Mazur).</strong> If \( A \) is a unital Banach algebra in which every nonzero element is invertible (a <strong>Banach division algebra</strong>), then there is a unique isometric algebra isomorphism \( A \cong \mathbb{C} \).
</div>

<div class="proof">
<strong>Proof.</strong> By Theorem 11.25, for each \( b \in A \) the spectrum \( \sigma(b) \) is nonempty. Since every nonzero element of \( A \) is invertible, the only noninvertible elements are zero, so \( \lambda\mathbf{1} - b \) is noninvertible iff \( \lambda\mathbf{1} = b \). Thus \( \sigma(b) = \{\lambda_b\} \) for a unique \( \lambda_b \in \mathbb{C} \), and \( b = \lambda_b\,\mathbf{1} \). The map \( \varphi : A \to \mathbb{C} \), \( b \mapsto \lambda_b \), is an algebra isomorphism satisfying \( \|\varphi(b)\| = |\lambda_b| = \|b\| \). \( \square \)
</div>

The Gelfand-Mazur theorem is foundational in C\(^*\)-algebra theory: it implies that the characters (continuous multiplicative linear functionals to \( \mathbb{C} \)) of a commutative unital C\(^*\)-algebra are the algebra's only maximal ideals, and the Gelfand transform identifies the algebra with continuous functions on its character space. Every commutative unital C\(^*\)-algebra is therefore isomorphic to \( C(K) \) for some compact Hausdorff space \( K \).

### The Spectral Radius Formula

<div class="theorem">
<strong>Theorem 11.27 (Polynomial Spectral Mapping Theorem).</strong> Let \( A \) be a unital Banach algebra, \( a \in A \), and \( p \in \mathbb{C}[z] \) a polynomial. Then

\[
\sigma(p(a)) = p(\sigma(a)) := \{p(\lambda) : \lambda \in \sigma(a)\}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> For any \( \alpha \in \mathbb{C} \), factor \( p(z) - \alpha = \gamma(z - \beta_1)\cdots(z - \beta_n) \) in \( \mathbb{C}[z] \). Then \( p(a) - \alpha\mathbf{1} = \gamma(a - \beta_1\mathbf{1})\cdots(a - \beta_n\mathbf{1}) \). Since all factors commute, \( p(a) - \alpha\mathbf{1} \) is noninvertible iff some \( a - \beta_j\mathbf{1} \) is noninvertible, i.e., iff \( \beta_j \in \sigma(a) \) for some \( j \), i.e., iff \( \alpha = p(\beta_j) \in p(\sigma(a)) \). \( \square \)
</div>

The Spectral Radius Formula is the capstone result of this section. It is by no means obvious that \( \lim_{n \to \infty} \|a^n\|^{1/n} \) exists at all — the submultiplicativity of the norm shows only that \( \|a^{n+m}\| \leq \|a^n\|\,\|a^m\| \), which gives subadditivity of \( \log \|a^n\| \) but not convergence of the ratio. The existence of the limit — and its identification as the spectral radius — emerges from the analyticity of the resolvent.

<div class="theorem">
<strong>Theorem 11.28 (Beurling's Spectral Radius Formula).</strong> For any element \( a \) of a Banach algebra \( A \),

\[
\operatorname{spr}(a) = \lim_{n \to \infty} \|a^n\|^{1/n}.
\]
In particular, the limit exists.
</div>

<div class="proof">
<strong>Proof.</strong> We may assume \( A \) is unital.

<em>Lower bound.</em> If \( \lambda \in \sigma(a) \) then \( \lambda^n \in \sigma(a^n) \) for all \( n \geq 1 \): since \( a^n - \lambda^n\mathbf{1} = (a - \lambda\mathbf{1})(a^{n-1} + \lambda a^{n-2} + \cdots + \lambda^{n-1}\mathbf{1}) \) is noninvertible (as \( a - \lambda\mathbf{1} \) is noninvertible and all factors commute). Hence \( \operatorname{spr}(a)^n \leq \operatorname{spr}(a^n) \leq \|a^n\| \), giving

\[
\operatorname{spr}(a) \leq \|a^n\|^{1/n} \qquad \text{for all } n \geq 1.
\]

<em>Upper bound.</em> Fix \( \lambda \in \mathbb{C} \) with \( |\lambda| > \operatorname{spr}(a) \). By Theorem 11.23, the Neumann expansion \( R(\mu, a) = \sum_{n \geq 0} a^n/\mu^{n+1} \) holds for \( |\mu| > \|a\| \). Since \( R(\cdot, a) \) is analytic on the larger open set \( \{|\mu| > \operatorname{spr}(a)\} \), this Laurent series extends to converge absolutely there. In particular, for any \( \varphi \in A^* \), the scalar series \( \sum_{n \geq 0} \varphi(a^n)/\lambda^{n+1} \) converges, so \( \varphi(a^n)/\lambda^{n+1} \to 0 \). Hence the sequence \( \{a^n/\lambda^{n+1}\}_{n \geq 0} \) is pointwise bounded by every functional in \( A^* \). By the Uniform Boundedness Principle (Theorem 1.35), there exists \( M_\lambda > 0 \) with \( \|a^n\| \leq M_\lambda\,|\lambda|^{n+1} \) for all \( n \). Taking \( n \)-th roots:

\[
\limsup_{n \to \infty} \|a^n\|^{1/n} \leq |\lambda|.
\]
Since \( |\lambda| > \operatorname{spr}(a) \) was arbitrary, \( \limsup_n \|a^n\|^{1/n} \leq \operatorname{spr}(a) \).

Combining: \( \operatorname{spr}(a) \leq \liminf_n \|a^n\|^{1/n} \leq \limsup_n \|a^n\|^{1/n} \leq \operatorname{spr}(a) \), so the limit exists and equals \( \operatorname{spr}(a) \). \( \square \)
</div>

The proof beautifully intertwines the Uniform Boundedness Principle (real analysis) with the analyticity of the resolvent (complex analysis): the upper bound is precisely the statement that the Laurent coefficients of an analytic function grow no faster than dictated by the radius of convergence.

<div class="corollary">
<strong>Corollary 11.29.</strong> Let \( H \) be a complex Hilbert space and \( N \in B(H) \) a normal operator. Then \( \operatorname{spr}(N) = \|N\| \).
</div>

<div class="proof">
<strong>Proof.</strong> We claim \( \|N^{2^k}\| = \|N\|^{2^k} \) for all \( k \geq 0 \). The case \( k = 0 \) is trivial. For the inductive step, suppose \( M = N^{2^k} \) is normal. Since \( N \) is normal, \( \|Ny\| = \|N^* y\| \) for all \( y \in H \) (Proposition 11.16), so for any \( x \in H \):

\[
\|M^2 x\| = \|M(Mx)\| = \|M^*(Mx)\| = \|M^*Mx\|.
\]
Therefore \( \|M^2\| = \sup_{\|x\|=1} \|M^*Mx\| \geq \sup_{\|x\|=1} |\langle M^*Mx, x\rangle| = \sup_{\|x\|=1} \|Mx\|^2 = \|M\|^2 \), and the reverse inequality \( \|M^2\| \leq \|M\|^2 \) follows from submultiplicativity. Hence \( \|N^{2^{k+1}}\| = \|N^{2^k}\|^2 = \|N\|^{2^{k+1}} \). By Theorem 11.28,

\[
\operatorname{spr}(N) = \lim_{k \to \infty} \|N^{2^k}\|^{1/2^k} = \lim_{k \to \infty} \|N\|^{2^k / 2^k} = \|N\|. \quad \square
\]
</div>

An operator \( Q \in B(X) \) is called **quasinilpotent** if \( \sigma(Q) = \{0\} \), equivalently \( \operatorname{spr}(Q) = 0 \), equivalently \( \|Q^n\|^{1/n} \to 0 \). Corollary 11.29 says the only quasinilpotent normal operator is \( 0 \): normality forces \( \operatorname{spr}(N) = \|N\| \), so \( \operatorname{spr}(N) = 0 \) implies \( N = 0 \). On general Banach spaces, however, nontrivial quasinilpotent operators abound.

### The Volterra Operator: A Quasinilpotent Example

The most classical quasinilpotent operator is the **Volterra integration operator**

\[
V : C([0,1]) \to C([0,1]), \qquad (Vf)(x) = \int_0^x f(t)\,dt.
\]
Since \( |(Vf)(x)| \leq \int_0^x |f(t)|\,dt \leq \|f\|_\infty \), we have \( \|V\| \leq 1 \). Testing on the constant function \( \mathbf{1} \) shows \( (V\mathbf{1})(x) = x \), so \( \|V\mathbf{1}\|_\infty = 1 = \|\mathbf{1}\|_\infty \), giving \( \|V\| = 1 \).

For the iterated operators, a direct calculation yields \( (V^n f)(x) = \int_0^x k_n(x, y)\,f(y)\,dy \) where the iterated kernel satisfies \( |k_n(x, y)| \leq \frac{(x-y)^{n-1}}{(n-1)!} \) for \( x > y \) and \( 0 \) otherwise. The base case \( k_1(x,y) = \mathbf{1}_{[0,x]}(y) \) satisfies the bound trivially. For the inductive step, \( k_{n+1}(x,y) = \int_0^x k_1(x,t)\,k_n(t,y)\,dt = \int_y^x k_n(t,y)\,dt \), so \( |k_{n+1}(x,y)| \leq \int_y^x \frac{(t-y)^{n-1}}{(n-1)!}\,dt = \frac{(x-y)^n}{n!} \). Therefore,

\[
\|V^n\| = \sup_{\|f\|_\infty = 1} \|V^n f\|_\infty \leq \sup_{x \in [0,1]} \int_0^x |k_n(x,y)|\,dy \leq \frac{1}{(n-1)!}.
\]

By Beurling's formula,

\[
\operatorname{spr}(V) = \lim_{n \to \infty} \|V^n\|^{1/n} \leq \lim_{n \to \infty} \left(\frac{1}{(n-1)!}\right)^{1/n} = 0.
\]

Thus \( V \) is quasinilpotent: \( \sigma(V) = \{0\} \). Every \( \lambda \neq 0 \) lies in the resolvent — the equation \( (\lambda I - V)f = g \) has a unique solution in \( C([0,1]) \) for every \( g \), given explicitly by the Neumann series \( f = \sum_{n \geq 0} \lambda^{-n-1} V^n g \) (converging in operator norm since \( \|V^n\|^{1/n} \to 0 \)). The Volterra operator is one of the simplest examples of an operator whose spectrum is a single point yet which is not zero, illustrating clearly how spectral theory in infinite dimensions diverges from the finite-dimensional eigenvalue picture.

The Spectral Theorem for compact normal operators encompasses the self-adjoint case (Chapter 2) as a special case where all eigenvalues are real. For normal operators, the eigenvalues may be complex, but the eigenspaces for distinct eigenvalues are still orthogonal (Proposition 11.16(3)), and the operator is still completely determined by its spectral data \( \{(\alpha_n, P_n)\} \). This result is the infinite-dimensional analogue of the finite-dimensional theorem that every normal matrix is unitarily diagonalizable.
