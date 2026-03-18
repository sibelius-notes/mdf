---
title: "PMATH 453: Functional Analysis"
prof: "N/A"
---

# PMATH 453: Functional Analysis

Functional analysis is the branch of mathematics concerned with infinite-dimensional vector spaces equipped with analytic structure — norms, inner products, and topologies — together with the linear maps between them. This course develops the three pillars of classical functional analysis: Hilbert space theory (orthogonal decomposition, spectral theory), Banach space theory (the Hahn-Banach theorem, open mapping theorem, closed graph theorem), and general topology (weak topologies, compactness, the Banach-Alaoglu theorem). The prerequisite material from real analysis (PMATH 351) and measure theory (PMATH 450) is reviewed in Chapter 0.

---

## Chapter 0: Prerequisite Review

### Real Analysis (PMATH 351)

#### Cardinality

**Definition 0.1 (Injective, Surjective, Bijective).** Let \( f : X \to Y \). We say \( f \) is **injective** (one-to-one) when for all \( x_1, x_2 \in X \), \( f(x_1) = f(x_2) \implies x_1 = x_2 \). We say \( f \) is **surjective** (onto) when \( \operatorname{Range}(f) = Y \). We say \( f \) is **bijective** when it is both injective and surjective.

**Definition 0.2 (Cardinality).** For sets \( A \) and \( B \):
- We write \( |A| = |B| \) when there exists a bijection \( f : A \to B \).
- We write \( |A| \leq |B| \) when there exists an injection \( f : A \to B \).
- We say \( A \) is **countable** when \( |A| = |\mathbb{N}| \), writing \( |A| = \aleph_0 \). A set is **at most countable** when it is finite or countable. A set is **uncountable** when it is neither finite nor countable.

**Theorem 0.3.** The sets \( \mathbb{N} \times \mathbb{N} \), \( \mathbb{Z} \), and \( \mathbb{Q} \) are all countable. A countable union of countable sets is countable. The set \( \mathbb{R} \) is uncountable, and \( |\mathbb{R}| = 2^{\aleph_0} \).

**Theorem 0.4 (Cantor–Schroeder–Bernstein).** If \( |A| \leq |B| \) and \( |B| \leq |A| \) then \( |A| = |B| \).

**Theorem 0.5 (Cantor).** For every set \( A \), \( |A| < |\mathcal{P}(A)| \). In particular, no set is in bijection with its own power set.

#### Lebesgue Measure

**Definition 0.6 (Outer Measure).** For \( A \subseteq \mathbb{R} \), the **Lebesgue outer measure** of \( A \) is
\[ \lambda^*(A) = \inf \left\{ \sum_{n=1}^\infty |I_n| \;\Big|\; \text{each } I_n \text{ is a bounded open interval and } A \subseteq \bigcup_{n=1}^\infty I_n \right\}. \]

**Definition 0.7 (Lebesgue Measurability).** A set \( A \subseteq \mathbb{R} \) is **(Lebesgue) measurable** when for every \( X \subseteq \mathbb{R} \),
\[ \lambda^*(X) = \lambda^*(X \cap A) + \lambda^*(X \setminus A). \]
When \( A \) is measurable, its **Lebesgue measure** is \( \lambda(A) = \lambda^*(A) \).

**Theorem 0.8 (Properties of Measure).** The collection \( \mathcal{M} \) of measurable subsets of \( \mathbb{R} \) forms a \( \sigma \)-algebra containing all open and closed sets. Measure is countably additive: if \( A_1, A_2, \ldots \) are measurable and pairwise disjoint then \( \lambda(\bigcup_{k=1}^\infty A_k) = \sum_{k=1}^\infty \lambda(A_k) \). If \( A_1 \subseteq A_2 \subseteq \cdots \) then \( \lambda(\bigcup A_n) = \lim_{n\to\infty} \lambda(A_n) \). There exist non-measurable sets.

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

**Definition 1.7 (Convergence and Cauchy Sequences).** Let \( (x_n)_{n \geq 1} \) be a sequence in a metric space \( X \). We say \( x_n \to a \) when
\[ \forall \varepsilon > 0 \; \exists n_0 \in \mathbb{Z}^+ \; \forall k \geq n_0 : d(x_k, a) < \varepsilon. \]
The sequence is **Cauchy** when \( \forall \varepsilon > 0 \; \exists n_0 \; \forall k, \ell \geq n_0 : d(x_k, x_\ell) < \varepsilon \). Every convergent sequence is Cauchy.

**Definition 1.8 (Complete Spaces).** A metric space is **complete** when every Cauchy sequence converges. A complete normed linear space is called a **Banach space**. A complete inner product space is called a **Hilbert space**.

**Definition 1.9 (Dense and Separable).** A subset \( A \subseteq X \) is **dense** in \( X \) when \( \overline{A} = X \). A metric space is **separable** when it contains a countable dense subset.

## Examples of Banach and Hilbert Spaces

**Example 1.10 (\( \mathbb{F}^n \).** The **standard inner product** on \( \mathbb{F}^n \) is \( \langle x, y \rangle = y^* x = \sum_{k=1}^n x_k \overline{y_k} \). This induces the **2-norm** \( \|x\|_2 = (\sum_{k=1}^n |x_k|^2)^{1/2} \). The space \( \mathbb{F}^n \) is a finite-dimensional separable Hilbert space.

**Example 1.11 (\( \ell^2 \).** Let \( \ell^2 = \ell^2(\mathbb{F}) = \{ x \in \mathbb{F}^\omega \mid \sum_{k=1}^\infty |x_k|^2 < \infty \} \). The **standard inner product** is \( \langle x, y \rangle = \sum_{k=1}^\infty x_k \overline{y_k} \), inducing the **2-norm** \( \|x\|_2 = (\sum_{k=1}^\infty |x_k|^2)^{1/2} \). The space \( \ell^2 \) is an infinite-dimensional separable Hilbert space.

**Example 1.12 (\( L^2(A) \).** Let \( A \subseteq \mathbb{R} \) be measurable. Let
\[ L^2(A) = L^2(A, \mathbb{F}) = \left\{ f \in M(A) \Big| \int_A |f|^2 < \infty \right\} \big/ \sim \]
where \( f \sim g \iff f = g \) a.e. The standard inner product is \( \langle f, g \rangle = \int_A f \bar{g} \). For \( a < b \), \( L^2[a,b] \) is an infinite-dimensional separable Hilbert space.

**Example 1.13 (\( p \)-norms on \( \mathbb{F}^n \).** For \( x \in \mathbb{F}^n \), define the **\( p \)-norm** \( \|x\|_p = (\sum_{k=1}^n |x_k|^p)^{1/p} \) for \( 1 \leq p < \infty \), and \( \|x\|_\infty = \max_k |x_k| \) (the **supremum norm**). Each gives a norm, and \( \mathbb{F}^n \) is a finite-dimensional separable Banach space under each \( p \)-norm.

**Example 1.14 (\( \ell^p \) spaces).** For \( x \in \mathbb{F}^\omega \), define \( \|x\|_p = (\sum_{k=1}^\infty |x_k|^p)^{1/p} \) for \( 1 \leq p < \infty \) and \( \|x\|_\infty = \sup_k |x_k| \). Let \( \ell^p = \{ x \in \mathbb{F}^\omega \mid \|x\|_p < \infty \} \). Each \( \ell^p \) is a Banach space; \( \ell^p \) is separable for \( 1 \leq p < \infty \) but \( \ell^\infty \) is not separable.

**Example 1.15 (\( L^p(A) \) spaces).** For measurable \( A \subseteq \mathbb{R} \) and \( 1 \leq p < \infty \), the **\( p \)-norm** of \( f \in M(A) \) is \( \|f\|_p = (\int_A |f|^p)^{1/p} \), and the **essential supremum** is \( \|f\|_\infty = \inf\{ m \geq 0 \mid |f(x)| \leq m \text{ a.e.}\} \). Setting \( L^p(A) = \{ f \in M(A) \mid \|f\|_p < \infty \} / \sim \) with \( f \sim g \iff f = g \) a.e., each \( L^p(A) \) is a Banach space. For \( a < b \), \( L^p[a,b] \) is separable for \( 1 \leq p < \infty \) but \( L^\infty[a,b] \) is not.

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

## Bounded Linear Operators

**Remark 1.20.** When \( U \) and \( V \) are normed linear spaces, a linear map \( F : U \to V \) is also called a **linear operator**. When \( V = \mathbb{F} \), it is called a **linear functional**.

**Definition 1.21 (Operator Norm).** Let \( F : U \to V \) be a linear operator. The **operator norm** of \( F \) is
\[ \|F\| = \sup\{ \|Fx\| \mid x \in U, \|x\| \leq 1 \}. \]
We say \( F \) is **bounded** when \( \|F\| < \infty \). Equivalently,
\[ \|F\| = \sup\{ \|Fx\| \mid x \in U, \|x\| = 1\} = \inf\{ m \geq 0 \mid \|Fx\| \leq m\|x\| \; \forall x \in U\}, \]
and \( \|Fx\| \leq \|F\|\,\|x\| \) for all \( x \in U \). The space of bounded linear operators \( F : U \to V \) is denoted \( B(U,V) \).

**Example 1.22.** When \( U \) and \( V \) are non-trivial finite-dimensional inner product spaces over \( \mathbb{R} \) and \( F : U \to V \) is linear, the maximum of \( \|Fx\| \) over the unit ball is attained and equals \( \sqrt{\lambda} \) where \( \lambda \) is the largest eigenvalue of \( F^* F \).

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

**Definition 1.27.** The **(continuous) dual space** of a normed linear space \( U \) is
\[ U^* = B(U, \mathbb{F}) = \{ f : U \to \mathbb{F} \mid f \text{ is linear with } \|f\| < \infty \}. \]
By Theorem 1.23, \( U^* \) is always a Banach space.

**Theorem 1.28 (Riesz Representation for \( \ell^p \).** Let \( p, q \in [1,\infty] \) with \( \frac{1}{p} + \frac{1}{q} = 1 \).
1. The map \( F : \ell^q \to (\ell^p)^* \) given by \( F(b)(a) = \sum_{k=1}^\infty a_k b_k \) is well-defined, linear, injective, and norm-preserving.
2. When \( p \neq \infty \), \( F \) is also surjective, so \( (\ell^p)^* \cong \ell^q \).

**Proof sketch.** By Hölder's Inequality, \( |F(b)(a)| \leq \|a\|_p \|b\|_q \), so \( F(b) \) is bounded with \( \|F(b)\| \leq \|b\|_q \). Norm preservation (equality) is shown by testing on suitable extremal sequences. Surjectivity for \( 1 \leq p < \infty \): given \( f \in (\ell^p)^* \), set \( b_k = f(e_k) \) and verify \( b \in \ell^q \) and \( F(b) = f \) by approximation with finite sums. \( \square \)

**Remark 1.29.** When \( p = \infty \) and \( q = 1 \), the proof of surjectivity breaks down because finitely-supported truncations do not converge in \( \ell^\infty \). Indeed, \( F : \ell^1 \to (\ell^\infty)^* \) is not surjective (as shown later via the Hahn-Banach Theorem).

**Theorem 1.31 (Riesz Representation for \( L^p \).** Let \( p, q \in [1,\infty] \) with \( \frac{1}{p} + \frac{1}{q} = 1 \), and let \( A \subseteq \mathbb{R} \) be measurable with \( \lambda(A) > 0 \).
1. The map \( F : L^q(A) \to L^p(A)^* \) given by \( F(g)(f) = \int_A fg \) is well-defined, injective, and norm-preserving.
2. When \( 1 \leq p < \infty \), \( F \) is surjective, so \( L^p(A)^* \cong L^q(A) \).

## Uniform Boundedness

**Definition 1.32.** A subset \( A \) of a metric space \( X \) is **nowhere dense** when the interior of its closure is empty, i.e., \( \overline{A}^\circ = \emptyset \). Equivalently, every nonempty open ball contains a nonempty open ball disjoint from \( A \).

**Definition 1.33.** A subset \( A \subseteq X \) is **first category** (or **meagre**) when it is a countable union of nowhere dense sets, and **second category** when it is not first category. A set is **residual** when its complement is first category. Note: \( \mathbb{Q} \) is first category in \( \mathbb{R} \), and \( \mathbb{R} \setminus \mathbb{Q} \) is residual.

**Theorem 1.34 (Baire Category Theorem).** Let \( X \) be a complete metric space.
1. Every first category set in \( X \) has empty interior.
2. Every residual set in \( X \) is dense.
3. Every countable union of closed sets with empty interiors has empty interior.
4. Every countable intersection of dense open sets is dense.

**Proof sketch.** Parts (1) and (2) are equivalent by complementation; (3) and (4) are special cases. For (1): suppose \( A = \bigcup_{n=1}^\infty C_n \) with each \( C_n \) nowhere dense, and assume \( A \) has nonempty interior. Choose an open ball \( B_0 \) inside \( A \), then inductively choose a nested sequence of open balls \( B_n \) with \( \operatorname{diam}(B_n) \to 0 \), \( \overline{B_n} \subseteq B_{n-1} \), and \( \overline{B_n} \cap C_n = \emptyset \). By completeness, the centres of \( B_n \) converge to some \( a \in B_0 \subseteq A \), yet \( a \notin C_n \) for all \( n \), contradicting \( a \in A \). \( \square \)

**Definition 1.37 (\( \sigma \)-algebra).** A **\( \sigma \)-algebra** in a set \( X \) is a collection \( \mathcal{C} \) of subsets of \( X \) such that: \( \emptyset \in \mathcal{C} \); if \( A \in \mathcal{C} \) then \( A^c \in \mathcal{C} \); and if \( A_1, A_2, \ldots \in \mathcal{C} \) then \( \bigcup_{k=1}^\infty A_k \in \mathcal{C} \).

**Theorem 1.40 (Banach-Steinhaus / Uniform Boundedness Principle).** Let \( X \) be a Banach space, \( Y \) a normed linear space, and \( S \) a set of bounded linear maps \( L : X \to Y \). Suppose that for every \( x \in X \) there exists \( m_x \geq 0 \) such that \( \|Lx\| \leq m_x \) for all \( L \in S \). Then there exists \( m \geq 0 \) such that \( \|L\| \leq m \) for all \( L \in S \).

**Proof.** For each \( n \in \mathbb{Z}^+ \), let \( A_n = \{ x \in X \mid \|Lx\| \leq n \; \forall L \in S\} \). Each \( A_n \) is closed, and by hypothesis \( X = \bigcup_{n=1}^\infty A_n \). By the Baire Category Theorem, some \( A_n \) is not nowhere dense, so contains an open ball \( B(a,r) \). For \( \|x\| < r \), we have \( x + a \in B(a,r) \subseteq A_n \), so \( \|L(x)\| \leq \|L(x+a)\| + \|L(a)\| \leq 2n \). Scaling gives \( \|L\| \leq \frac{2n}{r} \) for all \( L \in S \). \( \square \)

**Theorem 1.41 (Condensation of Singularities).** Let \( X \) be a Banach space, \( Y \) a normed space, and \( L_{m,n} : X \to Y \) bounded linear for \( m, n \in \mathbb{Z}^+ \). Suppose that for each \( m \) there exists \( x_m \in X \) with \( \limsup_{n\to\infty} \|L_{m,n}(x_m)\| = \infty \). Then the set
\[ E = \left\{ x \in X \;\Big|\; \limsup_{n\to\infty} \|L_{m,n}(x)\| = \infty \; \forall m \in \mathbb{Z}^+ \right\} \]
is a dense \( G_\delta \) set (hence residual and, by the Baire Category Theorem, dense in \( X \).

**Proof sketch.** Fix \( m \). The sets \( A_\ell = \{ x \mid \|L_{m,n}(x)\| \leq \ell \; \forall n\} \) are closed. If one were not nowhere dense, the Uniform Boundedness Principle would give a bound on \( \|L_{m,n}\| \), contradicting the hypothesis. So all \( A_\ell \) are nowhere dense, making \( B_m = \bigcup_\ell A_\ell \) first category. Then \( E = X \setminus \bigcup_m B_m \) is a countable intersection of dense open sets, hence dense by Baire. \( \square \)

---

# Chapter 2: Hilbert Spaces

## Review of Inner Product Spaces

**Definition 2.1 (Hamel Basis).** A **(Hamel) basis** for a vector space \( V \) over any field \( \mathbb{F} \) is a maximal linearly independent set, or equivalently a linearly independent spanning set. Any two Hamel bases for \( V \) have the same cardinality, which defines the **(Hamel) dimension** \( \dim(V) \).

**Definition 2.2 (Orthogonal and Orthonormal Sets).** Let \( V \) be an inner product space. A subset \( B \subseteq V \) is **orthogonal** when \( \langle u, v \rangle = 0 \) for all distinct \( u, v \in B \), and **orthonormal** when it is orthogonal and every element has norm 1.

**Theorem 2.3.** Let \( V \) be an inner product space with orthonormal set \( B \). Let \( x = \sum_{k=1}^n a_k u_k \) and \( y = \sum_{k=1}^n b_k u_k \) with \( u_k \in B \). Then
\[ \langle x, u_k \rangle = a_k, \quad \langle x, y \rangle = \sum_{k=1}^n a_k \overline{b_k}, \quad \|x\|^2 = \sum_{k=1}^n |a_k|^2. \]
In particular, \( B \) is linearly independent. **Proof omitted.**

**Theorem 2.4 (Gram-Schmidt Procedure).** Let \( V \) be an inner product space of finite or countable Hamel dimension with ordered Hamel basis \( A = (u_1, u_2, u_3, \ldots) \). Define \( v_1 = u_1 \) and for \( n \geq 2 \),
\[ v_n = u_n - \sum_{k=1}^{n-1} \frac{\langle u_n, v_k \rangle}{\|v_k\|^2} v_k. \]
Then \( B = (v_1, v_2, v_3, \ldots) \) is an orthogonal Hamel basis with \( \operatorname{Span}\{v_1, \ldots, v_n\} = \operatorname{Span}\{u_1, \ldots, u_n\} \) for every \( n \). **Proof omitted.**

**Corollary 2.5.** Every inner product space of finite or countable Hamel dimension has an orthonormal Hamel basis.

**Corollary 2.6.** If \( V \) has finite or countable Hamel dimension and \( U \subseteq V \) is a finite-dimensional subspace, then any orthonormal basis for \( U \) extends to an orthonormal basis for \( V \).

**Corollary 2.7.** Inner product spaces of finite or countable Hamel dimension are isomorphic (as inner product spaces) iff they have the same Hamel dimension. In particular, \( \dim(U) = n \) implies \( U \cong \mathbb{F}^n \), and \( \dim(U) = \aleph_0 \) implies \( U \cong \mathbb{F}^\infty \).

**Corollary 2.8.** Every finite-dimensional inner product space is complete. Every inner product space of countable Hamel dimension is **not** complete.

**Definition 2.9 (Direct Sum).** For subspaces \( U, V \subseteq W \), write \( W = U \oplus V \) when \( W = U + V \) and \( U \cap V = \{0\} \), so every \( x \in W \) has a unique decomposition \( x = u + v \).

**Definition 2.10 (Orthogonal Complement).** For a subspace \( U \) of an inner product space \( V \), the **orthogonal complement** is
\[ U^\perp = \{ x \in V \mid \langle x, u \rangle = 0 \; \forall u \in U \}. \]

**Theorem 2.11.** Let \( V \) be an inner product space and \( U \subseteq V \) a subspace. Then:
1. \( U^\perp \) is a subspace.
2. \( U^\perp = \{ x \mid \langle x, u \rangle = 0 \; \forall u \in B\} \) for any basis \( B \) of \( U \).
3. \( U \cap U^\perp = \{0\} \).
4. \( U \subseteq (U^\perp)^\perp \).

When \( U \) is finite-dimensional: additionally \( U \oplus U^\perp = V \) and \( (U^\perp)^\perp = U \). **Proof omitted.**

**Definition 2.12 (Orthogonal Projection).** When \( V = U \oplus U^\perp \), the **orthogonal projection** onto \( U \) is the map \( \operatorname{Proj}_U : V \to U \) sending \( x = u + v \) (with \( u \in U, v \in U^\perp \) to \( \operatorname{Proj}_U(x) = u \).

**Theorem 2.13.** Under the conditions of Definition 2.12, \( \operatorname{Proj}_U(x) \) is the unique point in \( U \) nearest to \( x \). **Proof omitted.**

**Example 2.14.** Let \( U \) be finite-dimensional with orthogonal basis \( \{u_1, \ldots, u_n\} \). Then
\[ \operatorname{Proj}_U(x) = \sum_{k=1}^n \frac{\langle x, u_k \rangle}{\|u_k\|^2} u_k. \]

**Note 2.16.** If \( U \subseteq W \) is a subspace, its closure \( \overline{U} \) is also a subspace. Moreover \( \overline{U}^\perp = U^\perp \). This follows because if \( v \in U^\perp \) and \( u \in \overline{U} \) with \( x_n \to u \) in \( U \), then \( \langle v, u \rangle = \lim_n \langle v, x_n \rangle = 0 \).

## Closed Subspaces of Hilbert Spaces and Orthogonal Projections

**Example 2.17.** Infinite-dimensional subspaces can behave differently from finite-dimensional ones. Let \( V = \mathbb{F}^\infty \) (finitely-supported sequences) with the standard inner product, and \( U = \{ a \in \mathbb{F}^\infty \mid \sum_k a_k = 0 \} \). One computes \( U^\perp = \{0\} \), so \( (U^\perp)^\perp = V \neq U \) and \( V \neq U \oplus U^\perp \). The issue is that \( V \) (having countable Hamel dimension) is not complete.

**Definition 2.18 (Convex Set).** A subset \( S \subseteq V \) is **convex** when for all \( a, b \in S \) and \( 0 \leq t \leq 1 \), \( a + t(b-a) \in S \).

**Theorem 2.19 (Best Approximation in Hilbert Spaces).** Let \( H \) be a Hilbert space and \( S \subseteq H \) nonempty, closed, and convex. Then for every \( a \in H \) there exists a **unique** point \( b \in S \) nearest to \( a \).

**Proof.** Let \( d = \operatorname{dist}(a, S) \). Choose \( x_n \in S \) with \( \|x_n - a\|^2 \to d^2 \). By the Parallelogram Law and convexity (\( \frac{x_k+x_\ell}{2} \in S \) so \( \|\frac{x_k+x_\ell}{2} - a\| \geq d \),
\[ \|x_k - x_\ell\|^2 = 2\|x_k-a\|^2 + 2\|x_\ell-a\|^2 - 4\Big\|\tfrac{x_k+x_\ell}{2}-a\Big\|^2 \leq 2\|x_k-a\|^2 + 2\|x_\ell-a\|^2 - 4d^2 \to 0, \]
so \( (x_n) \) is Cauchy, converging to some \( b \in S \) (since \( S \) is closed and \( H \) is complete). Then \( \|b-a\| = \lim \|x_n-a\| = d \). Uniqueness follows similarly from the Parallelogram Law. \( \square \)

**Theorem 2.20 (Characterization of Closed Subspaces).** Let \( H \) be a Hilbert space and \( U \subseteq H \) a subspace. Then \( U \) is closed if and only if \( H = U \oplus U^\perp \). In this case, \( U^\perp \) is closed, \( (U^\perp)^\perp = U \), and for \( x = u + v \) with \( u \in U, v \in U^\perp \), \( u \) is the unique point in \( U \) nearest \( x \).

**Proof sketch.** (\( \Leftarrow \) If \( H = U \oplus U^\perp \) and \( x_n \in U \) with \( x_n \to a \), write \( a = u + v \); then \( \|v\|^2 = \langle a, v \rangle = \lim \langle x_n, v \rangle = 0 \), so \( a = u \in U \). (\( \Rightarrow \) If \( U \) is closed, apply Theorem 2.19: for each \( x \in H \), the nearest point \( u \in U \) gives \( v = x - u \in U^\perp \) (verified by a variational argument). Uniqueness follows by the same Parallelogram Law argument. \( \square \)

**Definition 2.21.** When \( U \) is a closed subspace of a Hilbert space \( H \), the **orthogonal projection** onto \( U \) is the map \( P : H \to U \) given by \( Px = u \) where \( x = u + v \), \( u \in U \), \( v \in U^\perp \).

## Unordered Series

The classical theory of sequences and series extends naturally to uncountable index sets, which is essential for working with general Hilbert bases.

**Definition 2.22.** A series \( \sum_{k=1}^\infty a_k \) in a normed space \( V \) **converges absolutely** when \( \sum_{k=1}^\infty \|a_k\| < \infty \), and **converges unconditionally** when every rearrangement converges.

**Definition 2.24 (Unordered Series).** Let \( K \) be a nonempty (possibly uncountable) index set and \( (a_k)_{k \in K} \) an indexed set in a normed space \( X \). The **unordered series** \( \sum_{k \in K} a_k \) **converges** to \( s \in X \) when
\[ \forall \varepsilon > 0 \; \exists F \in \operatorname{Fin}(K) \; \forall I \in \operatorname{Fin}(K) \; I \supseteq F \implies \|s_I - s\| < \varepsilon, \]
where \( s_I = \sum_{k \in I} a_k \) for finite \( I \). It **converges absolutely** when \( \sum_{k \in K} \|a_k\| < \infty \).

**Theorem 2.26.** If \( (a_k)_{k \in K} \) with each \( a_k \geq 0 \) has \( \sum_{k \in K} a_k < \infty \), then at most countably many \( a_k \) are nonzero.

**Proof.** For each \( n \), let \( K_n = \{ k \mid a_k \geq \frac{1}{n} \} \). If any \( K_n \) were infinite, the sum would be infinite. Thus every \( K_n \) is finite, and \( \{ k \mid a_k > 0 \} = \bigcup_n K_n \) is at most countable. \( \square \)

**Theorem 2.28 (Cauchy Criterion).** Let \( (a_k)_{k \in K} \) be an indexed set in a normed space \( X \).
1. If \( \sum_{k \in K} a_k \) converges, it is Cauchy.
2. If \( X \) is complete and the series is Cauchy, it converges.

## Formulas Involving Orthonormal Indexed Sets

**Definition 2.29.** An indexed set \( (u_k)_{k \in K} \) in an inner product space is **orthonormal** when \( \|u_k\| = 1 \) for all \( k \) and \( \langle u_k, u_\ell \rangle = 0 \) for \( k \neq \ell \).

**Theorem 2.30.** Let \( H \) be a Hilbert space, \( (u_k)_{k \in K} \) orthonormal, \( B = \{u_k\} \), and \( x, y \in \overline{\operatorname{Span}\, B} \). Let \( a_k = \langle x, u_k \rangle \), \( b_k = \langle y, u_k \rangle \). Then:
\[ (1)\; \sum_{k \in K} a_k u_k = x, \qquad (2)\; \sum_{k \in K} |a_k|^2 = \|x\|^2, \qquad (3)\; \sum_{k \in K} a_k \overline{b_k} = \langle x, y \rangle. \]

**Theorem 2.31.** Let \( (u_k)_{k \in K} \) be orthonormal in a Hilbert space \( H \) and let \( (c_k)_{k \in K} \) be scalars.
1. If \( \sum_{k \in K} c_k u_k \) converges to \( x \), then \( x \in \overline{\operatorname{Span}\, B} \) and \( c_k = \langle x, u_k \rangle \).
2. \( \sum_{k \in K} c_k u_k \) converges in \( H \) if and only if \( \sum_{k \in K} |c_k|^2 < \infty \).

**Theorem 2.32 (Bessel's Inequality).** Let \( (u_k)_{k \in K} \) be orthonormal in an inner product space \( V \). For all \( x \in V \),
\[ \sum_{k \in K} |\langle x, u_k \rangle|^2 \leq \|x\|^2. \]

**Proof.** For any finite \( F \subseteq K \) and \( w_F = \sum_{k \in F} \langle x, u_k \rangle u_k \),
\[ 0 \leq \|x - w_F\|^2 = \|x\|^2 - \sum_{k \in F} |\langle x, u_k \rangle|^2. \]
Taking the supremum over all finite \( F \) gives the inequality. \( \square \)

**Theorem 2.33 (Orthogonal Projection Formula).** Let \( H \) be a Hilbert space, \( (u_k)_{k \in K} \) orthonormal, \( B = \{u_k\} \), \( U = \overline{\operatorname{Span}\, B} \). The orthogonal projection \( P : H \to U \) is given by
\[ Px = \sum_{k \in K} \langle x, u_k \rangle u_k, \]
and \( \|P\| = 1 \).

**Proof.** By Bessel's Inequality, \( \sum_k |\langle x, u_k \rangle|^2 \leq \|x\|^2 < \infty \), so by Theorem 2.31(2) the sum converges, and by Theorem 2.31(1) it lies in \( U \). For any \( u_k \), \( \langle Px - x, u_k \rangle = \langle x, u_k \rangle - \langle x, u_k \rangle = 0 \), so \( x - Px \in U^\perp \). Thus \( P \) is the orthogonal projection. Since \( \|Px\|^2 = \sum_k |\langle x, u_k \rangle|^2 \leq \|x\|^2 \), we have \( \|P\| \leq 1 \); and \( P(u_k) = u_k \) gives \( \|P\| \geq 1 \). \( \square \)

## Hilbert Bases

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

**Example 2.39-2.40 (\( \ell^2(K) \).** For any nonempty set \( K \), define \( \ell^2(K, \mathbb{F}) = \{ (c_k)_{k \in K} \mid \sum_{k \in K} |c_k|^2 < \infty \} \) with inner product \( \langle a, b \rangle = \sum_{k \in K} a_k \overline{b_k} \). The standard basis vectors \( (e_\ell)_{\ell \in K} \) form a Hilbert basis. Any Hilbert space over \( \mathbb{F} \) with \( \dim H = |K| \) is isomorphic to \( \ell^2(K, \mathbb{F}) \). In particular, every separable Hilbert space is isomorphic to \( \ell^2 \); for example, \( L^2[a,b] \cong \ell^2 \).

## The Dual Space and the Adjoint Map

**Theorem 2.41 (Riesz Representation Theorem for Hilbert Spaces).** Let \( H \) be a Hilbert space over \( \mathbb{F} \). The map \( \varphi : H \to H^* \) given by \( \varphi(u)(x) = \langle x, u \rangle \) is a bijective norm-preserving map that is linear when \( \mathbb{F} = \mathbb{R} \) and conjugate-linear when \( \mathbb{F} = \mathbb{C} \).

**Proof.** For \( u \in H \), write \( \varphi_u = \varphi(u) \). Then \( \varphi_u(u) = \|u\|^2 \) gives \( \|\varphi_u\| \geq \|u\| \), and Cauchy-Schwarz gives \( |\varphi_u(x)| \leq \|x\|\,\|u\| \) so \( \|\varphi_u\| \leq \|u\| \). Hence \( \varphi \) is norm-preserving (thus injective). For surjectivity: let \( f \in H^* \), \( f \neq 0 \). Then \( U = \ker(f) \) is a closed proper subspace of \( H \), so \( U^\perp \neq \{0\} \). Choose \( v \in U^\perp \) with \( \|v\| = 1 \) and set \( u = \overline{f(v)} v \); then \( \varphi_u = f \). \( \square \)

**Definition 2.42.** Using the bijection \( \varphi \) of Theorem 2.41, we define an inner product on \( H^* \) by \( \langle f, g \rangle_{H^*} = \langle \varphi^{-1}(g), \varphi^{-1}(f) \rangle_H \) (note the reversal for conjugate-linearity).

**Definition 2.43 (Adjoint).** When \( H \) and \( K \) are Hilbert spaces and \( F \in B(H,K) \), the **(Hilbert space) adjoint** of \( F \) is the unique map \( F^* : K \to H \) satisfying
\[ \langle Fx, y \rangle = \langle x, F^* y \rangle \quad \forall x \in H, y \in K. \]
We have \( \|F^*\| = \|F\| \).

## Weak Convergence

**Definition 2.45.** Let \( V \) be an inner product space and \( (u_n) \) a sequence in \( V \). We say \( u_n \to w \) **weakly** when \( \langle u_n, x \rangle \to \langle w, x \rangle \) for all \( x \in V \).

**Note 2.46.** Strong convergence (\( \|u_n - w\| \to 0 \) implies weak convergence, but not conversely. For example, any orthonormal sequence \( (u_n) \) in a Hilbert space converges weakly to \( 0 \) (by Parseval's identity) but does not converge strongly.

**Theorem 2.47.** Every bounded sequence in a Hilbert space has a weakly convergent subsequence.

**Proof sketch.** When \( H \) is separable with dense set \( \{a_1, a_2, \ldots\} \): given a bounded sequence \( (u_n) \), use a diagonal subsequence argument to extract a subsequence \( (v_k) \) such that \( \langle v_k, a_m \rangle \) converges for every \( m \). The functional \( f(x) = \lim_k \langle v_k, x \rangle \) is bounded; by the Riesz Representation Theorem there exists \( w \in H \) with \( f(x) = \langle x, w \rangle \), and \( v_k \to w \) weakly. For non-separable \( H \), the sequence lies in a separable subspace, and the result reduces to the separable case. \( \square \)

## The Spectral Theorem for Compact Self-Adjoint Operators

**Definition 2.48.** A **compact operator** on a Hilbert space \( H \) is a linear map \( F : H \to H \) that sends weakly convergent sequences to (strongly) convergent sequences: \( u_n \to w \) weakly \( \implies Fu_n \to Fw \) in norm.

**Note 2.49.** Every compact operator is continuous (since strong convergence implies weak convergence), but not conversely. The identity on an infinite-dimensional Hilbert space is continuous but not compact, since any orthonormal sequence converges weakly to \( 0 \) but not in norm.

**Definition 2.50.** A **self-adjoint operator** on \( H \) is a continuous \( F : H \to H \) with \( F^* = F \), i.e., \( \langle Fx, y \rangle = \langle x, Fy \rangle \) for all \( x, y \in H \).

**Theorem 2.51.** Let \( F \) be a continuous self-adjoint operator on \( H \). Then:
1. \( \langle Fu, u \rangle \in \mathbb{R} \) for all \( u \). In particular, all eigenvalues of \( F \) are real.
2. \( \|F\| = \sup\{ |\langle Fu, u \rangle| \mid \|u\| = 1 \} \). Every eigenvalue satisfies \( |\lambda| \leq \|F\| \).

**Proof of (1).** \( \langle Fu, u \rangle = \langle u, F^*u \rangle = \langle u, Fu \rangle = \overline{\langle Fu, u \rangle} \). For (2): let \( M = \sup\{\langle Fu, u \rangle \mid \|u\| = 1\} \). Cauchy-Schwarz gives \( M \leq \|F\| \). For the reverse, use a polarization-type identity valid when \( \langle Fu, v \rangle \in \mathbb{R} \):
\[ \langle Fu, v \rangle = \tfrac{1}{4}(\langle F(u+v), u+v \rangle - \langle F(u-v), u-v \rangle) \leq \tfrac{M}{2}(\|u\|^2 + \|v\|^2), \]
so choosing \( v = Fu/\|Fu\| \) (when \( Fu \neq 0 \) gives \( \|Fu\| \leq M \). \( \square \)

**Example 2.52.** The multiplication operator \( F : L^2[0,1] \to L^2[0,1] \), \( F(f)(x) = xf(x) \), is self-adjoint and continuous with no eigenvalues.

**Theorem 2.53.** Let \( F \) be a compact self-adjoint operator on a Hilbert space \( H \) with \( F \neq 0 \). Then \( F \) has an eigenvalue \( \lambda \) with \( |\lambda| = \|F\| \).

**Proof.** By Theorem 2.51, either \( \|F\| = \sup\{\langle Fu, u \rangle \mid \|u\|=1\} \) or its negative is the infimum. WLOG suppose the former; choose \( (u_n) \) with \( \|u_n\| = 1 \) and \( \langle Fu_n, u_n \rangle \to \lambda = \|F\| \). Then
\[ \|Fu_n - \lambda u_n\|^2 = \|Fu_n\|^2 - 2\lambda\langle Fu_n, u_n \rangle + \lambda^2 \leq \|F\|^2 - 2\lambda\langle Fu_n, u_n \rangle + \lambda^2 \to 0. \]
Since \( F \) is compact and \( (u_n) \) is bounded, a subsequence \( (v_k) \) gives \( Fv_k \to Fw \) weakly. Then \( \lambda v_k \to Fw \) in norm. Applying \( F \): \( F(Fw) = \lambda Fw \), so \( \lambda \) is an eigenvalue with eigenvector \( Fw \). \( \square \)

**Note 2.54 (Useful Properties for the Spectral Theorem).**
1. For continuous \( F \), the eigenspace \( E_\lambda = \ker(F - \lambda I) \) is closed.
2. For self-adjoint \( F \), eigenspaces for distinct eigenvalues are orthogonal.
3. If \( U \subseteq H \) is a closed subspace, the orthogonal projection \( P \) onto \( U \) is self-adjoint and (when \( U \) is finite-dimensional) compact.
4. If \( \lambda \) is a nonzero eigenvalue of a self-adjoint \( F \) with projection \( P \) onto \( E_\lambda \), then \( \lambda P = FP = PF \).
5. For compact \( F \), any eigenspace \( E_\lambda \) for \( \lambda \neq 0 \) is finite-dimensional (else choose an orthonormal sequence \( (e_n) \subset E_\lambda \); then \( e_n \to 0 \) weakly but \( Fe_n = \lambda e_n \not\to 0 \), contradicting compactness).

**Theorem 2.55 (Spectral Theorem for Compact Self-Adjoint Operators).** Let \( H \) be a Hilbert space and \( F : H \to H \) a nonzero compact self-adjoint operator. Then:
- The set of nonzero eigenvalues is at most countable.
- Each nonzero eigenspace \( E_{\lambda_k} \) is finite-dimensional.
- If there are finitely many nonzero eigenvalues \( \lambda_1, \ldots, \lambda_n \):
\[ F = \sum_{k=1}^n \lambda_k P_{\lambda_k}, \]
where \( P_{\lambda_k} \) is the orthogonal projection onto \( E_{\lambda_k} \).
- If there are countably many eigenvalues, they can be arranged as \( \lambda_1, \lambda_2, \ldots \) in nonincreasing order of absolute value, with \( \lambda_n \to 0 \), and
\[ F = \sum_{k=1}^\infty \lambda_k P_{\lambda_k} \]
in the operator norm topology.

**Proof sketch.** Non-compactness of infinite-dimensional eigenspaces follows from Note 2.54(5). Using Theorem 2.53 iteratively, one extracts eigenvalues \( \lambda_1, \lambda_2, \ldots \) with \( |\lambda_k| = \|F_k\| \) where \( F_{k+1} = F_k - \lambda_k P_{\lambda_k} \). The eigenvalues are in nonincreasing order. If the process is infinite: suppose \( |\lambda_n| \to r > 0 \); picking unit eigenvectors \( u_n \in E_{\lambda_n} \) (which are mutually orthogonal) yields \( \|Fu_{n_k} - Fu_{n_\ell}\|^2 = \lambda_{n_k}^2 + \lambda_{n_\ell}^2 \geq 2r^2 \), contradicting compactness of \( F \). So \( \lambda_n \to 0 \). The completeness of the spectral expansion follows by showing \( \|F_{n+1}\| = |\lambda_{n+1}| \to 0 \) in operator norm. \( \square \)

---

# Chapter 3: Banach Spaces

## Finite-Dimensional Normed Linear Spaces

**Example 3.1.** For non-trivial finite-dimensional inner product spaces \( U, V \) over \( \mathbb{R} \) and a linear map \( F : U \to V \), the maximum of \( \|Fx\| \) on the closed unit ball is attained, and \( \|F\| = \sqrt{\lambda} \) where \( \lambda \) is the largest eigenvalue of \( F^*F \).

**Theorem 3.2.** Let \( U \) be an \( n \)-dimensional normed linear space over \( \mathbb{R} \), with basis \( \{u_1, \ldots, u_n\} \) and associated isomorphism \( F : \mathbb{R}^n \to U \), \( F(t) = \sum_k t_k u_k \). Then both \( F \) and \( F^{-1} \) are Lipschitz continuous.

**Proof.** Setting \( M = (\sum_k \|u_k\|^2)^{1/2} \), Cauchy-Schwarz gives \( \|F(t)\| \leq M\|t\| \), so \( F \) is Lipschitz. The map \( G = \|\cdot\| \circ F : \mathbb{R}^n \to \mathbb{R} \) is continuous, so attains its minimum \( m > 0 \) on the compact unit sphere. For all \( t \in \mathbb{R}^n \), \( \|F(t)\| \geq m\|t\| \), which gives \( \|F^{-1}(x)\| \leq \frac{1}{m}\|x\| \) and Lipschitz continuity of \( F^{-1} \). \( \square \)

**Corollary 3.3.** When \( U \) and \( V \) are finite-dimensional normed spaces, every linear map \( F : U \to V \) is Lipschitz continuous.

**Corollary 3.4.** On a finite-dimensional vector space, any two norms induce the same topology, and convergence in one norm is equivalent to convergence in any other.

**Definition 3.5.** For a metric space \( Y \) and \( \emptyset \neq X \subseteq Y \), the **distance** from \( y \in Y \) to \( X \) is \( d(y, X) = \inf\{d(y,x) \mid x \in X\} \). When \( X \) is compact, the infimum is attained.

**Theorem 3.6.** Let \( W \) be a normed space and \( U \subseteq W \) finite-dimensional. Then for every \( w \in W \) there exists \( u \in U \) with \( d(w,u) = d(w,U) \).

**Lemma 3.7 (Riesz's Lemma).** Let \( W \) be a normed space and \( U \subsetneq W \) a proper closed subspace. For every \( 0 < r < 1 \) there exists \( w \in W \setminus U \) with \( \|w\| = 1 \) and \( d(w, U) \geq r \).

**Proof.** Choose \( v \in W \setminus U \). Let \( d = d(v, U) > 0 \). Choose \( u \in U \) with \( \|v-u\| < d/r \). Let \( w = (v-u)/\|v-u\| \). For any \( x \in U \), \( \|x - w\| = \|v - u\|^{-1} \cdot \|v - (u + \|v-u\|x)\| \geq d/(d/r) = r \). \( \square \)

**Theorem 3.8 (Riesz's Theorem).** A normed linear space \( U \) is finite-dimensional if and only if its closed unit ball is compact.

**Proof.** If \( U \) is finite-dimensional: via the isomorphism \( F : \mathbb{R}^n \to U \) of Theorem 3.2, the preimage of \( B(0,1) \) under \( F \) is closed and bounded in \( \mathbb{R}^n \), hence compact; since \( F \) is a homeomorphism, \( B(0,1) \) is compact. If \( U \) is infinite-dimensional: inductively apply Lemma 3.7 to produce a sequence \( (u_n) \) with \( \|u_n\| = 1 \) and \( \|u_n - u_k\| \geq \frac{1}{2} \) for \( k < n \), so \( B(0,1) \) has no convergent subsequence. \( \square \)

## The Hahn-Banach Theorem

**Definition 3.9.** A **seminorm** on a vector space \( W \) is a subadditive homogeneous map \( p : W \to \mathbb{R} \): \( p(x+y) \leq p(x)+p(y) \) and \( p(tx) = |t|p(x) \).

**Theorem 3.10 (Hahn-Banach, Real Version).** Let \( W \) be a real vector space, \( U \subseteq W \) a subspace, \( p : W \to \mathbb{R} \) subadditive and positively homogeneous. Every linear \( f : U \to \mathbb{R} \) with \( f(x) \leq p(x) \) for all \( x \in U \) extends to a linear \( g : W \to \mathbb{R} \) with \( g(x) \leq p(x) \) for all \( x \in W \).

**Proof sketch.** One shows that an extension by one dimension is always possible: for \( w \in W \setminus U \) and \( V = U + \operatorname{Span}\{w\} \), the value \( r = g(w) \) must be chosen to satisfy \( -p(-y-w) - f(y) \leq r \leq p(x+w) - f(x) \) for all \( x, y \in U \); subadditivity ensures this interval is nonempty. An application of Zorn's Lemma on the poset of dominated extensions then produces a maximal (hence total) extension. \( \square \)

**Theorem 3.11 (Hahn-Banach, Complex Version).** Let \( W \) be a vector space over \( \mathbb{F} \), \( U \subseteq W \) a subspace, and \( p \) a seminorm on \( W \). Every linear \( f : U \to \mathbb{F} \) with \( |f(x)| \leq p(x) \) for all \( x \in U \) extends to a linear \( g : W \to \mathbb{F} \) with \( |g(x)| \leq p(x) \) for all \( x \in W \).

**Proof.** The real case is Theorem 3.10. For \( \mathbb{F} = \mathbb{C} \): write \( f = u + iv \) where \( u, v : U \to \mathbb{R} \). Note \( f(x) = u(x) - iu(ix) \). Extend \( u \) to \( w : W \to \mathbb{R} \) by the real theorem, then set \( g(x) = w(x) - iw(ix) \). One verifies \( g \) is \( \mathbb{C} \)-linear and \( |g(x)| = \operatorname{Re}(g(e^{-i\theta}x)) = w(e^{-i\theta}x) \leq p(e^{-i\theta}x) = p(x) \). \( \square \)

**Theorem 3.12 (Hahn-Banach for Bounded Functionals).** Let \( W \) be a normed space and \( U \subseteq W \) a subspace. Every \( f \in U^* \) extends to \( g \in W^* \) with \( \|g\| = \|f\| \).

**Proof.** Apply Theorem 3.11 with \( p(x) = \|f\|\,\|x\| \). \( \square \)

**Corollary 3.13.** For any \( 0 \neq w \in W \), there exists \( g \in W^* \) with \( g(w) = \|w\| \) and \( \|g\| = 1 \).

**Proof.** Define \( f : \operatorname{Span}\{w\} \to \mathbb{F} \) by \( f(tw) = t\|w\| \), so \( \|f\| = 1 \). Extend by Theorem 3.12. \( \square \)

**Corollary 3.14.** Let \( U \subsetneq W \) be a proper closed subspace and \( w \in W \setminus U \). There exists \( g \in W^* \) with \( \|g\| = 1 \), \( g(w) = d(w, U) \), and \( g(u) = 0 \) for all \( u \in U \).

**Corollary 3.15.** If \( W^* \) is separable then \( W \) is separable.

**Proof.** Let \( (f_n) \) be dense in \( W^* \). For each \( n \), pick \( u_n \in W \) with \( \|u_n\| = 1 \) and \( f_n(u_n) > \frac{1}{2}\|f_n\| \). Claim \( \overline{\operatorname{Span}\{u_n\}} = W \): if not, Corollary 3.14 gives \( g \in W^* \) with \( \|g\|=1 \) vanishing on all \( u_n \). Since \( (f_n) \) is dense, choose \( n \) with \( \|f_n - g\| < \frac{1}{3} \). Then \( \frac{1}{3} < \frac{1}{2}\|f_n\| < f_n(u_n) = (f_n-g)(u_n) \leq \|f_n-g\| < \frac{1}{3} \), a contradiction. \( \square \)

**Note 3.16.** Since \( \ell^1 \) is separable but \( \ell^\infty \) is not, Corollary 3.15 implies \( F : \ell^1 \to (\ell^\infty)^* \) of Theorem 1.28 is not surjective (for if it were, \( (\ell^\infty)^* \cong \ell^1 \) would be separable, forcing \( \ell^\infty \) to be separable).

## The Hahn-Banach Separation Theorem

**Definition 3.17.** A point \( a \in A \) in a real vector space is an **internal point** of \( A \) when for every \( u \in U \) there exists \( r > 0 \) with \( a + tu \in A \) for all \( t \in (-r,r) \). The set of internal points is the **core** of \( A \), denoted \( \operatorname{Core}(A) \). The interior of \( A \) is always contained in its core.

**Definition 3.18 (Minkowski Functional).** Let \( U \) be a real vector space and \( A \subseteq U \) convex with \( 0 \in \operatorname{Core}(A) \). The **Minkowski functional** of \( A \) is
\[ p_A(x) = \inf\left\{ r > 0 \;\Big|\; \tfrac{1}{r}x \in A \right\}. \]

**Theorem 3.19.** The Minkowski functional of a convex set with \( 0 \) in its core is positively homogeneous and subadditive.

**Theorem 3.20 (Hahn-Banach Separation Theorem).** Let \( U \) be a real vector space and \( A, B \subseteq U \) disjoint nonempty convex sets with \( \operatorname{Core}(A) \neq \emptyset \). Then there exists a nonzero linear \( f : U \to \mathbb{R} \) with \( f(x) \leq f(y) \) for all \( x \in A \), \( y \in B \).

**Proof sketch.** Let \( C = A - B - a + b \) (translating so \( 0 \in \operatorname{Core}(C) \) and \( b-a \notin C \). The Minkowski functional \( p \) of \( C \) satisfies \( p(b-a) \geq 1 \). Define \( f(t(b-a)) = t \cdot p(b-a) \); this satisfies \( f \leq p \) on \( \operatorname{Span}\{b-a\} \). Extend by Theorem 3.10. For \( x \in A \), \( y \in B \): \( x - y - a + b \in C \) so \( p(x-y-a+b) \leq 1 \leq p(b-a) \), yielding \( f(x) \leq f(y) \). \( \square \)

## The Riesz Representation Theorem for \( C[a,b]^* \)

**Definition 3.22 (Bounded Variation).** For \( f : [a,b] \to \mathbb{R} \) and a partition \( P = (x_0, \ldots, x_n) \), define \( V(f,P) = \sum_{k=1}^n |f(x_k) - f(x_{k-1})| \). The **total variation** is \( V(f,[a,b]) = \sup_P V(f,P) \). We say \( f \) is of **bounded variation** when \( V(f,[a,b]) < \infty \); the space is denoted \( BV[a,b] \).

**Definition 3.24 (Riemann-Stieltjes Integral).** For \( g \in BV[a,b] \) and \( f \in C[a,b] \), the **Riemann-Stieltjes integral** is
\[ \int_a^b f\,dg = \lim_{\|P\|\to 0} \sum_{k=1}^n f(t_k)(g(x_k) - g(x_{k-1})). \]
One can show this limit exists and satisfies \( |\int_a^b f\,dg| \leq V(g,[a,b]) \cdot \|f\|_\infty \).

**Theorem 3.26 (Riesz Representation for \( C[a,b]^* \).** For every \( L \in C[a,b]^* \) there exists \( g \in BV[a,b] \) with \( g(a) = 0 \), \( V(g,[a,b]) = \|L\| \), and
\[ L(f) = \int_a^b f\,dg \quad \forall f \in C[a,b]. \]

**Proof sketch.** Extend \( L \) to \( M \in B[a,b]^* \) with \( \|M\| = \|L\| \). Define \( g(x) = M(s_x) \) where \( s_x \) is the step function \( s_x(t) = \mathbf{1}_{t \leq x} \). Show \( g \in BV[a,b] \) by estimating variation against \( \|M\| \). For continuous \( f \), approximate by step functions \( f_n \) in the supremum norm; then \( M(f) = \lim M(f_n) = \lim \sum f(x_k)(g(x_k)-g(x_{k-1})) = \int_a^b f\,dg \). \( \square \)

## The Open Mapping Theorem and the Closed Graph Theorem

**Theorem 3.27 (Open Mapping Theorem).** Let \( U \) and \( V \) be Banach spaces and \( F \in B(U,V) \) surjective. Then \( F \) is open: for every open \( A \subseteq U \), \( F(A) \) is open in \( V \).

**Proof.** Step 1: Show that for all \( R > 0 \) there exists \( r > 0 \) with \( B(0,r) \subseteq \overline{F(B(0,R))} \). Since \( V = \bigcup_n \overline{F(B(0,n))} \) and \( V \) is complete, Baire gives some \( \overline{F(B(0,n))} \) with nonempty interior; by scaling \( \overline{F(B(0,1))} \) has nonempty interior. Find \( c, r \) with \( B(c,2r) \subseteq \overline{F(B(0,1))} \); by symmetry \( B(0,r) \subseteq \overline{F(B(0,2))} \).

Step 2: Lift the closure: show \( B(0,r) \subseteq F(B(0,1)) \) by an iterative approximation. Given \( y \in B(0,r) \), find \( x_1 \in B(0,\frac{1}{2}) \) with \( \|y - Fx_1\| < \frac{r}{2} \), then \( x_2 \in B(0,\frac{1}{4}) \) with \( \|y - F(x_1+x_2)\| < \frac{r}{4} \), etc. The series \( u = \sum x_k \) converges in \( U \) (since \( \sum \|x_k\| < 1 \) and \( Fu = y \).

Step 3: For open \( A \subseteq U \) and \( v = Fu \in F(A) \) with \( B(u,R) \subseteq A \), find \( r \) with \( B(0,r) \subseteq F(B(0,R)) \); then \( B(v,r) \subseteq F(A) \). \( \square \)

**Definition 3.28 (Equivalent Norms).** Two norms on a vector space \( U \) are **equivalent** when they induce the same topology, i.e., when there exist \( \ell, m > 0 \) with \( \|x\|_2 \leq \ell\|x\|_1 \) and \( \|x\|_1 \leq m\|x\|_2 \) for all \( x \).

**Corollary 3.29.** Let \( U \) be complete under norms \( \|\cdot\|_1 \) and \( \|\cdot\|_2 \). If \( \|x\|_2 \leq \ell\|x\|_1 \) for all \( x \), then the two norms are equivalent.

**Proof.** The identity \( I : (U,\|\cdot\|_1) \to (U,\|\cdot\|_2) \) is continuous (bounded) and surjective, hence open by the Open Mapping Theorem. So its inverse is also continuous. \( \square \)

**Definition 3.31 (Closed Graph).** A linear map \( F : U \to V \) has a **closed graph** when for every sequence \( (x_n) \), if \( x_n \to a \) in \( U \) and \( Fx_n \to b \) in \( V \), then \( b = Fa \).

**Theorem 3.32 (Closed Graph Theorem).** Let \( U \) and \( V \) be Banach spaces and \( F : U \to V \) linear. If \( F \) has a closed graph, then \( F \) is continuous (bounded).

**Proof.** Define a second norm on \( U \) by \( \|x\|_3 = \|x\|_1 + \|Fx\|_2 \). If \( (x_n) \) is Cauchy in \( \|\cdot\|_3 \), it is Cauchy in both \( \|\cdot\|_1 \) and \( \|\cdot\|_2 \), so \( x_n \to a \) and \( Fx_n \to b \). Since \( F \) has closed graph, \( b = Fa \), and \( x_n \to a \) in \( \|\cdot\|_3 \). So \( (U, \|\cdot\|_3) \) is complete. Since \( \|x\|_1 \leq \|x\|_3 \), Corollary 3.29 gives \( \ell \) with \( \|x\|_3 \leq \ell\|x\|_1 \). Then \( \|Fx\|_2 \leq \|x\|_3 \leq \ell\|x\|_1 \), so \( F \) is bounded. \( \square \)

---

# Chapter 4: Topology

## Topological Spaces and Bases

**Definition 4.1 (Topology).** A **topology** on a set \( X \) is a collection \( \mathcal{T} \) of subsets of \( X \) (the **open sets**) such that: (1) \( \emptyset, X \in \mathcal{T} \); (2) \( \mathcal{T} \) is closed under arbitrary unions; (3) \( \mathcal{T} \) is closed under finite intersections. A subset \( A \subseteq X \) is **closed** when \( A^c \in \mathcal{T} \). The **interior** \( A^\circ \) is the largest open set contained in \( A \); the **closure** \( \overline{A} \) is the smallest closed set containing \( A \).

A topology \( \mathcal{S} \) is **coarser** than \( \mathcal{T} \) (and \( \mathcal{T} \) is **finer**) when \( \mathcal{S} \subseteq \mathcal{T} \). Given any collection \( \mathcal{S} \) of subsets of \( X \), there is a unique coarsest topology containing \( \mathcal{S} \) (the **topology generated by** \( \mathcal{S} \), consisting of arbitrary unions of finite intersections of elements of \( \mathcal{S} \).

A **basis** for a topology on \( X \) is a collection \( \mathcal{B} \) with: (1) \( X = \bigcup \mathcal{B} \); (2) for all \( U, V \in \mathcal{B} \) and \( a \in U \cap V \), there exists \( W \in \mathcal{B} \) with \( a \in W \subseteq U \cap V \).

**Theorem 4.2.** Let \( \mathcal{B} \) be a basis generating topology \( \mathcal{T} \). Then \( A \in \mathcal{T} \) iff for every \( a \in A \) there exists \( U \in \mathcal{B} \) with \( a \in U \subseteq A \), equivalently iff \( A \) is a union of elements of \( \mathcal{B} \).

**Example 4.3.** In a metric space \( X \), the collection of open balls \( \{B(a,r) \mid a \in X, r > 0\} \) is a basis for the metric topology.

**Theorem 4.4.** Let \( X \) be a topological space with basis \( \mathcal{B} \), and \( A \subseteq X \). Then \( a \in \overline{A} \) if and only if \( A \cap U \neq \emptyset \) for every \( U \in \mathcal{B} \) with \( a \in U \).

**Example 4.5 (Subspace Topology).** When \( X \subseteq Y \) and \( Y \) has topology \( \mathcal{T} \), the **subspace topology** on \( X \) is \( \{V \cap X \mid V \in \mathcal{T}\} \).

**Example 4.6 (Product Topology).** For topological spaces \( X, Y \), the **product topology** on \( X \times Y \) has basis \( \{U \times V \mid U \subseteq X, V \subseteq Y \text{ open}\} \).

**Example 4.7 (Quotient Topology).** For an equivalence relation \( \sim \) on a topological space \( X \) with quotient map \( q : X \to X/{\sim} \), the **quotient topology** is \( \{V \subseteq X/{\sim} \mid q^{-1}(V) \text{ open in } X\} \).

## Continuous Functions and Compact Sets

**Definition 4.8 (Hausdorff).** A topological space \( X \) is **Hausdorff** when for all distinct \( a, b \in X \) there exist disjoint open sets \( U, V \) with \( a \in U \), \( b \in V \). All metric spaces are Hausdorff.

**Definition 4.10 (Continuity).** A function \( f : X \to Y \) between topological spaces is **continuous** when \( f^{-1}(V) \) is open in \( X \) for every open \( V \subseteq Y \).

**Definition 4.11 (Compactness).** A subset \( A \subseteq X \) is **compact** when every open cover of \( A \) has a finite subcover.

**Theorem 4.12.** A subset \( A \subseteq X \subseteq Y \) is compact in \( X \) (with the subspace topology) iff it is compact in \( Y \).

**Theorem 4.15.** A topological space \( X \) is compact iff it has the **finite intersection property on closed sets**: every collection of closed sets with the property that every finite subcollection has nonempty intersection has nonempty total intersection.

**Theorem 4.16.** Every closed subspace of a compact space is compact.

**Theorem 4.17.** Every compact subspace of a Hausdorff space is closed.

**Theorem 4.18.** The continuous image of a compact space is compact.

**Theorem 4.20 (Extreme Value Theorem).** A continuous map \( f : X \to \mathbb{R} \) on a compact space attains its maximum and minimum.

**Theorem 4.21.** Let \( X \) be compact, \( Y \) Hausdorff, and \( f : X \to Y \) continuous and bijective. Then \( f \) is a homeomorphism.

## Urysohn's Lemma and the Tietze Extension Theorem

**Definition 4.23 (Normal Space).** A topological space is **normal** when all one-point sets are closed and for all disjoint closed sets \( A, B \) there exist disjoint open sets \( U, V \) with \( A \subseteq U \), \( B \subseteq V \). All metric spaces are normal.

**Theorem 4.25 (Urysohn's Lemma).** Let \( X \) be normal and \( A, B \subseteq X \) disjoint and closed. There exists a continuous \( f : X \to [0,1] \) with \( f|_A = 0 \) and \( f|_B = 1 \).

**Proof sketch.** Enumerate \( [0,1] \cap \mathbb{Q} = \{a_0, a_1, a_2, \ldots\} \) with \( a_0 = 0, a_1 = 1 \). Inductively construct open sets \( U_r \) for each \( r \in [0,1] \cap \mathbb{Q} \) such that \( r < s \implies \overline{U_r} \subseteq U_s \), with \( A \subseteq U_0 \) and \( B \cap U_1 = \emptyset \). Define \( f(x) = \inf\{r \in \mathbb{Q} \mid x \in U_r\} \) and verify continuity by showing preimages of open intervals are open. \( \square \)

**Theorem 4.26 (Tietze Extension Theorem).** Let \( X \) be normal, \( A \subseteq X \) closed, and \( a < b \).
1. Every continuous \( f : A \to [a,b] \) extends to continuous \( g : X \to [a,b] \).
2. Every continuous \( f : A \to (a,b) \) extends to continuous \( g : X \to (a,b) \).

**Proof sketch of (1).** WLOG \( [a,b] = [-1,1] \). Inductively, apply Urysohn's Lemma to construct a continuous approximation \( g_1 : X \to [-\frac{1}{3}, \frac{1}{3}] \) with \( \|f - g_1|_A\|_\infty \leq \frac{2}{3} \). Repeat on the residual \( f - g_1|_A \) scaled by \( \frac{2}{3} \), obtaining \( g_2 \) with \( \|g_k\|_\infty \leq \frac{2^{k-1}}{3^k} \). The series \( g = \sum_k g_k \) converges uniformly (Weierstrass M-test), defines a continuous extension with \( \|g\|_\infty \leq \sum \frac{2^{k-1}}{3^k} = 1 \). \( \square \)

## Infinite Products and Tychonoff's Theorem

**Definition 4.27.** The **cartesian product** \( \prod_{k \in K} X_k \) is the set of all indexed families \( (a_k)_{k \in K} \) with \( a_k \in X_k \). When each \( X_k \) is a topological space, the **product topology** has basis
\[ \left\{ \prod_{k \in K} U_k \;\Big|\; U_k \subseteq X_k \text{ open}, \; U_k = X_k \text{ for all but finitely many } k \right\}. \]
The coarser product topology differs from the finer **box topology** (which allows arbitrary open \( U_k \) at every index) when \( K \) is infinite.

**Theorem 4.29.** A function \( f : A \to \prod_{k \in K} X_k \) (with the product topology) is continuous iff each component \( f_k = p_k \circ f : A \to X_k \) is continuous, where \( p_k \) is the projection.

**Theorem 4.31 (Tychonoff's Theorem).** The product of any indexed family of compact spaces is compact in the product topology.

**Proof sketch.** Using Zorn's Lemma, extend any collection \( \mathcal{T} \) of closed sets with the finite intersection property to a maximal such collection \( \mathcal{S} \) (closed under finite intersections). For each \( k \), the collection \( \{p_k(A) \mid A \in \mathcal{S}\} \) of projected sets still has the finite intersection property in the compact space \( X_k \), so choose \( a_k \in \bigcap_{A \in \mathcal{S}} \overline{p_k(A)} \). The point \( a = (a_k) \) lies in every \( A \in \mathcal{S} \) (because every basic open neighbourhood of \( a \) meets every \( A \in \mathcal{S} \), hence in every element of \( \mathcal{T} \). \( \square \)

## Nets

**Definition 4.32.** A **directed set** is a set \( K \) with a binary relation \( \leq \) that is reflexive, transitive, and directed (for all \( a, b \) there exists \( c \) with \( a \leq c \) and \( b \leq c \). A **net** in a topological space \( X \) is an indexed family \( (x_k)_{k \in K} \) where \( K \) is directed. A net **converges** to \( a \in X \) when for every open \( U \ni a \) there exists \( m \in K \) such that \( k \geq m \implies x_k \in U \).

**Theorem 4.34.** Let \( X \) be a topological space, \( A \subseteq X \), \( a \in X \). Then \( a \in \overline{A} \) iff there is a net \( (x_k) \) in \( A \) with \( x_k \to a \).

**Theorem 4.35.** Let \( f : A \subseteq X \to Y \). Then \( f \) is continuous on \( A \) iff for every net \( (x_k) \) in \( A \) with \( x_k \to a \in A \), we have \( f(x_k) \to f(a) \) in \( Y \).

## Strong and Weak Topologies and the Banach-Alaoglu Theorem

**Definition 4.36 (Final/Strong Topology).** Given functions \( f_k : X_k \to Y \), the **final (strong) topology** on \( Y \) is the finest topology making all \( f_k \) continuous.

**Definition 4.38 (Initial/Weak Topology).** Given functions \( f_k : X \to Y_k \), the **initial (weak) topology** on \( X \) is the coarsest topology making all \( f_k \) continuous — the topology generated by \( \{f_k^{-1}(U) \mid k \in K, \; U \subseteq Y_k \text{ open}\} \).

**Definition 4.41 (Weak and Weak\( ^* \) Topologies).** Let \( U \) be a normed space.
- The **weak topology** on \( U \) is the initial topology with respect to \( (f)_{f \in U^*} \).
- The **weak\( ^* \) topology** on \( U^* \) is the initial topology with respect to \( (F_u)_{u \in U} \) where \( F_u(f) = f(u) \).

**Theorem 4.42.** In a normed space \( U \):
1. \( x_k \to a \) in the weak topology iff \( f(x_k) \to f(a) \) for all \( f \in U^* \).
2. \( f_k \to g \) in \( U^* \) with the weak\( ^* \) topology iff \( f_k(x) \to g(x) \) for all \( x \in U \).

**Remark 4.43.** When \( U \) is infinite-dimensional, the closed unit ball \( B_{U^*}(0,1) \) is **not** compact in the norm topology on \( U^* \) (by Riesz's Theorem 3.8). The Banach-Alaoglu Theorem shows it is compact in a weaker topology.

**Theorem 4.44 (Banach-Alaoglu Theorem).** For any normed space \( U \), the closed unit ball \( B_{U^*}(0,1) = \{f \in U^* \mid \|f\| \leq 1\} \) is compact in the weak\( ^* \) topology.

**Proof.** Let \( B = \{x \in U \mid \|x\| \leq 1\} \), \( D = \{t \in \mathbb{F} \mid |t| \leq 1\} \), and \( P = D^B = \prod_{u \in B} D \) with the product topology. The restriction map \( R : B_{U^*}(0,1) \to P \), \( R(f)(x) = f(x) \), is injective and continuous (each component \( R_u(f) = f(u) \) is continuous in the weak\( ^* \) topology). The image \( R(B_{U^*}(0,1)) \) is closed in \( P \) (limit points of locally-linear functions on \( B \) extend to linear maps on \( U \). Since \( D \) is compact, \( P \) is compact by Tychonoff. As a closed subset of a compact space, \( R(B_{U^*}(0,1)) \) is compact. Since \( R \) is a homeomorphism onto its image (its inverse is also continuous), \( B_{U^*}(0,1) \) is compact. \( \square \)

## Locally Convex Topological Vector Spaces

**Definition 4.45.** A **topological vector space** over \( \mathbb{F} \) is a Hausdorff vector space with a topology making addition and scalar multiplication continuous. It is **locally convex** when its topology has a basis of convex sets.

**Example 4.46.** For a normed space \( U \): the norm topology, the weak topology \( (U, \text{wk}) \), and the weak\( ^* \) topology \( (U^*, \text{wk}^*) \) are all locally convex topological vector spaces. In particular, the weak topology is Hausdorff (by the Hahn-Banach Theorem, distinct points are separated by functionals) and has a basis of convex sets (finite intersections of sets of the form \( f^{-1}(V) \).

**Note 4.49.** In a real topological vector space \( U \), the interior of any set is contained in its core: \( A^\circ \subseteq \operatorname{Core}(A) \).

**Theorem 4.50 (Hahn-Banach Separation for Topological Vector Spaces).** Let \( U \) be a real topological vector space and \( A, B \subseteq U \) disjoint nonempty convex subsets.
1. If \( A \) is open, there exists \( 0 \neq f \in U^* \) and \( c \in \mathbb{R} \) with \( f(x) < c \leq f(y) \) for all \( x \in A \), \( y \in B \).
2. If \( U \) is locally convex, \( A \) is compact, and \( B \) is closed, there exists \( 0 \neq f \in U^* \) and \( c \in \mathbb{R} \) with \( f(x) < c < f(y) \) for all \( x \in A \), \( y \in B \).

This geometric version of the Hahn-Banach Theorem provides the foundation for convex analysis and duality theory in functional analysis. Part (1) follows from Theorem 3.20 combined with Note 4.49 (which ensures the open set \( A \) is contained in its core). Part (2) uses local convexity to thicken \( A \) slightly and separate it from \( B \) with strict inequalities on both sides.
