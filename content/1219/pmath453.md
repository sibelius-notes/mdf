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

**Definition 0.1 (Injective, Surjective, Bijective).** Let <span>&#92;( f : X &#92;to Y &#92;)</span>. We say <span>&#92;( f &#92;)</span> is **injective** (one-to-one) when for all <span>&#92;( x&#95;1, x&#95;2 &#92;in X &#92;)</span>, <span>&#92;( f(x&#95;1) = f(x&#95;2) &#92;implies x&#95;1 = x&#95;2 &#92;)</span>. We say <span>&#92;( f &#92;)</span> is **surjective** (onto) when <span>&#92;( &#92;operatorname{Range}(f) = Y &#92;)</span>. We say <span>&#92;( f &#92;)</span> is **bijective** when it is both injective and surjective.

**Definition 0.2 (Cardinality).** For sets <span>&#92;( A &#92;)</span> and <span>&#92;( B &#92;)</span>:
- We write <span>&#92;( |A| = |B| &#92;)</span> when there exists a bijection <span>&#92;( f : A &#92;to B &#92;)</span>.
- We write <span>&#92;( |A| &#92;leq |B| &#92;)</span> when there exists an injection <span>&#92;( f : A &#92;to B &#92;)</span>.
- We say <span>&#92;( A &#92;)</span> is **countable** when <span>&#92;( |A| = |&#92;mathbb{N}| &#92;)</span>, writing <span>&#92;( |A| = &#92;aleph&#95;0 &#92;)</span>. A set is **at most countable** when it is finite or countable. A set is **uncountable** when it is neither finite nor countable.

**Theorem 0.3.** The sets <span>&#92;( &#92;mathbb{N} &#92;times &#92;mathbb{N} &#92;)</span>, <span>&#92;( &#92;mathbb{Z} &#92;)</span>, and <span>&#92;( &#92;mathbb{Q} &#92;)</span> are all countable. A countable union of countable sets is countable. The set <span>&#92;( &#92;mathbb{R} &#92;)</span> is uncountable, and <span>&#92;( |&#92;mathbb{R}| = 2^{&#92;aleph&#95;0} &#92;)</span>.

**Theorem 0.4 (Cantor–Schroeder–Bernstein).** If <span>&#92;( |A| &#92;leq |B| &#92;)</span> and <span>&#92;( |B| &#92;leq |A| &#92;)</span> then <span>&#92;( |A| = |B| &#92;)</span>.

**Theorem 0.5 (Cantor).** For every set <span>&#92;( A &#92;)</span>, <span>&#92;( |A| < |&#92;mathcal{P}(A)| &#92;)</span>. In particular, no set is in bijection with its own power set.

#### Lebesgue Measure

**Definition 0.6 (Outer Measure).** For <span>&#92;( A &#92;subseteq &#92;mathbb{R} &#92;)</span>, the **Lebesgue outer measure** of <span>&#92;( A &#92;)</span> is
<span>&#92;[ &#92;lambda^&#42;(A) = &#92;inf &#92;left&#92;{ &#92;sum&#95;{n=1}^&#92;infty |I&#95;n| &#92;;\Big|&#92;; &#92;text{each } I&#95;n &#92;text{ is a bounded open interval and } A &#92;subseteq &#92;bigcup&#95;{n=1}^&#92;infty I&#95;n &#92;right&#92;}. &#92;]</span>

**Definition 0.7 (Lebesgue Measurability).** A set <span>&#92;( A &#92;subseteq &#92;mathbb{R} &#92;)</span> is **(Lebesgue) measurable** when for every <span>&#92;( X &#92;subseteq &#92;mathbb{R} &#92;)</span>,
<span>&#92;[ &#92;lambda^&#42;(X) = &#92;lambda^&#42;(X &#92;cap A) + &#92;lambda^&#42;(X &#92;setminus A). &#92;]</span>
When <span>&#92;( A &#92;)</span> is measurable, its **Lebesgue measure** is <span>&#92;( &#92;lambda(A) = &#92;lambda^&#42;(A) &#92;)</span>.

**Theorem 0.8 (Properties of Measure).** The collection <span>&#92;( &#92;mathcal{M} &#92;)</span> of measurable subsets of <span>&#92;( &#92;mathbb{R} &#92;)</span> forms a <span>&#92;( &#92;sigma &#92;)</span>-algebra containing all open and closed sets. Measure is countably additive: if <span>&#92;( A&#95;1, A&#95;2, &#92;ldots &#92;)</span> are measurable and pairwise disjoint then <span>&#92;( &#92;lambda(&#92;bigcup&#95;{k=1}^&#92;infty A&#95;k) = &#92;sum&#95;{k=1}^&#92;infty &#92;lambda(A&#95;k) &#92;)</span>. If <span>&#92;( A&#95;1 &#92;subseteq A&#95;2 &#92;subseteq &#92;cdots &#92;)</span> then <span>&#92;( &#92;lambda(&#92;bigcup A&#95;n) = &#92;lim&#95;{n&#92;to&#92;infty} &#92;lambda(A&#95;n) &#92;)</span>. There exist non-measurable sets.

**Example 0.9 (Cantor Set).** The standard Cantor set <span>&#92;( C &#92;subseteq [0,1] &#92;)</span> is constructed by iteratively removing open middle thirds. It satisfies <span>&#92;( &#92;lambda(C) = 0 &#92;)</span> and <span>&#92;( |C| = 2^{&#92;aleph&#95;0} &#92;)</span>. Every subset of <span>&#92;( C &#92;)</span> is measurable (as a null set). More generally, one can construct a Cantor-like set with any prescribed measure <span>&#92;( m &#92;in [0,1) &#92;)</span>.

### Functional Analysis Prerequisites (PMATH 450)

The <span>&#92;( L^p &#92;)</span> spaces and their properties, including Hölder's and Minkowski's inequalities, are developed in PMATH 450 and recalled below in the Examples section of Chapter 1. The key facts are:

- For a measurable set <span>&#92;( A &#92;subseteq &#92;mathbb{R} &#92;)</span> and <span>&#92;( 1 &#92;leq p &#92;leq &#92;infty &#92;)</span>, the spaces <span>&#92;( L^p(A) &#92;)</span> are Banach spaces.
- <span>&#92;( L^2(A) &#92;)</span> is a Hilbert space under <span>&#92;( &#92;langle f, g &#92;rangle = &#92;int&#95;A f &#92;bar{g} &#92;)</span>.
- For <span>&#92;( a < b &#92;)</span>, <span>&#92;( L^p[a,b] &#92;)</span> is separable for <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span>, and <span>&#92;( L^&#92;infty[a,b] &#92;)</span> is not separable.

---

# Chapter 1: Preliminaries

## Basic Definitions

We begin by establishing the hierarchy of structured spaces that pervades functional analysis: inner product spaces, normed spaces, metric spaces, and topological spaces. Each layer forgets some structure while retaining key analytic properties.

**Definition 1.1 (Inner Product Space).** Let <span>&#92;( &#92;mathbb{F} = &#92;mathbb{R} &#92;)</span> or <span>&#92;( &#92;mathbb{C} &#92;)</span>. Let <span>&#92;( U &#92;)</span> be a vector space over <span>&#92;( &#92;mathbb{F} &#92;)</span>. An **inner product** on <span>&#92;( U &#92;)</span> is a function <span>&#92;( &#92;langle &#92;cdot, &#92;cdot &#92;rangle : U &#92;times U &#92;to &#92;mathbb{F} &#92;)</span> such that for all <span>&#92;( u, v, w &#92;in U &#92;)</span> and all <span>&#92;( t &#92;in &#92;mathbb{F} &#92;)</span>:

1. **(Sesquilinearity)** <span>&#92;( &#92;langle u+v, w &#92;rangle = &#92;langle u,w &#92;rangle + &#92;langle v,w &#92;rangle &#92;)</span>, <span>&#92;( &#92;langle tu, v &#92;rangle = t&#92;langle u,v &#92;rangle &#92;)</span>, <span>&#92;( &#92;langle u, v+w &#92;rangle = &#92;langle u,v &#92;rangle + &#92;langle u,w &#92;rangle &#92;)</span>, <span>&#92;( &#92;langle u, tv &#92;rangle = &#92;bar{t}&#92;langle u,v &#92;rangle &#92;)</span>.
2. **(Conjugate Symmetry)** <span>&#92;( &#92;langle u,v &#92;rangle = &#92;overline{&#92;langle v,u &#92;rangle} &#92;)</span>.
3. **(Positive Definiteness)** <span>&#92;( &#92;langle u,u &#92;rangle &#92;geq 0 &#92;)</span> with <span>&#92;( &#92;langle u,u &#92;rangle = 0 &#92;iff u = 0 &#92;)</span>.

An **inner product space** over <span>&#92;( &#92;mathbb{F} &#92;)</span> is a vector space equipped with an inner product. A linear map <span>&#92;( L : U &#92;to V &#92;)</span> between inner product spaces **preserves inner product** when <span>&#92;( &#92;langle L(x), L(y) &#92;rangle = &#92;langle x, y &#92;rangle &#92;)</span> for all <span>&#92;( x, y &#92;in U &#92;)</span>.

**Definition 1.2 (Normed Linear Space).** A **norm** on a vector space <span>&#92;( U &#92;)</span> over <span>&#92;( &#92;mathbb{F} &#92;)</span> is a map <span>&#92;( &#92;|&#92;cdot&#92;| : U &#92;to &#92;mathbb{R} &#92;)</span> satisfying for all <span>&#92;( u, v &#92;in U &#92;)</span> and <span>&#92;( t &#92;in &#92;mathbb{F} &#92;)</span>:

1. **(Scaling)** <span>&#92;( &#92;|tu&#92;| = |t|&#92;,&#92;|u&#92;| &#92;)</span>.
2. **(Positive Definiteness)** <span>&#92;( &#92;|u&#92;| &#92;geq 0 &#92;)</span> with <span>&#92;( &#92;|u&#92;| = 0 &#92;iff u = 0 &#92;)</span>.
3. **(Triangle Inequality)** <span>&#92;( &#92;|u+v&#92;| &#92;leq &#92;|u&#92;| + &#92;|v&#92;| &#92;)</span>.

A **normed linear space** is a vector space equipped with a norm. A **unit vector** is any <span>&#92;( u &#92;)</span> with <span>&#92;( &#92;|u&#92;| = 1 &#92;)</span>.

**Theorem 1.3.** Let <span>&#92;( U &#92;)</span> be an inner product space over <span>&#92;( &#92;mathbb{F} &#92;)</span>. Define <span>&#92;( &#92;|u&#92;| = &#92;sqrt{&#92;langle u,u &#92;rangle} &#92;)</span>. Then:

1. **(Scaling)** <span>&#92;( &#92;|tu&#92;| = |t|&#92;,&#92;|u&#92;| &#92;)</span>.
2. **(Positive Definiteness)** <span>&#92;( &#92;|u&#92;| &#92;geq 0 &#92;)</span> with <span>&#92;( &#92;|u&#92;| = 0 &#92;iff u = 0 &#92;)</span>.
3. <span>&#92;( &#92;|u+v&#92;|^2 = &#92;|u&#92;|^2 + 2&#92;operatorname{Re}&#92;langle u,v &#92;rangle + &#92;|v&#92;|^2 &#92;)</span>.
4. **(Pythagoras)** If <span>&#92;( &#92;langle u,v &#92;rangle = 0 &#92;)</span> then <span>&#92;( &#92;|u+v&#92;|^2 = &#92;|u&#92;|^2 + &#92;|v&#92;|^2 &#92;)</span>.
5. **(Parallelogram Law)** <span>&#92;( &#92;|u+v&#92;|^2 + &#92;|u-v&#92;|^2 = 2&#92;|u&#92;|^2 + 2&#92;|v&#92;|^2 &#92;)</span>.
6. **(Polarization Identity)** If <span>&#92;( &#92;mathbb{F} = &#92;mathbb{R} &#92;)</span>: <span>&#92;( &#92;langle u,v &#92;rangle = &#92;tfrac{1}{4}(&#92;|u+v&#92;|^2 - &#92;|u-v&#92;|^2) &#92;)</span>. If <span>&#92;( &#92;mathbb{F} = &#92;mathbb{C} &#92;)</span>: <span>&#92;( &#92;langle u,v &#92;rangle = &#92;tfrac{1}{4}(&#92;|u+v&#92;|^2 + i&#92;|u+iv&#92;|^2 - &#92;|u-v&#92;|^2 - i&#92;|u-iv&#92;|^2) &#92;)</span>.
7. **(Cauchy-Schwarz)** <span>&#92;( |&#92;langle u,v &#92;rangle| &#92;leq &#92;|u&#92;|&#92;,&#92;|v&#92;| &#92;)</span>, with equality iff <span>&#92;( &#92;{u,v&#92;} &#92;)</span> is linearly dependent.
8. **(Triangle Inequality)** <span>&#92;( &#92;|u+v&#92;| &#92;leq &#92;|u&#92;| + &#92;|v&#92;| &#92;)</span>.

In particular, <span>&#92;( &#92;|&#92;cdot&#92;| &#92;)</span> is a norm on <span>&#92;( U &#92;)</span>. **Proof omitted.**

**Definition 1.4 (Metric Space).** A **metric** on a nonempty set <span>&#92;( X &#92;)</span> is a function <span>&#92;( d : X &#92;times X &#92;to &#92;mathbb{R} &#92;)</span> satisfying for all <span>&#92;( x, y, z &#92;in X &#92;)</span>:
1. **(Positive Definiteness)** <span>&#92;( d(x,y) &#92;geq 0 &#92;)</span> with <span>&#92;( d(x,y) = 0 &#92;iff x = y &#92;)</span>.
2. **(Symmetry)** <span>&#92;( d(x,y) = d(y,x) &#92;)</span>.
3. **(Triangle Inequality)** <span>&#92;( d(x,z) &#92;leq d(x,y) + d(y,z) &#92;)</span>.

**Definition 1.5 (Topology).** A **topology** on a set <span>&#92;( X &#92;)</span> is a collection <span>&#92;( &#92;mathcal{T} &#92;)</span> of subsets of <span>&#92;( X &#92;)</span> such that: (1) <span>&#92;( &#92;emptyset, X &#92;in &#92;mathcal{T} &#92;)</span>; (2) finite intersections of elements of <span>&#92;( &#92;mathcal{T} &#92;)</span> lie in <span>&#92;( &#92;mathcal{T} &#92;)</span>; (3) arbitrary unions of elements of <span>&#92;( &#92;mathcal{T} &#92;)</span> lie in <span>&#92;( &#92;mathcal{T} &#92;)</span>. A subset <span>&#92;( A &#92;subseteq X &#92;)</span> is **open** when <span>&#92;( A &#92;in &#92;mathcal{T} &#92;)</span> and **closed** when <span>&#92;( X &#92;setminus A &#92;in &#92;mathcal{T} &#92;)</span>.

**Note 1.6.** These structures form a hierarchy: an inner product induces a norm via <span>&#92;( &#92;|x&#92;| = &#92;sqrt{&#92;langle x,x &#92;rangle} &#92;)</span>; a norm on <span>&#92;( V &#92;)</span> induces a metric on any <span>&#92;( X &#92;subseteq V &#92;)</span> via <span>&#92;( d(x,y) = &#92;|x-y&#92;| &#92;)</span>; a metric induces a topology by declaring <span>&#92;( A &#92;)</span> open when for every <span>&#92;( a &#92;in A &#92;)</span> there exists <span>&#92;( r > 0 &#92;)</span> with <span>&#92;( B(a,r) &#92;subseteq A &#92;)</span>.

**Definition 1.7 (Convergence and Cauchy Sequences).** Let <span>&#92;( (x&#95;n)&#95;{n &#92;geq 1} &#92;)</span> be a sequence in a metric space <span>&#92;( X &#92;)</span>. We say <span>&#92;( x&#95;n &#92;to a &#92;)</span> when
<span>&#92;[ &#92;forall &#92;varepsilon > 0 &#92;; &#92;exists n_0 &#92;in &#92;mathbb{Z}^+ &#92;; &#92;forall k &#92;geq n_0 : d(x_k, a) < &#92;varepsilon. &#92;]</span>
The sequence is **Cauchy** when <span>&#92;( &#92;forall &#92;varepsilon > 0 &#92;; &#92;exists n_0 &#92;; &#92;forall k, &#92;ell &#92;geq n_0 : d(x_k, x_&#92;ell) < &#92;varepsilon &#92;)</span>. Every convergent sequence is Cauchy.

**Definition 1.8 (Complete Spaces).** A metric space is **complete** when every Cauchy sequence converges. A complete normed linear space is called a **Banach space**. A complete inner product space is called a **Hilbert space**.

**Definition 1.9 (Dense and Separable).** A subset <span>&#92;( A &#92;subseteq X &#92;)</span> is **dense** in <span>&#92;( X &#92;)</span> when <span>&#92;( &#92;overline{A} = X &#92;)</span>. A metric space is **separable** when it contains a countable dense subset.

## Examples of Banach and Hilbert Spaces

**Example 1.10 (<span>&#92;( &#92;mathbb{F}^n &#92;)</span>).** The **standard inner product** on <span>&#92;( &#92;mathbb{F}^n &#92;)</span> is <span>&#92;( &#92;langle x, y &#92;rangle = y^&#42; x = &#92;sum&#95;{k=1}^n x&#95;k &#92;overline{y&#95;k} &#92;)</span>. This induces the **2-norm** <span>&#92;( &#92;|x&#92;|&#95;2 = (&#92;sum&#95;{k=1}^n |x&#95;k|^2)^{1/2} &#92;)</span>. The space <span>&#92;( &#92;mathbb{F}^n &#92;)</span> is a finite-dimensional separable Hilbert space.

**Example 1.11 (<span>&#92;( &#92;ell^2 &#92;)</span>).** Let <span>&#92;( &#92;ell^2 = &#92;ell^2(&#92;mathbb{F}) = &#92;{ x &#92;in &#92;mathbb{F}^&#92;omega &#92;mid &#92;sum_{k=1}^&#92;infty |x_k|^2 < &#92;infty &#92;} &#92;)</span>. The **standard inner product** is <span>&#92;( &#92;langle x, y &#92;rangle = &#92;sum&#95;{k=1}^&#92;infty x&#95;k &#92;overline{y&#95;k} &#92;)</span>, inducing the **2-norm** <span>&#92;( &#92;|x&#92;|&#95;2 = (&#92;sum&#95;{k=1}^&#92;infty |x&#95;k|^2)^{1/2} &#92;)</span>. The space <span>&#92;( &#92;ell^2 &#92;)</span> is an infinite-dimensional separable Hilbert space.

**Example 1.12 (<span>&#92;( L^2(A) &#92;)</span>).** Let <span>&#92;( A &#92;subseteq &#92;mathbb{R} &#92;)</span> be measurable. Let
<span>&#92;[ L^2(A) = L^2(A, &#92;mathbb{F}) = &#92;left&#92;{ f &#92;in M(A) &#92;\Big| &#92;int_A |f|^2 < &#92;infty &#92;right&#92;} &#92;big/ &#92;sim &#92;]</span>
where <span>&#92;( f &#92;sim g &#92;iff f = g &#92;)</span> a.e. The standard inner product is <span>&#92;( &#92;langle f, g &#92;rangle = &#92;int&#95;A f &#92;bar{g} &#92;)</span>. For <span>&#92;( a < b &#92;)</span>, <span>&#92;( L^2[a,b] &#92;)</span> is an infinite-dimensional separable Hilbert space.

**Example 1.13 (<span>&#92;( p &#92;)</span>-norms on <span>&#92;( &#92;mathbb{F}^n &#92;)</span>).** For <span>&#92;( x &#92;in &#92;mathbb{F}^n &#92;)</span>, define the **<span>&#92;( p &#92;)</span>-norm** <span>&#92;( &#92;|x&#92;|&#95;p = (&#92;sum&#95;{k=1}^n |x&#95;k|^p)^{1/p} &#92;)</span> for <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span>, and <span>&#92;( &#92;|x&#92;|&#95;&#92;infty = &#92;max&#95;k |x&#95;k| &#92;)</span> (the **supremum norm**). Each gives a norm, and <span>&#92;( &#92;mathbb{F}^n &#92;)</span> is a finite-dimensional separable Banach space under each <span>&#92;( p &#92;)</span>-norm.

**Example 1.14 (<span>&#92;( &#92;ell^p &#92;)</span> spaces).** For <span>&#92;( x &#92;in &#92;mathbb{F}^&#92;omega &#92;)</span>, define <span>&#92;( &#92;|x&#92;|&#95;p = (&#92;sum&#95;{k=1}^&#92;infty |x&#95;k|^p)^{1/p} &#92;)</span> for <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span> and <span>&#92;( &#92;|x&#92;|&#95;&#92;infty = &#92;sup&#95;k |x&#95;k| &#92;)</span>. Let <span>&#92;( &#92;ell^p = &#92;{ x &#92;in &#92;mathbb{F}^&#92;omega &#92;mid &#92;|x&#92;|_p < &#92;infty &#92;} &#92;)</span>. Each <span>&#92;( &#92;ell^p &#92;)</span> is a Banach space; <span>&#92;( &#92;ell^p &#92;)</span> is separable for <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span> but <span>&#92;( &#92;ell^&#92;infty &#92;)</span> is not separable.

**Example 1.15 (<span>&#92;( L^p(A) &#92;)</span> spaces).** For measurable <span>&#92;( A &#92;subseteq &#92;mathbb{R} &#92;)</span> and <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span>, the **<span>&#92;( p &#92;)</span>-norm** of <span>&#92;( f &#92;in M(A) &#92;)</span> is <span>&#92;( &#92;|f&#92;|&#95;p = (&#92;int&#95;A |f|^p)^{1/p} &#92;)</span>, and the **essential supremum** is <span>&#92;( &#92;|f&#92;|&#95;&#92;infty = &#92;inf&#92;{ m &#92;geq 0 &#92;mid |f(x)| &#92;leq m &#92;text{ a.e.}&#92;} &#92;)</span>. Setting <span>&#92;( L^p(A) = &#92;{ f &#92;in M(A) &#92;mid &#92;|f&#92;|_p < &#92;infty &#92;} / &#92;sim &#92;)</span> with <span>&#92;( f &#92;sim g &#92;iff f = g &#92;)</span> a.e., each <span>&#92;( L^p(A) &#92;)</span> is a Banach space. For <span>&#92;( a < b &#92;)</span>, <span>&#92;( L^p[a,b] &#92;)</span> is separable for <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span> but <span>&#92;( L^&#92;infty[a,b] &#92;)</span> is not.

**Remark 1.16.** The triangle inequality for the <span>&#92;( p &#92;)</span>-norms is **Minkowski's Inequality**, often proved using **Hölder's Inequality**.

**Theorem 1.17 (Hölder's Inequality).** Let <span>&#92;( p, q &#92;in [1,&#92;infty] &#92;)</span> with <span>&#92;( &#92;frac{1}{p} + &#92;frac{1}{q} = 1 &#92;)</span>.
1. For all <span>&#92;( x, y &#92;in &#92;mathbb{F}^n &#92;)</span> or <span>&#92;( x, y &#92;in &#92;mathbb{F}^&#92;omega &#92;)</span>: <span>&#92;( &#92;|xy&#92;|&#95;1 &#92;leq &#92;|x&#92;|&#95;p &#92;|y&#92;|&#95;q &#92;)</span>.
2. For all <span>&#92;( f, g &#92;in M(A) &#92;)</span>: <span>&#92;( &#92;|fg&#92;|&#95;1 &#92;leq &#92;|f&#92;|&#95;p &#92;|g&#92;|&#95;q &#92;)</span>.

**Proof omitted.**

**Theorem 1.18 (Minkowski's Inequality).** Let <span>&#92;( p &#92;in [1,&#92;infty] &#92;)</span>.
1. For all <span>&#92;( x, y &#92;in &#92;mathbb{F}^n &#92;)</span> or <span>&#92;( x, y &#92;in &#92;mathbb{F}^&#92;omega &#92;)</span>: <span>&#92;( &#92;|x+y&#92;|&#95;p &#92;leq &#92;|x&#92;|&#95;p + &#92;|y&#92;|&#95;p &#92;)</span>.
2. For all <span>&#92;( f, g &#92;in M(A) &#92;)</span>: <span>&#92;( &#92;|f+g&#92;|&#95;p &#92;leq &#92;|f&#92;|&#95;p + &#92;|g&#92;|&#95;p &#92;)</span>.

**Proof omitted.**

**Example 1.19 (Spaces of Continuous Functions).** Let <span>&#92;( X &#92;)</span> be a metric space. Let <span>&#92;( F&#95;b(X) &#92;)</span> be the space of bounded functions <span>&#92;( f : X &#92;to &#92;mathbb{F} &#92;)</span>, and <span>&#92;( C&#95;b(X) &#92;)</span> the space of bounded continuous functions. Both are Banach spaces under the **supremum norm** <span>&#92;( &#92;|f&#92;|&#95;&#92;infty = &#92;sup&#92;{|f(x)| &#92;mid x &#92;in X&#92;} &#92;)</span>. When <span>&#92;( X &#92;)</span> is compact, <span>&#92;( C(X) = C&#95;b(X) &#92;)</span> is a Banach space. For <span>&#92;( a < b &#92;)</span>, <span>&#92;( C[a,b] &#92;)</span> is separable by the Weierstrass Polynomial Approximation Theorem.

## Bounded Linear Operators

**Remark 1.20.** When <span>&#92;( U &#92;)</span> and <span>&#92;( V &#92;)</span> are normed linear spaces, a linear map <span>&#92;( F : U &#92;to V &#92;)</span> is also called a **linear operator**. When <span>&#92;( V = &#92;mathbb{F} &#92;)</span>, it is called a **linear functional**.

**Definition 1.21 (Operator Norm).** Let <span>&#92;( F : U &#92;to V &#92;)</span> be a linear operator. The **operator norm** of <span>&#92;( F &#92;)</span> is
<span>&#92;[ &#92;|F&#92;| = &#92;sup&#92;{ &#92;|Fx&#92;| &#92;mid x &#92;in U, &#92;|x&#92;| &#92;leq 1 &#92;}. &#92;]</span>
We say <span>&#92;( F &#92;)</span> is **bounded** when <span>&#92;( &#92;|F&#92;| < &#92;infty &#92;)</span>. Equivalently,
<span>&#92;[ &#92;|F&#92;| = &#92;sup&#92;{ &#92;|Fx&#92;| &#92;mid x &#92;in U, &#92;|x&#92;| = 1&#92;} = &#92;inf&#92;{ m &#92;geq 0 &#92;mid &#92;|Fx&#92;| &#92;leq m&#92;|x&#92;| &#92;; &#92;forall x &#92;in U&#92;}, &#92;]</span>
and <span>&#92;( &#92;|Fx&#92;| &#92;leq &#92;|F&#92;|&#92;,&#92;|x&#92;| &#92;)</span> for all <span>&#92;( x &#92;in U &#92;)</span>. The space of bounded linear operators <span>&#92;( F : U &#92;to V &#92;)</span> is denoted <span>&#92;( B(U,V) &#92;)</span>.

**Example 1.22.** When <span>&#92;( U &#92;)</span> and <span>&#92;( V &#92;)</span> are non-trivial finite-dimensional inner product spaces over <span>&#92;( &#92;mathbb{R} &#92;)</span> and <span>&#92;( F : U &#92;to V &#92;)</span> is linear, the maximum of <span>&#92;( &#92;|Fx&#92;| &#92;)</span> over the unit ball is attained and equals <span>&#92;( &#92;sqrt{&#92;lambda} &#92;)</span> where <span>&#92;( &#92;lambda &#92;)</span> is the largest eigenvalue of <span>&#92;( F^&#42; F &#92;)</span>.

**Theorem 1.23.** Let <span>&#92;( U &#92;)</span> and <span>&#92;( V &#92;)</span> be normed linear spaces.
1. <span>&#92;( B(U,V) &#92;)</span> is a normed linear space under the operator norm.
2. If <span>&#92;( V &#92;)</span> is a Banach space then <span>&#92;( B(U,V) &#92;)</span> is a Banach space.

**Proof.** Part 1 is routine. For Part 2, let <span>&#92;( (F&#95;n) &#92;)</span> be Cauchy in <span>&#92;( B(U,V) &#92;)</span>. For each <span>&#92;( x &#92;in U &#92;)</span>, since <span>&#92;( &#92;|F&#95;k x - F&#95;&#92;ell x&#92;| &#92;leq &#92;|F&#95;k - F&#95;&#92;ell&#92;|&#92;,&#92;|x&#92;| &#92;)</span>, the sequence <span>&#92;( (F&#95;n x) &#92;)</span> is Cauchy in <span>&#92;( V &#92;)</span> and converges; define <span>&#92;( Gx = &#92;lim&#95;{n&#92;to&#92;infty} F&#95;n x &#92;)</span>. Then <span>&#92;( G &#92;)</span> is linear. Since <span>&#92;( (F&#95;n) &#92;)</span> is Cauchy hence bounded, say <span>&#92;( &#92;|F&#95;n&#92;| &#92;leq M &#92;)</span>, we get <span>&#92;( &#92;|Gx&#92;| = &#92;lim &#92;|F&#95;n x&#92;| &#92;leq M&#92;|x&#92;| &#92;)</span>, so <span>&#92;( G &#92;in B(U,V) &#92;)</span>. For <span>&#92;( &#92;varepsilon > 0 &#92;)</span> choose <span>&#92;( m &#92;)</span> so that <span>&#92;( k, n &#92;geq m &#92;implies &#92;|F_n - F_k&#92;| < &#92;varepsilon &#92;)</span>; then for <span>&#92;( n &#92;geq m &#92;)</span> and all <span>&#92;( x &#92;)</span>, <span>&#92;( &#92;|(F&#95;n - G)x&#92;| = &#92;lim&#95;k &#92;|F&#95;n x - F&#95;k x&#92;| &#92;leq &#92;varepsilon &#92;|x&#92;| &#92;)</span>, so <span>&#92;( F&#95;n &#92;to G &#92;)</span> in <span>&#92;( B(U,V) &#92;)</span>. <span>&#92;( &#92;square &#92;)</span>

**Definition 1.24 (Lipschitz Continuity).** A map <span>&#92;( f : (X, d&#95;X) &#92;to (Y, d&#95;Y) &#92;)</span> is **Lipschitz continuous** with constant <span>&#92;( &#92;ell &#92;geq 0 &#92;)</span> when <span>&#92;( d&#95;Y(f(x), f(y)) &#92;leq &#92;ell &#92;cdot d&#95;X(x,y) &#92;)</span> for all <span>&#92;( x, y &#92;in X &#92;)</span>.

**Note 1.25.** Lipschitz continuous maps are uniformly continuous; they send convergent sequences to convergent sequences and Cauchy sequences to Cauchy sequences.

**Theorem 1.26.** For a linear map <span>&#92;( F : U &#92;to V &#92;)</span> between normed linear spaces, the following are equivalent:
1. <span>&#92;( F &#92;)</span> is Lipschitz continuous.
2. <span>&#92;( F &#92;)</span> is continuous at some point <span>&#92;( a &#92;in U &#92;)</span>.
3. <span>&#92;( F &#92;)</span> is continuous at <span>&#92;( 0 &#92;)</span>.
4. <span>&#92;( F &#92;)</span> is bounded.

In this case, <span>&#92;( &#92;|F&#92;| &#92;)</span> is a Lipschitz constant for <span>&#92;( F &#92;)</span>.

**Proof.** (1)<span>&#92;( &#92;implies &#92;)</span>(2)<span>&#92;( &#92;implies &#92;)</span>(3) are immediate. For (3)<span>&#92;( &#92;implies &#92;)</span>(4): if <span>&#92;( F &#92;)</span> is continuous at <span>&#92;( 0 &#92;)</span>, choose <span>&#92;( &#92;delta > 0 &#92;)</span> so that <span>&#92;( &#92;|x&#92;| &#92;leq &#92;delta &#92;implies &#92;|Fx&#92;| &#92;leq 1 &#92;)</span>; for <span>&#92;( &#92;|x&#92;| = 1 &#92;)</span> we have <span>&#92;( &#92;|F x&#92;| = &#92;frac{1}{&#92;delta}&#92;|F(&#92;delta x)&#92;| &#92;leq &#92;frac{1}{&#92;delta} &#92;)</span>, so <span>&#92;( &#92;|F&#92;| &#92;leq &#92;frac{1}{&#92;delta} &#92;)</span>. For (4)<span>&#92;( &#92;implies &#92;)</span>(1): <span>&#92;( &#92;|Fx - Fy&#92;| = &#92;|F(x-y)&#92;| &#92;leq &#92;|F&#92;|&#92;,&#92;|x-y&#92;| &#92;)</span>. <span>&#92;( &#92;square &#92;)</span>

## Dual Spaces

**Definition 1.27.** The **(continuous) dual space** of a normed linear space <span>&#92;( U &#92;)</span> is
<span>&#92;[ U^* = B(U, &#92;mathbb{F}) = &#92;{ f : U &#92;to &#92;mathbb{F} &#92;mid f &#92;text{ is linear with } &#92;|f&#92;| < &#92;infty &#92;}. &#92;]</span>
By Theorem 1.23, <span>&#92;( U^&#42; &#92;)</span> is always a Banach space.

**Theorem 1.28 (Riesz Representation for <span>&#92;( &#92;ell^p &#92;)</span>).** Let <span>&#92;( p, q &#92;in [1,&#92;infty] &#92;)</span> with <span>&#92;( &#92;frac{1}{p} + &#92;frac{1}{q} = 1 &#92;)</span>.
1. The map <span>&#92;( F : &#92;ell^q &#92;to (&#92;ell^p)^&#42; &#92;)</span> given by <span>&#92;( F(b)(a) = &#92;sum&#95;{k=1}^&#92;infty a&#95;k b&#95;k &#92;)</span> is well-defined, linear, injective, and norm-preserving.
2. When <span>&#92;( p &#92;neq &#92;infty &#92;)</span>, <span>&#92;( F &#92;)</span> is also surjective, so <span>&#92;( (&#92;ell^p)^&#42; &#92;cong &#92;ell^q &#92;)</span>.

**Proof sketch.** By Hölder's Inequality, <span>&#92;( |F(b)(a)| &#92;leq &#92;|a&#92;|&#95;p &#92;|b&#92;|&#95;q &#92;)</span>, so <span>&#92;( F(b) &#92;)</span> is bounded with <span>&#92;( &#92;|F(b)&#92;| &#92;leq &#92;|b&#92;|&#95;q &#92;)</span>. Norm preservation (equality) is shown by testing on suitable extremal sequences. Surjectivity for <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span>: given <span>&#92;( f &#92;in (&#92;ell^p)^&#42; &#92;)</span>, set <span>&#92;( b&#95;k = f(e&#95;k) &#92;)</span> and verify <span>&#92;( b &#92;in &#92;ell^q &#92;)</span> and <span>&#92;( F(b) = f &#92;)</span> by approximation with finite sums. <span>&#92;( &#92;square &#92;)</span>

**Remark 1.29.** When <span>&#92;( p = &#92;infty &#92;)</span> and <span>&#92;( q = 1 &#92;)</span>, the proof of surjectivity breaks down because finitely-supported truncations do not converge in <span>&#92;( &#92;ell^&#92;infty &#92;)</span>. Indeed, <span>&#92;( F : &#92;ell^1 &#92;to (&#92;ell^&#92;infty)^&#42; &#92;)</span> is not surjective (as shown later via the Hahn-Banach Theorem).

**Theorem 1.31 (Riesz Representation for <span>&#92;( L^p &#92;)</span>).** Let <span>&#92;( p, q &#92;in [1,&#92;infty] &#92;)</span> with <span>&#92;( &#92;frac{1}{p} + &#92;frac{1}{q} = 1 &#92;)</span>, and let <span>&#92;( A &#92;subseteq &#92;mathbb{R} &#92;)</span> be measurable with <span>&#92;( &#92;lambda(A) > 0 &#92;)</span>.
1. The map <span>&#92;( F : L^q(A) &#92;to L^p(A)^&#42; &#92;)</span> given by <span>&#92;( F(g)(f) = &#92;int&#95;A fg &#92;)</span> is well-defined, injective, and norm-preserving.
2. When <span>&#92;( 1 &#92;leq p < &#92;infty &#92;)</span>, <span>&#92;( F &#92;)</span> is surjective, so <span>&#92;( L^p(A)^&#42; &#92;cong L^q(A) &#92;)</span>.

## Uniform Boundedness

**Definition 1.32.** A subset <span>&#92;( A &#92;)</span> of a metric space <span>&#92;( X &#92;)</span> is **nowhere dense** when the interior of its closure is empty, i.e., <span>&#92;( &#92;overline{A}^&#92;circ = &#92;emptyset &#92;)</span>. Equivalently, every nonempty open ball contains a nonempty open ball disjoint from <span>&#92;( A &#92;)</span>.

**Definition 1.33.** A subset <span>&#92;( A &#92;subseteq X &#92;)</span> is **first category** (or **meagre**) when it is a countable union of nowhere dense sets, and **second category** when it is not first category. A set is **residual** when its complement is first category. Note: <span>&#92;( &#92;mathbb{Q} &#92;)</span> is first category in <span>&#92;( &#92;mathbb{R} &#92;)</span>, and <span>&#92;( &#92;mathbb{R} &#92;setminus &#92;mathbb{Q} &#92;)</span> is residual.

**Theorem 1.34 (Baire Category Theorem).** Let <span>&#92;( X &#92;)</span> be a complete metric space.
1. Every first category set in <span>&#92;( X &#92;)</span> has empty interior.
2. Every residual set in <span>&#92;( X &#92;)</span> is dense.
3. Every countable union of closed sets with empty interiors has empty interior.
4. Every countable intersection of dense open sets is dense.

**Proof sketch.** Parts (1) and (2) are equivalent by complementation; (3) and (4) are special cases. For (1): suppose <span>&#92;( A = &#92;bigcup&#95;{n=1}^&#92;infty C&#95;n &#92;)</span> with each <span>&#92;( C&#95;n &#92;)</span> nowhere dense, and assume <span>&#92;( A &#92;)</span> has nonempty interior. Choose an open ball <span>&#92;( B&#95;0 &#92;)</span> inside <span>&#92;( A &#92;)</span>, then inductively choose a nested sequence of open balls <span>&#92;( B&#95;n &#92;)</span> with <span>&#92;( &#92;operatorname{diam}(B&#95;n) &#92;to 0 &#92;)</span>, <span>&#92;( &#92;overline{B&#95;n} &#92;subseteq B&#95;{n-1} &#92;)</span>, and <span>&#92;( &#92;overline{B&#95;n} &#92;cap C&#95;n = &#92;emptyset &#92;)</span>. By completeness, the centres of <span>&#92;( B&#95;n &#92;)</span> converge to some <span>&#92;( a &#92;in B&#95;0 &#92;subseteq A &#92;)</span>, yet <span>&#92;( a &#92;notin C&#95;n &#92;)</span> for all <span>&#92;( n &#92;)</span>, contradicting <span>&#92;( a &#92;in A &#92;)</span>. <span>&#92;( &#92;square &#92;)</span>

**Definition 1.37 (<span>&#92;( &#92;sigma &#92;)</span>-algebra).** A **<span>&#92;( &#92;sigma &#92;)</span>-algebra** in a set <span>&#92;( X &#92;)</span> is a collection <span>&#92;( &#92;mathcal{C} &#92;)</span> of subsets of <span>&#92;( X &#92;)</span> such that: <span>&#92;( &#92;emptyset &#92;in &#92;mathcal{C} &#92;)</span>; if <span>&#92;( A &#92;in &#92;mathcal{C} &#92;)</span> then <span>&#92;( A^c &#92;in &#92;mathcal{C} &#92;)</span>; and if <span>&#92;( A&#95;1, A&#95;2, &#92;ldots &#92;in &#92;mathcal{C} &#92;)</span> then <span>&#92;( &#92;bigcup&#95;{k=1}^&#92;infty A&#95;k &#92;in &#92;mathcal{C} &#92;)</span>.

**Theorem 1.40 (Banach-Steinhaus / Uniform Boundedness Principle).** Let <span>&#92;( X &#92;)</span> be a Banach space, <span>&#92;( Y &#92;)</span> a normed linear space, and <span>&#92;( S &#92;)</span> a set of bounded linear maps <span>&#92;( L : X &#92;to Y &#92;)</span>. Suppose that for every <span>&#92;( x &#92;in X &#92;)</span> there exists <span>&#92;( m&#95;x &#92;geq 0 &#92;)</span> such that <span>&#92;( &#92;|Lx&#92;| &#92;leq m&#95;x &#92;)</span> for all <span>&#92;( L &#92;in S &#92;)</span>. Then there exists <span>&#92;( m &#92;geq 0 &#92;)</span> such that <span>&#92;( &#92;|L&#92;| &#92;leq m &#92;)</span> for all <span>&#92;( L &#92;in S &#92;)</span>.

**Proof.** For each <span>&#92;( n &#92;in &#92;mathbb{Z}^+ &#92;)</span>, let <span>&#92;( A&#95;n = &#92;{ x &#92;in X &#92;mid &#92;|Lx&#92;| &#92;leq n &#92;; &#92;forall L &#92;in S&#92;} &#92;)</span>. Each <span>&#92;( A&#95;n &#92;)</span> is closed, and by hypothesis <span>&#92;( X = &#92;bigcup&#95;{n=1}^&#92;infty A&#95;n &#92;)</span>. By the Baire Category Theorem, some <span>&#92;( A&#95;n &#92;)</span> is not nowhere dense, so contains an open ball <span>&#92;( B(a,r) &#92;)</span>. For <span>&#92;( &#92;|x&#92;| < r &#92;)</span>, we have <span>&#92;( x + a &#92;in B(a,r) &#92;subseteq A&#95;n &#92;)</span>, so <span>&#92;( &#92;|L(x)&#92;| &#92;leq &#92;|L(x+a)&#92;| + &#92;|L(a)&#92;| &#92;leq 2n &#92;)</span>. Scaling gives <span>&#92;( &#92;|L&#92;| &#92;leq &#92;frac{2n}{r} &#92;)</span> for all <span>&#92;( L &#92;in S &#92;)</span>. <span>&#92;( &#92;square &#92;)</span>

**Theorem 1.41 (Condensation of Singularities).** Let <span>&#92;( X &#92;)</span> be a Banach space, <span>&#92;( Y &#92;)</span> a normed space, and <span>&#92;( L&#95;{m,n} : X &#92;to Y &#92;)</span> bounded linear for <span>&#92;( m, n &#92;in &#92;mathbb{Z}^+ &#92;)</span>. Suppose that for each <span>&#92;( m &#92;)</span> there exists <span>&#92;( x&#95;m &#92;in X &#92;)</span> with <span>&#92;( &#92;limsup&#95;{n&#92;to&#92;infty} &#92;|L&#95;{m,n}(x&#95;m)&#92;| = &#92;infty &#92;)</span>. Then the set
<span>&#92;[ E = &#92;left&#92;{ x &#92;in X &#92;;\Big|&#92;; &#92;limsup&#95;{n&#92;to&#92;infty} &#92;|L&#95;{m,n}(x)&#92;| = &#92;infty &#92;; &#92;forall m &#92;in &#92;mathbb{Z}^+ &#92;right&#92;} &#92;]</span>
is a dense <span>&#92;( G&#95;&#92;delta &#92;)</span> set (hence residual and, by the Baire Category Theorem, dense in <span>&#92;( X &#92;)</span>).

**Proof sketch.** Fix <span>&#92;( m &#92;)</span>. The sets <span>&#92;( A&#95;&#92;ell = &#92;{ x &#92;mid &#92;|L&#95;{m,n}(x)&#92;| &#92;leq &#92;ell &#92;; &#92;forall n&#92;} &#92;)</span> are closed. If one were not nowhere dense, the Uniform Boundedness Principle would give a bound on <span>&#92;( &#92;|L&#95;{m,n}&#92;| &#92;)</span>, contradicting the hypothesis. So all <span>&#92;( A&#95;&#92;ell &#92;)</span> are nowhere dense, making <span>&#92;( B&#95;m = &#92;bigcup&#95;&#92;ell A&#95;&#92;ell &#92;)</span> first category. Then <span>&#92;( E = X &#92;setminus &#92;bigcup&#95;m B&#95;m &#92;)</span> is a countable intersection of dense open sets, hence dense by Baire. <span>&#92;( &#92;square &#92;)</span>

---

# Chapter 2: Hilbert Spaces

## Review of Inner Product Spaces

**Definition 2.1 (Hamel Basis).** A **(Hamel) basis** for a vector space <span>&#92;( V &#92;)</span> over any field <span>&#92;( \mathbb{F} &#92;)</span> is a maximal linearly independent set, or equivalently a linearly independent spanning set. Any two Hamel bases for <span>&#92;( V &#92;)</span> have the same cardinality, which defines the **(Hamel) dimension** <span>&#92;( \dim(V) &#92;)</span>.

**Definition 2.2 (Orthogonal and Orthonormal Sets).** Let <span>&#92;( V &#92;)</span> be an inner product space. A subset <span>&#92;( B \subseteq V &#92;)</span> is **orthogonal** when <span>&#92;( \langle u, v \rangle = 0 &#92;)</span> for all distinct <span>&#92;( u, v \in B &#92;)</span>, and **orthonormal** when it is orthogonal and every element has norm 1.

**Theorem 2.3.** Let <span>&#92;( V &#92;)</span> be an inner product space with orthonormal set <span>&#92;( B &#92;)</span>. Let <span>&#92;( x = \sum&#95;{k=1}^n a&#95;k u&#95;k &#92;)</span> and <span>&#92;( y = \sum&#95;{k=1}^n b&#95;k u&#95;k &#92;)</span> with <span>&#92;( u&#95;k \in B &#92;)</span>. Then
<span>&#92;[ \langle x, u&#95;k \rangle = a&#95;k, \quad \langle x, y \rangle = \sum&#95;{k=1}^n a&#95;k \overline{b&#95;k}, \quad \|x\|^2 = \sum&#95;{k=1}^n |a&#95;k|^2. &#92;]</span>
In particular, <span>&#92;( B &#92;)</span> is linearly independent. **Proof omitted.**

**Theorem 2.4 (Gram-Schmidt Procedure).** Let <span>&#92;( V &#92;)</span> be an inner product space of finite or countable Hamel dimension with ordered Hamel basis <span>&#92;( A = (u&#95;1, u&#95;2, u&#95;3, \ldots) &#92;)</span>. Define <span>&#92;( v&#95;1 = u&#95;1 &#92;)</span> and for <span>&#92;( n \geq 2 &#92;)</span>,
<span>&#92;[ v&#95;n = u&#95;n - \sum&#95;{k=1}^{n-1} \frac{\langle u&#95;n, v&#95;k \rangle}{\|v&#95;k\|^2} v&#95;k. &#92;]</span>
Then <span>&#92;( B = (v&#95;1, v&#95;2, v&#95;3, \ldots) &#92;)</span> is an orthogonal Hamel basis with <span>&#92;( \operatorname{Span}\{v&#95;1, \ldots, v&#95;n\} = \operatorname{Span}\{u&#95;1, \ldots, u&#95;n\} &#92;)</span> for every <span>&#92;( n &#92;)</span>. **Proof omitted.**

**Corollary 2.5.** Every inner product space of finite or countable Hamel dimension has an orthonormal Hamel basis.

**Corollary 2.6.** If <span>&#92;( V &#92;)</span> has finite or countable Hamel dimension and <span>&#92;( U \subseteq V &#92;)</span> is a finite-dimensional subspace, then any orthonormal basis for <span>&#92;( U &#92;)</span> extends to an orthonormal basis for <span>&#92;( V &#92;)</span>.

**Corollary 2.7.** Inner product spaces of finite or countable Hamel dimension are isomorphic (as inner product spaces) iff they have the same Hamel dimension. In particular, <span>&#92;( \dim(U) = n &#92;)</span> implies <span>&#92;( U \cong \mathbb{F}^n &#92;)</span>, and <span>&#92;( \dim(U) = \aleph&#95;0 &#92;)</span> implies <span>&#92;( U \cong \mathbb{F}^\infty &#92;)</span>.

**Corollary 2.8.** Every finite-dimensional inner product space is complete. Every inner product space of countable Hamel dimension is **not** complete.

**Definition 2.9 (Direct Sum).** For subspaces <span>&#92;( U, V \subseteq W &#92;)</span>, write <span>&#92;( W = U \oplus V &#92;)</span> when <span>&#92;( W = U + V &#92;)</span> and <span>&#92;( U \cap V = \{0\} &#92;)</span>, so every <span>&#92;( x \in W &#92;)</span> has a unique decomposition <span>&#92;( x = u + v &#92;)</span>.

**Definition 2.10 (Orthogonal Complement).** For a subspace <span>&#92;( U &#92;)</span> of an inner product space <span>&#92;( V &#92;)</span>, the **orthogonal complement** is
<span>&#92;[ U^\perp = \{ x \in V \mid \langle x, u \rangle = 0 \; \forall u \in U \}. &#92;]</span>

**Theorem 2.11.** Let <span>&#92;( V &#92;)</span> be an inner product space and <span>&#92;( U \subseteq V &#92;)</span> a subspace. Then:
1. <span>&#92;( U^\perp &#92;)</span> is a subspace.
2. <span>&#92;( U^\perp = \{ x \mid \langle x, u \rangle = 0 \; \forall u \in B\} &#92;)</span> for any basis <span>&#92;( B &#92;)</span> of <span>&#92;( U &#92;)</span>.
3. <span>&#92;( U \cap U^\perp = \{0\} &#92;)</span>.
4. <span>&#92;( U \subseteq (U^\perp)^\perp &#92;)</span>.

When <span>&#92;( U &#92;)</span> is finite-dimensional: additionally <span>&#92;( U \oplus U^\perp = V &#92;)</span> and <span>&#92;( (U^\perp)^\perp = U &#92;)</span>. **Proof omitted.**

**Definition 2.12 (Orthogonal Projection).** When <span>&#92;( V = U \oplus U^\perp &#92;)</span>, the **orthogonal projection** onto <span>&#92;( U &#92;)</span> is the map <span>&#92;( \operatorname{Proj}&#95;U : V \to U &#92;)</span> sending <span>&#92;( x = u + v &#92;)</span> (with <span>&#92;( u \in U, v \in U^\perp &#92;)</span>) to <span>&#92;( \operatorname{Proj}&#95;U(x) = u &#92;)</span>.

**Theorem 2.13.** Under the conditions of Definition 2.12, <span>&#92;( \operatorname{Proj}&#95;U(x) &#92;)</span> is the unique point in <span>&#92;( U &#92;)</span> nearest to <span>&#92;( x &#92;)</span>. **Proof omitted.**

**Example 2.14.** Let <span>&#92;( U &#92;)</span> be finite-dimensional with orthogonal basis <span>&#92;( \{u&#95;1, \ldots, u&#95;n\} &#92;)</span>. Then
<span>&#92;[ \operatorname{Proj}&#95;U(x) = \sum&#95;{k=1}^n \frac{\langle x, u&#95;k \rangle}{\|u&#95;k\|^2} u&#95;k. &#92;]</span>

**Note 2.16.** If <span>&#92;( U \subseteq W &#92;)</span> is a subspace, its closure <span>&#92;( \overline{U} &#92;)</span> is also a subspace. Moreover <span>&#92;( \overline{U}^\perp = U^\perp &#92;)</span>. This follows because if <span>&#92;( v \in U^\perp &#92;)</span> and <span>&#92;( u \in \overline{U} &#92;)</span> with <span>&#92;( x&#95;n \to u &#92;)</span> in <span>&#92;( U &#92;)</span>, then <span>&#92;( \langle v, u \rangle = \lim&#95;n \langle v, x&#95;n \rangle = 0 &#92;)</span>.

## Closed Subspaces of Hilbert Spaces and Orthogonal Projections

**Example 2.17.** Infinite-dimensional subspaces can behave differently from finite-dimensional ones. Let <span>&#92;( V = \mathbb{F}^\infty &#92;)</span> (finitely-supported sequences) with the standard inner product, and <span>&#92;( U = \{ a \in \mathbb{F}^\infty \mid \sum&#95;k a&#95;k = 0 \} &#92;)</span>. One computes <span>&#92;( U^\perp = \{0\} &#92;)</span>, so <span>&#92;( (U^\perp)^\perp = V \neq U &#92;)</span> and <span>&#92;( V \neq U \oplus U^\perp &#92;)</span>. The issue is that <span>&#92;( V &#92;)</span> (having countable Hamel dimension) is not complete.

**Definition 2.18 (Convex Set).** A subset <span>&#92;( S \subseteq V &#92;)</span> is **convex** when for all <span>&#92;( a, b \in S &#92;)</span> and <span>&#92;( 0 \leq t \leq 1 &#92;)</span>, <span>&#92;( a + t(b-a) \in S &#92;)</span>.

**Theorem 2.19 (Best Approximation in Hilbert Spaces).** Let <span>&#92;( H &#92;)</span> be a Hilbert space and <span>&#92;( S \subseteq H &#92;)</span> nonempty, closed, and convex. Then for every <span>&#92;( a \in H &#92;)</span> there exists a **unique** point <span>&#92;( b \in S &#92;)</span> nearest to <span>&#92;( a &#92;)</span>.

**Proof.** Let <span>&#92;( d = \operatorname{dist}(a, S) &#92;)</span>. Choose <span>&#92;( x&#95;n \in S &#92;)</span> with <span>&#92;( \|x&#95;n - a\|^2 \to d^2 &#92;)</span>. By the Parallelogram Law and convexity (<span>&#92;( \frac{x&#95;k+x&#95;\ell}{2} \in S &#92;)</span> so <span>&#92;( \|\frac{x&#95;k+x&#95;\ell}{2} - a\| \geq d &#92;)</span>),
<span>&#92;[ \|x&#95;k - x&#95;\ell\|^2 = 2\|x&#95;k-a\|^2 + 2\|x&#95;\ell-a\|^2 - 4\Big\|\tfrac{x&#95;k+x&#95;\ell}{2}-a\Big\|^2 \leq 2\|x&#95;k-a\|^2 + 2\|x&#95;\ell-a\|^2 - 4d^2 \to 0, &#92;]</span>
so <span>&#92;( (x&#95;n) &#92;)</span> is Cauchy, converging to some <span>&#92;( b \in S &#92;)</span> (since <span>&#92;( S &#92;)</span> is closed and <span>&#92;( H &#92;)</span> is complete). Then <span>&#92;( \|b-a\| = \lim \|x&#95;n-a\| = d &#92;)</span>. Uniqueness follows similarly from the Parallelogram Law. <span>&#92;( \square &#92;)</span>

**Theorem 2.20 (Characterization of Closed Subspaces).** Let <span>&#92;( H &#92;)</span> be a Hilbert space and <span>&#92;( U \subseteq H &#92;)</span> a subspace. Then <span>&#92;( U &#92;)</span> is closed if and only if <span>&#92;( H = U \oplus U^\perp &#92;)</span>. In this case, <span>&#92;( U^\perp &#92;)</span> is closed, <span>&#92;( (U^\perp)^\perp = U &#92;)</span>, and for <span>&#92;( x = u + v &#92;)</span> with <span>&#92;( u \in U, v \in U^\perp &#92;)</span>, <span>&#92;( u &#92;)</span> is the unique point in <span>&#92;( U &#92;)</span> nearest <span>&#92;( x &#92;)</span>.

**Proof sketch.** (<span>&#92;( \Leftarrow &#92;)</span>) If <span>&#92;( H = U \oplus U^\perp &#92;)</span> and <span>&#92;( x&#95;n \in U &#92;)</span> with <span>&#92;( x&#95;n \to a &#92;)</span>, write <span>&#92;( a = u + v &#92;)</span>; then <span>&#92;( \|v\|^2 = \langle a, v \rangle = \lim \langle x&#95;n, v \rangle = 0 &#92;)</span>, so <span>&#92;( a = u \in U &#92;)</span>. (<span>&#92;( \Rightarrow &#92;)</span>) If <span>&#92;( U &#92;)</span> is closed, apply Theorem 2.19: for each <span>&#92;( x \in H &#92;)</span>, the nearest point <span>&#92;( u \in U &#92;)</span> gives <span>&#92;( v = x - u \in U^\perp &#92;)</span> (verified by a variational argument). Uniqueness follows by the same Parallelogram Law argument. <span>&#92;( \square &#92;)</span>

**Definition 2.21.** When <span>&#92;( U &#92;)</span> is a closed subspace of a Hilbert space <span>&#92;( H &#92;)</span>, the **orthogonal projection** onto <span>&#92;( U &#92;)</span> is the map <span>&#92;( P : H \to U &#92;)</span> given by <span>&#92;( Px = u &#92;)</span> where <span>&#92;( x = u + v &#92;)</span>, <span>&#92;( u \in U &#92;)</span>, <span>&#92;( v \in U^\perp &#92;)</span>.

## Unordered Series

The classical theory of sequences and series extends naturally to uncountable index sets, which is essential for working with general Hilbert bases.

**Definition 2.22.** A series <span>&#92;( \sum&#95;{k=1}^\infty a&#95;k &#92;)</span> in a normed space <span>&#92;( V &#92;)</span> **converges absolutely** when <span>&#92;( \sum_{k=1}^\infty \|a_k\| < \infty &#92;)</span>, and **converges unconditionally** when every rearrangement converges.

**Definition 2.24 (Unordered Series).** Let <span>&#92;( K &#92;)</span> be a nonempty (possibly uncountable) index set and <span>&#92;( (a&#95;k)&#95;{k \in K} &#92;)</span> an indexed set in a normed space <span>&#92;( X &#92;)</span>. The **unordered series** <span>&#92;( \sum&#95;{k \in K} a&#95;k &#92;)</span> **converges** to <span>&#92;( s \in X &#92;)</span> when
<span>&#92;[ \forall \varepsilon > 0 \; \exists F \in \operatorname{Fin}(K) \; \forall I \in \operatorname{Fin}(K) \; I \supseteq F \implies \|s_I - s\| < \varepsilon, &#92;]</span>
where <span>&#92;( s&#95;I = \sum&#95;{k \in I} a&#95;k &#92;)</span> for finite <span>&#92;( I &#92;)</span>. It **converges absolutely** when <span>&#92;( \sum_{k \in K} \|a_k\| < \infty &#92;)</span>.

**Theorem 2.26.** If <span>&#92;( (a&#95;k)&#95;{k \in K} &#92;)</span> with each <span>&#92;( a&#95;k \geq 0 &#92;)</span> has <span>&#92;( \sum_{k \in K} a_k < \infty &#92;)</span>, then at most countably many <span>&#92;( a&#95;k &#92;)</span> are nonzero.

**Proof.** For each <span>&#92;( n &#92;)</span>, let <span>&#92;( K&#95;n = \{ k \mid a&#95;k \geq \frac{1}{n} \} &#92;)</span>. If any <span>&#92;( K&#95;n &#92;)</span> were infinite, the sum would be infinite. Thus every <span>&#92;( K&#95;n &#92;)</span> is finite, and <span>&#92;( \{ k \mid a&#95;k > 0 \} = \bigcup&#95;n K&#95;n &#92;)</span> is at most countable. <span>&#92;( \square &#92;)</span>

**Theorem 2.28 (Cauchy Criterion).** Let <span>&#92;( (a&#95;k)&#95;{k \in K} &#92;)</span> be an indexed set in a normed space <span>&#92;( X &#92;)</span>.
1. If <span>&#92;( \sum&#95;{k \in K} a&#95;k &#92;)</span> converges, it is Cauchy.
2. If <span>&#92;( X &#92;)</span> is complete and the series is Cauchy, it converges.

## Formulas Involving Orthonormal Indexed Sets

**Definition 2.29.** An indexed set <span>&#92;( (u&#95;k)&#95;{k \in K} &#92;)</span> in an inner product space is **orthonormal** when <span>&#92;( \|u&#95;k\| = 1 &#92;)</span> for all <span>&#92;( k &#92;)</span> and <span>&#92;( \langle u&#95;k, u&#95;\ell \rangle = 0 &#92;)</span> for <span>&#92;( k \neq \ell &#92;)</span>.

**Theorem 2.30.** Let <span>&#92;( H &#92;)</span> be a Hilbert space, <span>&#92;( (u&#95;k)&#95;{k \in K} &#92;)</span> orthonormal, <span>&#92;( B = \{u&#95;k\} &#92;)</span>, and <span>&#92;( x, y \in \overline{\operatorname{Span}\, B} &#92;)</span>. Let <span>&#92;( a&#95;k = \langle x, u&#95;k \rangle &#92;)</span>, <span>&#92;( b&#95;k = \langle y, u&#95;k \rangle &#92;)</span>. Then:
<span>&#92;[ (1)\; \sum&#95;{k \in K} a&#95;k u&#95;k = x, \qquad (2)\; \sum&#95;{k \in K} |a&#95;k|^2 = \|x\|^2, \qquad (3)\; \sum&#95;{k \in K} a&#95;k \overline{b&#95;k} = \langle x, y \rangle. &#92;]</span>

**Theorem 2.31.** Let <span>&#92;( (u&#95;k)&#95;{k \in K} &#92;)</span> be orthonormal in a Hilbert space <span>&#92;( H &#92;)</span> and let <span>&#92;( (c&#95;k)&#95;{k \in K} &#92;)</span> be scalars.
1. If <span>&#92;( \sum&#95;{k \in K} c&#95;k u&#95;k &#92;)</span> converges to <span>&#92;( x &#92;)</span>, then <span>&#92;( x \in \overline{\operatorname{Span}\, B} &#92;)</span> and <span>&#92;( c&#95;k = \langle x, u&#95;k \rangle &#92;)</span>.
2. <span>&#92;( \sum&#95;{k \in K} c&#95;k u&#95;k &#92;)</span> converges in <span>&#92;( H &#92;)</span> if and only if <span>&#92;( \sum_{k \in K} |c_k|^2 < \infty &#92;)</span>.

**Theorem 2.32 (Bessel's Inequality).** Let <span>&#92;( (u&#95;k)&#95;{k \in K} &#92;)</span> be orthonormal in an inner product space <span>&#92;( V &#92;)</span>. For all <span>&#92;( x \in V &#92;)</span>,
<span>&#92;[ \sum&#95;{k \in K} |\langle x, u&#95;k \rangle|^2 \leq \|x\|^2. &#92;]</span>

**Proof.** For any finite <span>&#92;( F \subseteq K &#92;)</span> and <span>&#92;( w&#95;F = \sum&#95;{k \in F} \langle x, u&#95;k \rangle u&#95;k &#92;)</span>,
<span>&#92;[ 0 \leq \|x - w&#95;F\|^2 = \|x\|^2 - \sum&#95;{k \in F} |\langle x, u&#95;k \rangle|^2. &#92;]</span>
Taking the supremum over all finite <span>&#92;( F &#92;)</span> gives the inequality. <span>&#92;( \square &#92;)</span>

**Theorem 2.33 (Orthogonal Projection Formula).** Let <span>&#92;( H &#92;)</span> be a Hilbert space, <span>&#92;( (u&#95;k)&#95;{k \in K} &#92;)</span> orthonormal, <span>&#92;( B = \{u&#95;k\} &#92;)</span>, <span>&#92;( U = \overline{\operatorname{Span}\, B} &#92;)</span>. The orthogonal projection <span>&#92;( P : H \to U &#92;)</span> is given by
<span>&#92;[ Px = \sum&#95;{k \in K} \langle x, u&#95;k \rangle u&#95;k, &#92;]</span>
and <span>&#92;( \|P\| = 1 &#92;)</span>.

**Proof.** By Bessel's Inequality, <span>&#92;( \sum_k |\langle x, u_k \rangle|^2 \leq \|x\|^2 < \infty &#92;)</span>, so by Theorem 2.31(2) the sum converges, and by Theorem 2.31(1) it lies in <span>&#92;( U &#92;)</span>. For any <span>&#92;( u&#95;k &#92;)</span>, <span>&#92;( \langle Px - x, u&#95;k \rangle = \langle x, u&#95;k \rangle - \langle x, u&#95;k \rangle = 0 &#92;)</span>, so <span>&#92;( x - Px \in U^\perp &#92;)</span>. Thus <span>&#92;( P &#92;)</span> is the orthogonal projection. Since <span>&#92;( \|Px\|^2 = \sum&#95;k |\langle x, u&#95;k \rangle|^2 \leq \|x\|^2 &#92;)</span>, we have <span>&#92;( \|P\| \leq 1 &#92;)</span>; and <span>&#92;( P(u&#95;k) = u&#95;k &#92;)</span> gives <span>&#92;( \|P\| \geq 1 &#92;)</span>. <span>&#92;( \square &#92;)</span>

## Hilbert Bases

**Theorem 2.34.** Let <span>&#92;( H &#92;)</span> be a Hilbert space and <span>&#92;( B &#92;)</span> an orthonormal set. Then <span>&#92;( B &#92;)</span> is a **maximal orthonormal set** if and only if <span>&#92;( \overline{\operatorname{Span}\, B} = H &#92;)</span>.

**Proof.** If <span>&#92;( B &#92;)</span> is not maximal, we can add a unit vector <span>&#92;( v &#92;)</span> orthogonal to all of <span>&#92;( B &#92;)</span>, and then <span>&#92;( v \notin \overline{\operatorname{Span}\, B} &#92;)</span>. Conversely, if <span>&#92;( \overline{\operatorname{Span}\, B} \neq H &#92;)</span>, then <span>&#92;( (\overline{\operatorname{Span}\, B})^\perp \neq \{0\} &#92;)</span> and we can add a unit vector, so <span>&#92;( B &#92;)</span> is not maximal. <span>&#92;( \square &#92;)</span>

**Theorem 2.35.**
1. Every inner product space contains a maximal orthonormal set (by Zorn's Lemma).
2. In a Hilbert space, any two maximal orthonormal sets have the same cardinality.

**Proof of (2) sketch.** Let <span>&#92;( B = \{u&#95;k\}&#95;{k \in K} &#92;)</span> and <span>&#92;( C = \{v&#95;\ell\}&#95;{\ell \in L} &#92;)</span> be maximal. For each <span>&#92;( k \in K &#92;)</span>, let <span>&#92;( L&#95;k = \{\ell \in L \mid \langle u&#95;k, v&#95;\ell \rangle \neq 0\} &#92;)</span>; Bessel's Inequality gives <span>&#92;( |L&#95;k| \leq \aleph&#95;0 &#92;)</span>. Since <span>&#92;( C &#92;)</span> is maximal (hence <span>&#92;( \overline{\operatorname{Span}\, C} = H &#92;)</span>), for each <span>&#92;( \ell \in L &#92;)</span> there exists <span>&#92;( k &#92;)</span> with <span>&#92;( \langle u&#95;k, v&#95;\ell \rangle \neq 0 &#92;)</span>, so <span>&#92;( L = \bigcup&#95;{k \in K} L&#95;k &#92;)</span>. Cardinal arithmetic gives <span>&#92;( |L| \leq |K| \cdot \aleph&#95;0 = |K| &#92;)</span>. Symmetry gives <span>&#92;( |K| \leq |L| &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Definition 2.36.** A **Hilbert basis** (or **orthonormal basis**) for a Hilbert space <span>&#92;( H &#92;)</span> is a maximal orthonormal set. The **(Hilbert) dimension** <span>&#92;( \dim H &#92;)</span> is the cardinality of any Hilbert basis.

**Theorem 2.37.** Let <span>&#92;( H &#92;)</span> be a Hilbert space with orthonormal indexed set <span>&#92;( (u&#95;k)&#95;{k \in K} &#92;)</span> and <span>&#92;( B = \{u&#95;k\} &#92;)</span>. The following are equivalent:
1. <span>&#92;( B &#92;)</span> is a Hilbert basis.
2. For every <span>&#92;( x \in H &#92;)</span>: <span>&#92;( x = \sum&#95;{k \in K} \langle x, u&#95;k \rangle u&#95;k &#92;)</span> (**Fourier expansion**).
3. For every <span>&#92;( x \in H &#92;)</span>: <span>&#92;( \|x\|^2 = \sum&#95;{k \in K} |\langle x, u&#95;k \rangle|^2 &#92;)</span> (**Parseval's identity**).
4. For every <span>&#92;( x, y \in H &#92;)</span>: <span>&#92;( \langle x, y \rangle = \sum&#95;{k \in K} \langle x, u&#95;k \rangle \overline{\langle y, u&#95;k \rangle} &#92;)</span>.

**Theorem 2.38.** A Hilbert space <span>&#92;( H &#92;)</span> is separable if and only if its Hilbert basis is at most countable.

**Example 2.39-2.40 (<span>&#92;( \ell^2(K) &#92;)</span>).** For any nonempty set <span>&#92;( K &#92;)</span>, define <span>&#92;( \ell^2(K, \mathbb{F}) = \{ (c_k)_{k \in K} \mid \sum_{k \in K} |c_k|^2 < \infty \} &#92;)</span> with inner product <span>&#92;( \langle a, b \rangle = \sum&#95;{k \in K} a&#95;k \overline{b&#95;k} &#92;)</span>. The standard basis vectors <span>&#92;( (e&#95;\ell)&#95;{\ell \in K} &#92;)</span> form a Hilbert basis. Any Hilbert space over <span>&#92;( \mathbb{F} &#92;)</span> with <span>&#92;( \dim H = |K| &#92;)</span> is isomorphic to <span>&#92;( \ell^2(K, \mathbb{F}) &#92;)</span>. In particular, every separable Hilbert space is isomorphic to <span>&#92;( \ell^2 &#92;)</span>; for example, <span>&#92;( L^2[a,b] \cong \ell^2 &#92;)</span>.

## The Dual Space and the Adjoint Map

**Theorem 2.41 (Riesz Representation Theorem for Hilbert Spaces).** Let <span>&#92;( H &#92;)</span> be a Hilbert space over <span>&#92;( \mathbb{F} &#92;)</span>. The map <span>&#92;( \varphi : H \to H^&#42; &#92;)</span> given by <span>&#92;( \varphi(u)(x) = \langle x, u \rangle &#92;)</span> is a bijective norm-preserving map that is linear when <span>&#92;( \mathbb{F} = \mathbb{R} &#92;)</span> and conjugate-linear when <span>&#92;( \mathbb{F} = \mathbb{C} &#92;)</span>.

**Proof.** For <span>&#92;( u \in H &#92;)</span>, write <span>&#92;( \varphi&#95;u = \varphi(u) &#92;)</span>. Then <span>&#92;( \varphi&#95;u(u) = \|u\|^2 &#92;)</span> gives <span>&#92;( \|\varphi&#95;u\| \geq \|u\| &#92;)</span>, and Cauchy-Schwarz gives <span>&#92;( |\varphi&#95;u(x)| \leq \|x\|\,\|u\| &#92;)</span> so <span>&#92;( \|\varphi&#95;u\| \leq \|u\| &#92;)</span>. Hence <span>&#92;( \varphi &#92;)</span> is norm-preserving (thus injective). For surjectivity: let <span>&#92;( f \in H^&#42; &#92;)</span>, <span>&#92;( f \neq 0 &#92;)</span>. Then <span>&#92;( U = \ker(f) &#92;)</span> is a closed proper subspace of <span>&#92;( H &#92;)</span>, so <span>&#92;( U^\perp \neq \{0\} &#92;)</span>. Choose <span>&#92;( v \in U^\perp &#92;)</span> with <span>&#92;( \|v\| = 1 &#92;)</span> and set <span>&#92;( u = \overline{f(v)} v &#92;)</span>; then <span>&#92;( \varphi&#95;u = f &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Definition 2.42.** Using the bijection <span>&#92;( \varphi &#92;)</span> of Theorem 2.41, we define an inner product on <span>&#92;( H^&#42; &#92;)</span> by <span>&#92;( \langle f, g \rangle&#95;{H^&#42;} = \langle \varphi^{-1}(g), \varphi^{-1}(f) \rangle&#95;H &#92;)</span> (note the reversal for conjugate-linearity).

**Definition 2.43 (Adjoint).** When <span>&#92;( H &#92;)</span> and <span>&#92;( K &#92;)</span> are Hilbert spaces and <span>&#92;( F \in B(H,K) &#92;)</span>, the **(Hilbert space) adjoint** of <span>&#92;( F &#92;)</span> is the unique map <span>&#92;( F^&#42; : K \to H &#92;)</span> satisfying
<span>&#92;[ \langle Fx, y \rangle = \langle x, F^&#42; y \rangle \quad \forall x \in H, y \in K. &#92;]</span>
We have <span>&#92;( \|F^&#42;\| = \|F\| &#92;)</span>.

## Weak Convergence

**Definition 2.45.** Let <span>&#92;( V &#92;)</span> be an inner product space and <span>&#92;( (u&#95;n) &#92;)</span> a sequence in <span>&#92;( V &#92;)</span>. We say <span>&#92;( u&#95;n \to w &#92;)</span> **weakly** when <span>&#92;( \langle u&#95;n, x \rangle \to \langle w, x \rangle &#92;)</span> for all <span>&#92;( x \in V &#92;)</span>.

**Note 2.46.** Strong convergence (<span>&#92;( \|u&#95;n - w\| \to 0 &#92;)</span>) implies weak convergence, but not conversely. For example, any orthonormal sequence <span>&#92;( (u&#95;n) &#92;)</span> in a Hilbert space converges weakly to <span>&#92;( 0 &#92;)</span> (by Parseval's identity) but does not converge strongly.

**Theorem 2.47.** Every bounded sequence in a Hilbert space has a weakly convergent subsequence.

**Proof sketch.** When <span>&#92;( H &#92;)</span> is separable with dense set <span>&#92;( \{a&#95;1, a&#95;2, \ldots\} &#92;)</span>: given a bounded sequence <span>&#92;( (u&#95;n) &#92;)</span>, use a diagonal subsequence argument to extract a subsequence <span>&#92;( (v&#95;k) &#92;)</span> such that <span>&#92;( \langle v&#95;k, a&#95;m \rangle &#92;)</span> converges for every <span>&#92;( m &#92;)</span>. The functional <span>&#92;( f(x) = \lim&#95;k \langle v&#95;k, x \rangle &#92;)</span> is bounded; by the Riesz Representation Theorem there exists <span>&#92;( w \in H &#92;)</span> with <span>&#92;( f(x) = \langle x, w \rangle &#92;)</span>, and <span>&#92;( v&#95;k \to w &#92;)</span> weakly. For non-separable <span>&#92;( H &#92;)</span>, the sequence lies in a separable subspace, and the result reduces to the separable case. <span>&#92;( \square &#92;)</span>

## The Spectral Theorem for Compact Self-Adjoint Operators

**Definition 2.48.** A **compact operator** on a Hilbert space <span>&#92;( H &#92;)</span> is a linear map <span>&#92;( F : H \to H &#92;)</span> that sends weakly convergent sequences to (strongly) convergent sequences: <span>&#92;( u&#95;n \to w &#92;)</span> weakly <span>&#92;( \implies Fu&#95;n \to Fw &#92;)</span> in norm.

**Note 2.49.** Every compact operator is continuous (since strong convergence implies weak convergence), but not conversely. The identity on an infinite-dimensional Hilbert space is continuous but not compact, since any orthonormal sequence converges weakly to <span>&#92;( 0 &#92;)</span> but not in norm.

**Definition 2.50.** A **self-adjoint operator** on <span>&#92;( H &#92;)</span> is a continuous <span>&#92;( F : H \to H &#92;)</span> with <span>&#92;( F^&#42; = F &#92;)</span>, i.e., <span>&#92;( \langle Fx, y \rangle = \langle x, Fy \rangle &#92;)</span> for all <span>&#92;( x, y \in H &#92;)</span>.

**Theorem 2.51.** Let <span>&#92;( F &#92;)</span> be a continuous self-adjoint operator on <span>&#92;( H &#92;)</span>. Then:
1. <span>&#92;( \langle Fu, u \rangle \in \mathbb{R} &#92;)</span> for all <span>&#92;( u &#92;)</span>. In particular, all eigenvalues of <span>&#92;( F &#92;)</span> are real.
2. <span>&#92;( \|F\| = \sup\{ |\langle Fu, u \rangle| \mid \|u\| = 1 \} &#92;)</span>. Every eigenvalue satisfies <span>&#92;( |\lambda| \leq \|F\| &#92;)</span>.

**Proof of (1).** <span>&#92;( \langle Fu, u \rangle = \langle u, F^&#42;u \rangle = \langle u, Fu \rangle = \overline{\langle Fu, u \rangle} &#92;)</span>. For (2): let <span>&#92;( M = \sup\{\langle Fu, u \rangle \mid \|u\| = 1\} &#92;)</span>. Cauchy-Schwarz gives <span>&#92;( M \leq \|F\| &#92;)</span>. For the reverse, use a polarization-type identity valid when <span>&#92;( \langle Fu, v \rangle \in \mathbb{R} &#92;)</span>:
<span>&#92;[ \langle Fu, v \rangle = \tfrac{1}{4}(\langle F(u+v), u+v \rangle - \langle F(u-v), u-v \rangle) \leq \tfrac{M}{2}(\|u\|^2 + \|v\|^2), &#92;]</span>
so choosing <span>&#92;( v = Fu/\|Fu\| &#92;)</span> (when <span>&#92;( Fu \neq 0 &#92;)</span>) gives <span>&#92;( \|Fu\| \leq M &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Example 2.52.** The multiplication operator <span>&#92;( F : L^2[0,1] \to L^2[0,1] &#92;)</span>, <span>&#92;( F(f)(x) = xf(x) &#92;)</span>, is self-adjoint and continuous with no eigenvalues.

**Theorem 2.53.** Let <span>&#92;( F &#92;)</span> be a compact self-adjoint operator on a Hilbert space <span>&#92;( H &#92;)</span> with <span>&#92;( F \neq 0 &#92;)</span>. Then <span>&#92;( F &#92;)</span> has an eigenvalue <span>&#92;( \lambda &#92;)</span> with <span>&#92;( |\lambda| = \|F\| &#92;)</span>.

**Proof.** By Theorem 2.51, either <span>&#92;( \|F\| = \sup\{\langle Fu, u \rangle \mid \|u\|=1\} &#92;)</span> or its negative is the infimum. WLOG suppose the former; choose <span>&#92;( (u&#95;n) &#92;)</span> with <span>&#92;( \|u&#95;n\| = 1 &#92;)</span> and <span>&#92;( \langle Fu&#95;n, u&#95;n \rangle \to \lambda = \|F\| &#92;)</span>. Then
<span>&#92;[ \|Fu&#95;n - \lambda u&#95;n\|^2 = \|Fu&#95;n\|^2 - 2\lambda\langle Fu&#95;n, u&#95;n \rangle + \lambda^2 \leq \|F\|^2 - 2\lambda\langle Fu&#95;n, u&#95;n \rangle + \lambda^2 \to 0. &#92;]</span>
Since <span>&#92;( F &#92;)</span> is compact and <span>&#92;( (u&#95;n) &#92;)</span> is bounded, a subsequence <span>&#92;( (v&#95;k) &#92;)</span> gives <span>&#92;( Fv&#95;k \to Fw &#92;)</span> weakly. Then <span>&#92;( \lambda v&#95;k \to Fw &#92;)</span> in norm. Applying <span>&#92;( F &#92;)</span>: <span>&#92;( F(Fw) = \lambda Fw &#92;)</span>, so <span>&#92;( \lambda &#92;)</span> is an eigenvalue with eigenvector <span>&#92;( Fw &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Note 2.54 (Useful Properties for the Spectral Theorem).**
1. For continuous <span>&#92;( F &#92;)</span>, the eigenspace <span>&#92;( E&#95;\lambda = \ker(F - \lambda I) &#92;)</span> is closed.
2. For self-adjoint <span>&#92;( F &#92;)</span>, eigenspaces for distinct eigenvalues are orthogonal.
3. If <span>&#92;( U \subseteq H &#92;)</span> is a closed subspace, the orthogonal projection <span>&#92;( P &#92;)</span> onto <span>&#92;( U &#92;)</span> is self-adjoint and (when <span>&#92;( U &#92;)</span> is finite-dimensional) compact.
4. If <span>&#92;( \lambda &#92;)</span> is a nonzero eigenvalue of a self-adjoint <span>&#92;( F &#92;)</span> with projection <span>&#92;( P &#92;)</span> onto <span>&#92;( E&#95;\lambda &#92;)</span>, then <span>&#92;( \lambda P = FP = PF &#92;)</span>.
5. For compact <span>&#92;( F &#92;)</span>, any eigenspace <span>&#92;( E&#95;\lambda &#92;)</span> for <span>&#92;( \lambda \neq 0 &#92;)</span> is finite-dimensional (else choose an orthonormal sequence <span>&#92;( (e&#95;n) \subset E&#95;\lambda &#92;)</span>; then <span>&#92;( e&#95;n \to 0 &#92;)</span> weakly but <span>&#92;( Fe&#95;n = \lambda e&#95;n \not\to 0 &#92;)</span>, contradicting compactness).

**Theorem 2.55 (Spectral Theorem for Compact Self-Adjoint Operators).** Let <span>&#92;( H &#92;)</span> be a Hilbert space and <span>&#92;( F : H \to H &#92;)</span> a nonzero compact self-adjoint operator. Then:
- The set of nonzero eigenvalues is at most countable.
- Each nonzero eigenspace <span>&#92;( E&#95;{\lambda&#95;k} &#92;)</span> is finite-dimensional.
- If there are finitely many nonzero eigenvalues <span>&#92;( \lambda&#95;1, \ldots, \lambda&#95;n &#92;)</span>:
<span>&#92;[ F = \sum&#95;{k=1}^n \lambda&#95;k P&#95;{\lambda&#95;k}, &#92;]</span>
where <span>&#92;( P&#95;{\lambda&#95;k} &#92;)</span> is the orthogonal projection onto <span>&#92;( E&#95;{\lambda&#95;k} &#92;)</span>.
- If there are countably many eigenvalues, they can be arranged as <span>&#92;( \lambda&#95;1, \lambda&#95;2, \ldots &#92;)</span> in nonincreasing order of absolute value, with <span>&#92;( \lambda&#95;n \to 0 &#92;)</span>, and
<span>&#92;[ F = \sum&#95;{k=1}^\infty \lambda&#95;k P&#95;{\lambda&#95;k} &#92;]</span>
in the operator norm topology.

**Proof sketch.** Non-compactness of infinite-dimensional eigenspaces follows from Note 2.54(5). Using Theorem 2.53 iteratively, one extracts eigenvalues <span>&#92;( \lambda&#95;1, \lambda&#95;2, \ldots &#92;)</span> with <span>&#92;( |\lambda&#95;k| = \|F&#95;k\| &#92;)</span> where <span>&#92;( F&#95;{k+1} = F&#95;k - \lambda&#95;k P&#95;{\lambda&#95;k} &#92;)</span>. The eigenvalues are in nonincreasing order. If the process is infinite: suppose <span>&#92;( |\lambda&#95;n| \to r > 0 &#92;)</span>; picking unit eigenvectors <span>&#92;( u&#95;n \in E&#95;{\lambda&#95;n} &#92;)</span> (which are mutually orthogonal) yields <span>&#92;( \|Fu&#95;{n&#95;k} - Fu&#95;{n&#95;\ell}\|^2 = \lambda&#95;{n&#95;k}^2 + \lambda&#95;{n&#95;\ell}^2 \geq 2r^2 &#92;)</span>, contradicting compactness of <span>&#92;( F &#92;)</span>. So <span>&#92;( \lambda&#95;n \to 0 &#92;)</span>. The completeness of the spectral expansion follows by showing <span>&#92;( \|F&#95;{n+1}\| = |\lambda&#95;{n+1}| \to 0 &#92;)</span> in operator norm. <span>&#92;( \square &#92;)</span>

---

# Chapter 3: Banach Spaces

## Finite-Dimensional Normed Linear Spaces

**Example 3.1.** For non-trivial finite-dimensional inner product spaces <span>&#92;( U, V &#92;)</span> over <span>&#92;( \mathbb{R} &#92;)</span> and a linear map <span>&#92;( F : U \to V &#92;)</span>, the maximum of <span>&#92;( \|Fx\| &#92;)</span> on the closed unit ball is attained, and <span>&#92;( \|F\| = \sqrt{\lambda} &#92;)</span> where <span>&#92;( \lambda &#92;)</span> is the largest eigenvalue of <span>&#92;( F^&#42;F &#92;)</span>.

**Theorem 3.2.** Let <span>&#92;( U &#92;)</span> be an <span>&#92;( n &#92;)</span>-dimensional normed linear space over <span>&#92;( \mathbb{R} &#92;)</span>, with basis <span>&#92;( \{u&#95;1, \ldots, u&#95;n\} &#92;)</span> and associated isomorphism <span>&#92;( F : \mathbb{R}^n \to U &#92;)</span>, <span>&#92;( F(t) = \sum&#95;k t&#95;k u&#95;k &#92;)</span>. Then both <span>&#92;( F &#92;)</span> and <span>&#92;( F^{-1} &#92;)</span> are Lipschitz continuous.

**Proof.** Setting <span>&#92;( M = (\sum&#95;k \|u&#95;k\|^2)^{1/2} &#92;)</span>, Cauchy-Schwarz gives <span>&#92;( \|F(t)\| \leq M\|t\| &#92;)</span>, so <span>&#92;( F &#92;)</span> is Lipschitz. The map <span>&#92;( G = \|\cdot\| \circ F : \mathbb{R}^n \to \mathbb{R} &#92;)</span> is continuous, so attains its minimum <span>&#92;( m > 0 &#92;)</span> on the compact unit sphere. For all <span>&#92;( t \in \mathbb{R}^n &#92;)</span>, <span>&#92;( \|F(t)\| \geq m\|t\| &#92;)</span>, which gives <span>&#92;( \|F^{-1}(x)\| \leq \frac{1}{m}\|x\| &#92;)</span> and Lipschitz continuity of <span>&#92;( F^{-1} &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Corollary 3.3.** When <span>&#92;( U &#92;)</span> and <span>&#92;( V &#92;)</span> are finite-dimensional normed spaces, every linear map <span>&#92;( F : U \to V &#92;)</span> is Lipschitz continuous.

**Corollary 3.4.** On a finite-dimensional vector space, any two norms induce the same topology, and convergence in one norm is equivalent to convergence in any other.

**Definition 3.5.** For a metric space <span>&#92;( Y &#92;)</span> and <span>&#92;( \emptyset \neq X \subseteq Y &#92;)</span>, the **distance** from <span>&#92;( y \in Y &#92;)</span> to <span>&#92;( X &#92;)</span> is <span>&#92;( d(y, X) = \inf\{d(y,x) \mid x \in X\} &#92;)</span>. When <span>&#92;( X &#92;)</span> is compact, the infimum is attained.

**Theorem 3.6.** Let <span>&#92;( W &#92;)</span> be a normed space and <span>&#92;( U \subseteq W &#92;)</span> finite-dimensional. Then for every <span>&#92;( w \in W &#92;)</span> there exists <span>&#92;( u \in U &#92;)</span> with <span>&#92;( d(w,u) = d(w,U) &#92;)</span>.

**Lemma 3.7 (Riesz's Lemma).** Let <span>&#92;( W &#92;)</span> be a normed space and <span>&#92;( U \subsetneq W &#92;)</span> a proper closed subspace. For every <span>&#92;( 0 < r < 1 &#92;)</span> there exists <span>&#92;( w \in W \setminus U &#92;)</span> with <span>&#92;( \|w\| = 1 &#92;)</span> and <span>&#92;( d(w, U) \geq r &#92;)</span>.

**Proof.** Choose <span>&#92;( v \in W \setminus U &#92;)</span>. Let <span>&#92;( d = d(v, U) > 0 &#92;)</span>. Choose <span>&#92;( u \in U &#92;)</span> with <span>&#92;( \|v-u\| < d/r &#92;)</span>. Let <span>&#92;( w = (v-u)/\|v-u\| &#92;)</span>. For any <span>&#92;( x \in U &#92;)</span>, <span>&#92;( \|x - w\| = \|v - u\|^{-1} \cdot \|v - (u + \|v-u\|x)\| \geq d/(d/r) = r &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Theorem 3.8 (Riesz's Theorem).** A normed linear space <span>&#92;( U &#92;)</span> is finite-dimensional if and only if its closed unit ball is compact.

**Proof.** If <span>&#92;( U &#92;)</span> is finite-dimensional: via the isomorphism <span>&#92;( F : \mathbb{R}^n \to U &#92;)</span> of Theorem 3.2, the preimage of <span>&#92;( B(0,1) &#92;)</span> under <span>&#92;( F &#92;)</span> is closed and bounded in <span>&#92;( \mathbb{R}^n &#92;)</span>, hence compact; since <span>&#92;( F &#92;)</span> is a homeomorphism, <span>&#92;( B(0,1) &#92;)</span> is compact. If <span>&#92;( U &#92;)</span> is infinite-dimensional: inductively apply Lemma 3.7 to produce a sequence <span>&#92;( (u&#95;n) &#92;)</span> with <span>&#92;( \|u&#95;n\| = 1 &#92;)</span> and <span>&#92;( \|u&#95;n - u&#95;k\| \geq \frac{1}{2} &#92;)</span> for <span>&#92;( k < n &#92;)</span>, so <span>&#92;( B(0,1) &#92;)</span> has no convergent subsequence. <span>&#92;( \square &#92;)</span>

## The Hahn-Banach Theorem

**Definition 3.9.** A **seminorm** on a vector space <span>&#92;( W &#92;)</span> is a subadditive homogeneous map <span>&#92;( p : W \to \mathbb{R} &#92;)</span>: <span>&#92;( p(x+y) \leq p(x)+p(y) &#92;)</span> and <span>&#92;( p(tx) = |t|p(x) &#92;)</span>.

**Theorem 3.10 (Hahn-Banach, Real Version).** Let <span>&#92;( W &#92;)</span> be a real vector space, <span>&#92;( U \subseteq W &#92;)</span> a subspace, <span>&#92;( p : W \to \mathbb{R} &#92;)</span> subadditive and positively homogeneous. Every linear <span>&#92;( f : U \to \mathbb{R} &#92;)</span> with <span>&#92;( f(x) \leq p(x) &#92;)</span> for all <span>&#92;( x \in U &#92;)</span> extends to a linear <span>&#92;( g : W \to \mathbb{R} &#92;)</span> with <span>&#92;( g(x) \leq p(x) &#92;)</span> for all <span>&#92;( x \in W &#92;)</span>.

**Proof sketch.** One shows that an extension by one dimension is always possible: for <span>&#92;( w \in W \setminus U &#92;)</span> and <span>&#92;( V = U + \operatorname{Span}\{w\} &#92;)</span>, the value <span>&#92;( r = g(w) &#92;)</span> must be chosen to satisfy <span>&#92;( -p(-y-w) - f(y) \leq r \leq p(x+w) - f(x) &#92;)</span> for all <span>&#92;( x, y \in U &#92;)</span>; subadditivity ensures this interval is nonempty. An application of Zorn's Lemma on the poset of dominated extensions then produces a maximal (hence total) extension. <span>&#92;( \square &#92;)</span>

**Theorem 3.11 (Hahn-Banach, Complex Version).** Let <span>&#92;( W &#92;)</span> be a vector space over <span>&#92;( \mathbb{F} &#92;)</span>, <span>&#92;( U \subseteq W &#92;)</span> a subspace, and <span>&#92;( p &#92;)</span> a seminorm on <span>&#92;( W &#92;)</span>. Every linear <span>&#92;( f : U \to \mathbb{F} &#92;)</span> with <span>&#92;( |f(x)| \leq p(x) &#92;)</span> for all <span>&#92;( x \in U &#92;)</span> extends to a linear <span>&#92;( g : W \to \mathbb{F} &#92;)</span> with <span>&#92;( |g(x)| \leq p(x) &#92;)</span> for all <span>&#92;( x \in W &#92;)</span>.

**Proof.** The real case is Theorem 3.10. For <span>&#92;( \mathbb{F} = \mathbb{C} &#92;)</span>: write <span>&#92;( f = u + iv &#92;)</span> where <span>&#92;( u, v : U \to \mathbb{R} &#92;)</span>. Note <span>&#92;( f(x) = u(x) - iu(ix) &#92;)</span>. Extend <span>&#92;( u &#92;)</span> to <span>&#92;( w : W \to \mathbb{R} &#92;)</span> by the real theorem, then set <span>&#92;( g(x) = w(x) - iw(ix) &#92;)</span>. One verifies <span>&#92;( g &#92;)</span> is <span>&#92;( \mathbb{C} &#92;)</span>-linear and <span>&#92;( |g(x)| = \operatorname{Re}(g(e^{-i\theta}x)) = w(e^{-i\theta}x) \leq p(e^{-i\theta}x) = p(x) &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Theorem 3.12 (Hahn-Banach for Bounded Functionals).** Let <span>&#92;( W &#92;)</span> be a normed space and <span>&#92;( U \subseteq W &#92;)</span> a subspace. Every <span>&#92;( f \in U^&#42; &#92;)</span> extends to <span>&#92;( g \in W^&#42; &#92;)</span> with <span>&#92;( \|g\| = \|f\| &#92;)</span>.

**Proof.** Apply Theorem 3.11 with <span>&#92;( p(x) = \|f\|\,\|x\| &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Corollary 3.13.** For any <span>&#92;( 0 \neq w \in W &#92;)</span>, there exists <span>&#92;( g \in W^&#42; &#92;)</span> with <span>&#92;( g(w) = \|w\| &#92;)</span> and <span>&#92;( \|g\| = 1 &#92;)</span>.

**Proof.** Define <span>&#92;( f : \operatorname{Span}\{w\} \to \mathbb{F} &#92;)</span> by <span>&#92;( f(tw) = t\|w\| &#92;)</span>, so <span>&#92;( \|f\| = 1 &#92;)</span>. Extend by Theorem 3.12. <span>&#92;( \square &#92;)</span>

**Corollary 3.14.** Let <span>&#92;( U \subsetneq W &#92;)</span> be a proper closed subspace and <span>&#92;( w \in W \setminus U &#92;)</span>. There exists <span>&#92;( g \in W^&#42; &#92;)</span> with <span>&#92;( \|g\| = 1 &#92;)</span>, <span>&#92;( g(w) = d(w, U) &#92;)</span>, and <span>&#92;( g(u) = 0 &#92;)</span> for all <span>&#92;( u \in U &#92;)</span>.

**Corollary 3.15.** If <span>&#92;( W^&#42; &#92;)</span> is separable then <span>&#92;( W &#92;)</span> is separable.

**Proof.** Let <span>&#92;( (f&#95;n) &#92;)</span> be dense in <span>&#92;( W^&#42; &#92;)</span>. For each <span>&#92;( n &#92;)</span>, pick <span>&#92;( u&#95;n \in W &#92;)</span> with <span>&#92;( \|u&#95;n\| = 1 &#92;)</span> and <span>&#92;( f&#95;n(u&#95;n) > \frac{1}{2}\|f&#95;n\| &#92;)</span>. Claim <span>&#92;( \overline{\operatorname{Span}\{u&#95;n\}} = W &#92;)</span>: if not, Corollary 3.14 gives <span>&#92;( g \in W^&#42; &#92;)</span> with <span>&#92;( \|g\|=1 &#92;)</span> vanishing on all <span>&#92;( u&#95;n &#92;)</span>. Since <span>&#92;( (f&#95;n) &#92;)</span> is dense, choose <span>&#92;( n &#92;)</span> with <span>&#92;( \|f_n - g\| < \frac{1}{3} &#92;)</span>. Then <span>&#92;( \frac{1}{3} < \frac{1}{2}\|f_n\| < f_n(u_n) = (f_n-g)(u_n) \leq \|f_n-g\| < \frac{1}{3} &#92;)</span>, a contradiction. <span>&#92;( \square &#92;)</span>

**Note 3.16.** Since <span>&#92;( \ell^1 &#92;)</span> is separable but <span>&#92;( \ell^\infty &#92;)</span> is not, Corollary 3.15 implies <span>&#92;( F : \ell^1 \to (\ell^\infty)^&#42; &#92;)</span> of Theorem 1.28 is not surjective (for if it were, <span>&#92;( (\ell^\infty)^&#42; \cong \ell^1 &#92;)</span> would be separable, forcing <span>&#92;( \ell^\infty &#92;)</span> to be separable).

## The Hahn-Banach Separation Theorem

**Definition 3.17.** A point <span>&#92;( a \in A &#92;)</span> in a real vector space is an **internal point** of <span>&#92;( A &#92;)</span> when for every <span>&#92;( u \in U &#92;)</span> there exists <span>&#92;( r > 0 &#92;)</span> with <span>&#92;( a + tu \in A &#92;)</span> for all <span>&#92;( t \in (-r,r) &#92;)</span>. The set of internal points is the **core** of <span>&#92;( A &#92;)</span>, denoted <span>&#92;( \operatorname{Core}(A) &#92;)</span>. The interior of <span>&#92;( A &#92;)</span> is always contained in its core.

**Definition 3.18 (Minkowski Functional).** Let <span>&#92;( U &#92;)</span> be a real vector space and <span>&#92;( A \subseteq U &#92;)</span> convex with <span>&#92;( 0 \in \operatorname{Core}(A) &#92;)</span>. The **Minkowski functional** of <span>&#92;( A &#92;)</span> is
<span>&#92;[ p&#95;A(x) = \inf\left\{ r > 0 \;\Big|\; \tfrac{1}{r}x \in A \right\}. &#92;]</span>

**Theorem 3.19.** The Minkowski functional of a convex set with <span>&#92;( 0 &#92;)</span> in its core is positively homogeneous and subadditive.

**Theorem 3.20 (Hahn-Banach Separation Theorem).** Let <span>&#92;( U &#92;)</span> be a real vector space and <span>&#92;( A, B \subseteq U &#92;)</span> disjoint nonempty convex sets with <span>&#92;( \operatorname{Core}(A) \neq \emptyset &#92;)</span>. Then there exists a nonzero linear <span>&#92;( f : U \to \mathbb{R} &#92;)</span> with <span>&#92;( f(x) \leq f(y) &#92;)</span> for all <span>&#92;( x \in A &#92;)</span>, <span>&#92;( y \in B &#92;)</span>.

**Proof sketch.** Let <span>&#92;( C = A - B - a + b &#92;)</span> (translating so <span>&#92;( 0 \in \operatorname{Core}(C) &#92;)</span> and <span>&#92;( b-a \notin C &#92;)</span>). The Minkowski functional <span>&#92;( p &#92;)</span> of <span>&#92;( C &#92;)</span> satisfies <span>&#92;( p(b-a) \geq 1 &#92;)</span>. Define <span>&#92;( f(t(b-a)) = t \cdot p(b-a) &#92;)</span>; this satisfies <span>&#92;( f \leq p &#92;)</span> on <span>&#92;( \operatorname{Span}\{b-a\} &#92;)</span>. Extend by Theorem 3.10. For <span>&#92;( x \in A &#92;)</span>, <span>&#92;( y \in B &#92;)</span>: <span>&#92;( x - y - a + b \in C &#92;)</span> so <span>&#92;( p(x-y-a+b) \leq 1 \leq p(b-a) &#92;)</span>, yielding <span>&#92;( f(x) \leq f(y) &#92;)</span>. <span>&#92;( \square &#92;)</span>

## The Riesz Representation Theorem for <span>&#92;( C[a,b]^&#42; &#92;)</span>

**Definition 3.22 (Bounded Variation).** For <span>&#92;( f : [a,b] \to \mathbb{R} &#92;)</span> and a partition <span>&#92;( P = (x&#95;0, \ldots, x&#95;n) &#92;)</span>, define <span>&#92;( V(f,P) = \sum&#95;{k=1}^n |f(x&#95;k) - f(x&#95;{k-1})| &#92;)</span>. The **total variation** is <span>&#92;( V(f,[a,b]) = \sup&#95;P V(f,P) &#92;)</span>. We say <span>&#92;( f &#92;)</span> is of **bounded variation** when <span>&#92;( V(f,[a,b]) < \infty &#92;)</span>; the space is denoted <span>&#92;( BV[a,b] &#92;)</span>.

**Definition 3.24 (Riemann-Stieltjes Integral).** For <span>&#92;( g \in BV[a,b] &#92;)</span> and <span>&#92;( f \in C[a,b] &#92;)</span>, the **Riemann-Stieltjes integral** is
<span>&#92;[ \int&#95;a^b f\,dg = \lim&#95;{\|P\|\to 0} \sum&#95;{k=1}^n f(t&#95;k)(g(x&#95;k) - g(x&#95;{k-1})). &#92;]</span>
One can show this limit exists and satisfies <span>&#92;( |\int&#95;a^b f\,dg| \leq V(g,[a,b]) \cdot \|f\|&#95;\infty &#92;)</span>.

**Theorem 3.26 (Riesz Representation for <span>&#92;( C[a,b]^&#42; &#92;)</span>).** For every <span>&#92;( L \in C[a,b]^&#42; &#92;)</span> there exists <span>&#92;( g \in BV[a,b] &#92;)</span> with <span>&#92;( g(a) = 0 &#92;)</span>, <span>&#92;( V(g,[a,b]) = \|L\| &#92;)</span>, and
<span>&#92;[ L(f) = \int&#95;a^b f\,dg \quad \forall f \in C[a,b]. &#92;]</span>

**Proof sketch.** Extend <span>&#92;( L &#92;)</span> to <span>&#92;( M \in B[a,b]^&#42; &#92;)</span> with <span>&#92;( \|M\| = \|L\| &#92;)</span>. Define <span>&#92;( g(x) = M(s&#95;x) &#92;)</span> where <span>&#92;( s&#95;x &#92;)</span> is the step function <span>&#92;( s&#95;x(t) = \mathbf{1}&#95;{t \leq x} &#92;)</span>. Show <span>&#92;( g \in BV[a,b] &#92;)</span> by estimating variation against <span>&#92;( \|M\| &#92;)</span>. For continuous <span>&#92;( f &#92;)</span>, approximate by step functions <span>&#92;( f&#95;n &#92;)</span> in the supremum norm; then <span>&#92;( M(f) = \lim M(f&#95;n) = \lim \sum f(x&#95;k)(g(x&#95;k)-g(x&#95;{k-1})) = \int&#95;a^b f\,dg &#92;)</span>. <span>&#92;( \square &#92;)</span>

## The Open Mapping Theorem and the Closed Graph Theorem

**Theorem 3.27 (Open Mapping Theorem).** Let <span>&#92;( U &#92;)</span> and <span>&#92;( V &#92;)</span> be Banach spaces and <span>&#92;( F \in B(U,V) &#92;)</span> surjective. Then <span>&#92;( F &#92;)</span> is open: for every open <span>&#92;( A \subseteq U &#92;)</span>, <span>&#92;( F(A) &#92;)</span> is open in <span>&#92;( V &#92;)</span>.

**Proof.** Step 1: Show that for all <span>&#92;( R > 0 &#92;)</span> there exists <span>&#92;( r > 0 &#92;)</span> with <span>&#92;( B(0,r) \subseteq \overline{F(B(0,R))} &#92;)</span>. Since <span>&#92;( V = \bigcup&#95;n \overline{F(B(0,n))} &#92;)</span> and <span>&#92;( V &#92;)</span> is complete, Baire gives some <span>&#92;( \overline{F(B(0,n))} &#92;)</span> with nonempty interior; by scaling <span>&#92;( \overline{F(B(0,1))} &#92;)</span> has nonempty interior. Find <span>&#92;( c, r &#92;)</span> with <span>&#92;( B(c,2r) \subseteq \overline{F(B(0,1))} &#92;)</span>; by symmetry <span>&#92;( B(0,r) \subseteq \overline{F(B(0,2))} &#92;)</span>.

Step 2: Lift the closure: show <span>&#92;( B(0,r) \subseteq F(B(0,1)) &#92;)</span> by an iterative approximation. Given <span>&#92;( y \in B(0,r) &#92;)</span>, find <span>&#92;( x&#95;1 \in B(0,\frac{1}{2}) &#92;)</span> with <span>&#92;( \|y - Fx_1\| < \frac{r}{2} &#92;)</span>, then <span>&#92;( x&#95;2 \in B(0,\frac{1}{4}) &#92;)</span> with <span>&#92;( \|y - F(x_1+x_2)\| < \frac{r}{4} &#92;)</span>, etc. The series <span>&#92;( u = \sum x&#95;k &#92;)</span> converges in <span>&#92;( U &#92;)</span> (since <span>&#92;( \sum \|x_k\| < 1 &#92;)</span>) and <span>&#92;( Fu = y &#92;)</span>.

Step 3: For open <span>&#92;( A \subseteq U &#92;)</span> and <span>&#92;( v = Fu \in F(A) &#92;)</span> with <span>&#92;( B(u,R) \subseteq A &#92;)</span>, find <span>&#92;( r &#92;)</span> with <span>&#92;( B(0,r) \subseteq F(B(0,R)) &#92;)</span>; then <span>&#92;( B(v,r) \subseteq F(A) &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Definition 3.28 (Equivalent Norms).** Two norms on a vector space <span>&#92;( U &#92;)</span> are **equivalent** when they induce the same topology, i.e., when there exist <span>&#92;( \ell, m > 0 &#92;)</span> with <span>&#92;( \|x\|&#95;2 \leq \ell\|x\|&#95;1 &#92;)</span> and <span>&#92;( \|x\|&#95;1 \leq m\|x\|&#95;2 &#92;)</span> for all <span>&#92;( x &#92;)</span>.

**Corollary 3.29.** Let <span>&#92;( U &#92;)</span> be complete under norms <span>&#92;( \|\cdot\|&#95;1 &#92;)</span> and <span>&#92;( \|\cdot\|&#95;2 &#92;)</span>. If <span>&#92;( \|x\|&#95;2 \leq \ell\|x\|&#95;1 &#92;)</span> for all <span>&#92;( x &#92;)</span>, then the two norms are equivalent.

**Proof.** The identity <span>&#92;( I : (U,\|\cdot\|&#95;1) \to (U,\|\cdot\|&#95;2) &#92;)</span> is continuous (bounded) and surjective, hence open by the Open Mapping Theorem. So its inverse is also continuous. <span>&#92;( \square &#92;)</span>

**Definition 3.31 (Closed Graph).** A linear map <span>&#92;( F : U \to V &#92;)</span> has a **closed graph** when for every sequence <span>&#92;( (x&#95;n) &#92;)</span>, if <span>&#92;( x&#95;n \to a &#92;)</span> in <span>&#92;( U &#92;)</span> and <span>&#92;( Fx&#95;n \to b &#92;)</span> in <span>&#92;( V &#92;)</span>, then <span>&#92;( b = Fa &#92;)</span>.

**Theorem 3.32 (Closed Graph Theorem).** Let <span>&#92;( U &#92;)</span> and <span>&#92;( V &#92;)</span> be Banach spaces and <span>&#92;( F : U \to V &#92;)</span> linear. If <span>&#92;( F &#92;)</span> has a closed graph, then <span>&#92;( F &#92;)</span> is continuous (bounded).

**Proof.** Define a second norm on <span>&#92;( U &#92;)</span> by <span>&#92;( \|x\|&#95;3 = \|x\|&#95;1 + \|Fx\|&#95;2 &#92;)</span>. If <span>&#92;( (x&#95;n) &#92;)</span> is Cauchy in <span>&#92;( \|\cdot\|&#95;3 &#92;)</span>, it is Cauchy in both <span>&#92;( \|\cdot\|&#95;1 &#92;)</span> and <span>&#92;( \|\cdot\|&#95;2 &#92;)</span>, so <span>&#92;( x&#95;n \to a &#92;)</span> and <span>&#92;( Fx&#95;n \to b &#92;)</span>. Since <span>&#92;( F &#92;)</span> has closed graph, <span>&#92;( b = Fa &#92;)</span>, and <span>&#92;( x&#95;n \to a &#92;)</span> in <span>&#92;( \|\cdot\|&#95;3 &#92;)</span>. So <span>&#92;( (U, \|\cdot\|&#95;3) &#92;)</span> is complete. Since <span>&#92;( \|x\|&#95;1 \leq \|x\|&#95;3 &#92;)</span>, Corollary 3.29 gives <span>&#92;( \ell &#92;)</span> with <span>&#92;( \|x\|&#95;3 \leq \ell\|x\|&#95;1 &#92;)</span>. Then <span>&#92;( \|Fx\|&#95;2 \leq \|x\|&#95;3 \leq \ell\|x\|&#95;1 &#92;)</span>, so <span>&#92;( F &#92;)</span> is bounded. <span>&#92;( \square &#92;)</span>

---

# Chapter 4: Topology

## Topological Spaces and Bases

**Definition 4.1 (Topology).** A **topology** on a set <span>&#92;( X &#92;)</span> is a collection <span>&#92;( \mathcal{T} &#92;)</span> of subsets of <span>&#92;( X &#92;)</span> (the **open sets**) such that: (1) <span>&#92;( \emptyset, X \in \mathcal{T} &#92;)</span>; (2) <span>&#92;( \mathcal{T} &#92;)</span> is closed under arbitrary unions; (3) <span>&#92;( \mathcal{T} &#92;)</span> is closed under finite intersections. A subset <span>&#92;( A \subseteq X &#92;)</span> is **closed** when <span>&#92;( A^c \in \mathcal{T} &#92;)</span>. The **interior** <span>&#92;( A^\circ &#92;)</span> is the largest open set contained in <span>&#92;( A &#92;)</span>; the **closure** <span>&#92;( \overline{A} &#92;)</span> is the smallest closed set containing <span>&#92;( A &#92;)</span>.

A topology <span>&#92;( \mathcal{S} &#92;)</span> is **coarser** than <span>&#92;( \mathcal{T} &#92;)</span> (and <span>&#92;( \mathcal{T} &#92;)</span> is **finer**) when <span>&#92;( \mathcal{S} \subseteq \mathcal{T} &#92;)</span>. Given any collection <span>&#92;( \mathcal{S} &#92;)</span> of subsets of <span>&#92;( X &#92;)</span>, there is a unique coarsest topology containing <span>&#92;( \mathcal{S} &#92;)</span> (the **topology generated by** <span>&#92;( \mathcal{S} &#92;)</span>), consisting of arbitrary unions of finite intersections of elements of <span>&#92;( \mathcal{S} &#92;)</span>.

A **basis** for a topology on <span>&#92;( X &#92;)</span> is a collection <span>&#92;( \mathcal{B} &#92;)</span> with: (1) <span>&#92;( X = \bigcup \mathcal{B} &#92;)</span>; (2) for all <span>&#92;( U, V \in \mathcal{B} &#92;)</span> and <span>&#92;( a \in U \cap V &#92;)</span>, there exists <span>&#92;( W \in \mathcal{B} &#92;)</span> with <span>&#92;( a \in W \subseteq U \cap V &#92;)</span>.

**Theorem 4.2.** Let <span>&#92;( \mathcal{B} &#92;)</span> be a basis generating topology <span>&#92;( \mathcal{T} &#92;)</span>. Then <span>&#92;( A \in \mathcal{T} &#92;)</span> iff for every <span>&#92;( a \in A &#92;)</span> there exists <span>&#92;( U \in \mathcal{B} &#92;)</span> with <span>&#92;( a \in U \subseteq A &#92;)</span>, equivalently iff <span>&#92;( A &#92;)</span> is a union of elements of <span>&#92;( \mathcal{B} &#92;)</span>.

**Example 4.3.** In a metric space <span>&#92;( X &#92;)</span>, the collection of open balls <span>&#92;( \{B(a,r) \mid a \in X, r > 0\} &#92;)</span> is a basis for the metric topology.

**Theorem 4.4.** Let <span>&#92;( X &#92;)</span> be a topological space with basis <span>&#92;( \mathcal{B} &#92;)</span>, and <span>&#92;( A \subseteq X &#92;)</span>. Then <span>&#92;( a \in \overline{A} &#92;)</span> if and only if <span>&#92;( A \cap U \neq \emptyset &#92;)</span> for every <span>&#92;( U \in \mathcal{B} &#92;)</span> with <span>&#92;( a \in U &#92;)</span>.

**Example 4.5 (Subspace Topology).** When <span>&#92;( X \subseteq Y &#92;)</span> and <span>&#92;( Y &#92;)</span> has topology <span>&#92;( \mathcal{T} &#92;)</span>, the **subspace topology** on <span>&#92;( X &#92;)</span> is <span>&#92;( \{V \cap X \mid V \in \mathcal{T}\} &#92;)</span>.

**Example 4.6 (Product Topology).** For topological spaces <span>&#92;( X, Y &#92;)</span>, the **product topology** on <span>&#92;( X \times Y &#92;)</span> has basis <span>&#92;( \{U \times V \mid U \subseteq X, V \subseteq Y \text{ open}\} &#92;)</span>.

**Example 4.7 (Quotient Topology).** For an equivalence relation <span>&#92;( \sim &#92;)</span> on a topological space <span>&#92;( X &#92;)</span> with quotient map <span>&#92;( q : X \to X/{\sim} &#92;)</span>, the **quotient topology** is <span>&#92;( \{V \subseteq X/{\sim} \mid q^{-1}(V) \text{ open in } X\} &#92;)</span>.

## Continuous Functions and Compact Sets

**Definition 4.8 (Hausdorff).** A topological space <span>&#92;( X &#92;)</span> is **Hausdorff** when for all distinct <span>&#92;( a, b \in X &#92;)</span> there exist disjoint open sets <span>&#92;( U, V &#92;)</span> with <span>&#92;( a \in U &#92;)</span>, <span>&#92;( b \in V &#92;)</span>. All metric spaces are Hausdorff.

**Definition 4.10 (Continuity).** A function <span>&#92;( f : X \to Y &#92;)</span> between topological spaces is **continuous** when <span>&#92;( f^{-1}(V) &#92;)</span> is open in <span>&#92;( X &#92;)</span> for every open <span>&#92;( V \subseteq Y &#92;)</span>.

**Definition 4.11 (Compactness).** A subset <span>&#92;( A \subseteq X &#92;)</span> is **compact** when every open cover of <span>&#92;( A &#92;)</span> has a finite subcover.

**Theorem 4.12.** A subset <span>&#92;( A \subseteq X \subseteq Y &#92;)</span> is compact in <span>&#92;( X &#92;)</span> (with the subspace topology) iff it is compact in <span>&#92;( Y &#92;)</span>.

**Theorem 4.15.** A topological space <span>&#92;( X &#92;)</span> is compact iff it has the **finite intersection property on closed sets**: every collection of closed sets with the property that every finite subcollection has nonempty intersection has nonempty total intersection.

**Theorem 4.16.** Every closed subspace of a compact space is compact.

**Theorem 4.17.** Every compact subspace of a Hausdorff space is closed.

**Theorem 4.18.** The continuous image of a compact space is compact.

**Theorem 4.20 (Extreme Value Theorem).** A continuous map <span>&#92;( f : X \to \mathbb{R} &#92;)</span> on a compact space attains its maximum and minimum.

**Theorem 4.21.** Let <span>&#92;( X &#92;)</span> be compact, <span>&#92;( Y &#92;)</span> Hausdorff, and <span>&#92;( f : X \to Y &#92;)</span> continuous and bijective. Then <span>&#92;( f &#92;)</span> is a homeomorphism.

## Urysohn's Lemma and the Tietze Extension Theorem

**Definition 4.23 (Normal Space).** A topological space is **normal** when all one-point sets are closed and for all disjoint closed sets <span>&#92;( A, B &#92;)</span> there exist disjoint open sets <span>&#92;( U, V &#92;)</span> with <span>&#92;( A \subseteq U &#92;)</span>, <span>&#92;( B \subseteq V &#92;)</span>. All metric spaces are normal.

**Theorem 4.25 (Urysohn's Lemma).** Let <span>&#92;( X &#92;)</span> be normal and <span>&#92;( A, B \subseteq X &#92;)</span> disjoint and closed. There exists a continuous <span>&#92;( f : X \to [0,1] &#92;)</span> with <span>&#92;( f|&#95;A = 0 &#92;)</span> and <span>&#92;( f|&#95;B = 1 &#92;)</span>.

**Proof sketch.** Enumerate <span>&#92;( [0,1] \cap \mathbb{Q} = \{a&#95;0, a&#95;1, a&#95;2, \ldots\} &#92;)</span> with <span>&#92;( a&#95;0 = 0, a&#95;1 = 1 &#92;)</span>. Inductively construct open sets <span>&#92;( U&#95;r &#92;)</span> for each <span>&#92;( r \in [0,1] \cap \mathbb{Q} &#92;)</span> such that <span>&#92;( r < s \implies \overline{U_r} \subseteq U_s &#92;)</span>, with <span>&#92;( A \subseteq U&#95;0 &#92;)</span> and <span>&#92;( B \cap U&#95;1 = \emptyset &#92;)</span>. Define <span>&#92;( f(x) = \inf\{r \in \mathbb{Q} \mid x \in U&#95;r\} &#92;)</span> and verify continuity by showing preimages of open intervals are open. <span>&#92;( \square &#92;)</span>

**Theorem 4.26 (Tietze Extension Theorem).** Let <span>&#92;( X &#92;)</span> be normal, <span>&#92;( A \subseteq X &#92;)</span> closed, and <span>&#92;( a < b &#92;)</span>.
1. Every continuous <span>&#92;( f : A \to [a,b] &#92;)</span> extends to continuous <span>&#92;( g : X \to [a,b] &#92;)</span>.
2. Every continuous <span>&#92;( f : A \to (a,b) &#92;)</span> extends to continuous <span>&#92;( g : X \to (a,b) &#92;)</span>.

**Proof sketch of (1).** WLOG <span>&#92;( [a,b] = [-1,1] &#92;)</span>. Inductively, apply Urysohn's Lemma to construct a continuous approximation <span>&#92;( g&#95;1 : X \to [-\frac{1}{3}, \frac{1}{3}] &#92;)</span> with <span>&#92;( \|f - g&#95;1|&#95;A\|&#95;\infty \leq \frac{2}{3} &#92;)</span>. Repeat on the residual <span>&#92;( f - g&#95;1|&#95;A &#92;)</span> scaled by <span>&#92;( \frac{2}{3} &#92;)</span>, obtaining <span>&#92;( g&#95;2 &#92;)</span> with <span>&#92;( \|g&#95;k\|&#95;\infty \leq \frac{2^{k-1}}{3^k} &#92;)</span>. The series <span>&#92;( g = \sum&#95;k g&#95;k &#92;)</span> converges uniformly (Weierstrass M-test), defines a continuous extension with <span>&#92;( \|g\|&#95;\infty \leq \sum \frac{2^{k-1}}{3^k} = 1 &#92;)</span>. <span>&#92;( \square &#92;)</span>

## Infinite Products and Tychonoff's Theorem

**Definition 4.27.** The **cartesian product** <span>&#92;( \prod&#95;{k \in K} X&#95;k &#92;)</span> is the set of all indexed families <span>&#92;( (a&#95;k)&#95;{k \in K} &#92;)</span> with <span>&#92;( a&#95;k \in X&#95;k &#92;)</span>. When each <span>&#92;( X&#95;k &#92;)</span> is a topological space, the **product topology** has basis
<span>&#92;[ \left\{ \prod&#95;{k \in K} U&#95;k \;\Big|\; U&#95;k \subseteq X&#95;k \text{ open}, \; U&#95;k = X&#95;k \text{ for all but finitely many } k \right\}. &#92;]</span>
The coarser product topology differs from the finer **box topology** (which allows arbitrary open <span>&#92;( U&#95;k &#92;)</span> at every index) when <span>&#92;( K &#92;)</span> is infinite.

**Theorem 4.29.** A function <span>&#92;( f : A \to \prod&#95;{k \in K} X&#95;k &#92;)</span> (with the product topology) is continuous iff each component <span>&#92;( f&#95;k = p&#95;k \circ f : A \to X&#95;k &#92;)</span> is continuous, where <span>&#92;( p&#95;k &#92;)</span> is the projection.

**Theorem 4.31 (Tychonoff's Theorem).** The product of any indexed family of compact spaces is compact in the product topology.

**Proof sketch.** Using Zorn's Lemma, extend any collection <span>&#92;( \mathcal{T} &#92;)</span> of closed sets with the finite intersection property to a maximal such collection <span>&#92;( \mathcal{S} &#92;)</span> (closed under finite intersections). For each <span>&#92;( k &#92;)</span>, the collection <span>&#92;( \{p&#95;k(A) \mid A \in \mathcal{S}\} &#92;)</span> of projected sets still has the finite intersection property in the compact space <span>&#92;( X&#95;k &#92;)</span>, so choose <span>&#92;( a&#95;k \in \bigcap&#95;{A \in \mathcal{S}} \overline{p&#95;k(A)} &#92;)</span>. The point <span>&#92;( a = (a&#95;k) &#92;)</span> lies in every <span>&#92;( A \in \mathcal{S} &#92;)</span> (because every basic open neighbourhood of <span>&#92;( a &#92;)</span> meets every <span>&#92;( A \in \mathcal{S} &#92;)</span>), hence in every element of <span>&#92;( \mathcal{T} &#92;)</span>. <span>&#92;( \square &#92;)</span>

## Nets

**Definition 4.32.** A **directed set** is a set <span>&#92;( K &#92;)</span> with a binary relation <span>&#92;( \leq &#92;)</span> that is reflexive, transitive, and directed (for all <span>&#92;( a, b &#92;)</span> there exists <span>&#92;( c &#92;)</span> with <span>&#92;( a \leq c &#92;)</span> and <span>&#92;( b \leq c &#92;)</span>). A **net** in a topological space <span>&#92;( X &#92;)</span> is an indexed family <span>&#92;( (x&#95;k)&#95;{k \in K} &#92;)</span> where <span>&#92;( K &#92;)</span> is directed. A net **converges** to <span>&#92;( a \in X &#92;)</span> when for every open <span>&#92;( U \ni a &#92;)</span> there exists <span>&#92;( m \in K &#92;)</span> such that <span>&#92;( k \geq m \implies x&#95;k \in U &#92;)</span>.

**Theorem 4.34.** Let <span>&#92;( X &#92;)</span> be a topological space, <span>&#92;( A \subseteq X &#92;)</span>, <span>&#92;( a \in X &#92;)</span>. Then <span>&#92;( a \in \overline{A} &#92;)</span> iff there is a net <span>&#92;( (x&#95;k) &#92;)</span> in <span>&#92;( A &#92;)</span> with <span>&#92;( x&#95;k \to a &#92;)</span>.

**Theorem 4.35.** Let <span>&#92;( f : A \subseteq X \to Y &#92;)</span>. Then <span>&#92;( f &#92;)</span> is continuous on <span>&#92;( A &#92;)</span> iff for every net <span>&#92;( (x&#95;k) &#92;)</span> in <span>&#92;( A &#92;)</span> with <span>&#92;( x&#95;k \to a \in A &#92;)</span>, we have <span>&#92;( f(x&#95;k) \to f(a) &#92;)</span> in <span>&#92;( Y &#92;)</span>.

## Strong and Weak Topologies and the Banach-Alaoglu Theorem

**Definition 4.36 (Final/Strong Topology).** Given functions <span>&#92;( f&#95;k : X&#95;k \to Y &#92;)</span>, the **final (strong) topology** on <span>&#92;( Y &#92;)</span> is the finest topology making all <span>&#92;( f&#95;k &#92;)</span> continuous.

**Definition 4.38 (Initial/Weak Topology).** Given functions <span>&#92;( f&#95;k : X \to Y&#95;k &#92;)</span>, the **initial (weak) topology** on <span>&#92;( X &#92;)</span> is the coarsest topology making all <span>&#92;( f&#95;k &#92;)</span> continuous — the topology generated by <span>&#92;( \{f&#95;k^{-1}(U) \mid k \in K, \; U \subseteq Y&#95;k \text{ open}\} &#92;)</span>.

**Definition 4.41 (Weak and Weak<span>&#92;( ^&#42; &#92;)</span> Topologies).** Let <span>&#92;( U &#92;)</span> be a normed space.
- The **weak topology** on <span>&#92;( U &#92;)</span> is the initial topology with respect to <span>&#92;( (f)&#95;{f \in U^&#42;} &#92;)</span>.
- The **weak<span>&#92;( ^&#42; &#92;)</span> topology** on <span>&#92;( U^&#42; &#92;)</span> is the initial topology with respect to <span>&#92;( (F&#95;u)&#95;{u \in U} &#92;)</span> where <span>&#92;( F&#95;u(f) = f(u) &#92;)</span>.

**Theorem 4.42.** In a normed space <span>&#92;( U &#92;)</span>:
1. <span>&#92;( x&#95;k \to a &#92;)</span> in the weak topology iff <span>&#92;( f(x&#95;k) \to f(a) &#92;)</span> for all <span>&#92;( f \in U^&#42; &#92;)</span>.
2. <span>&#92;( f&#95;k \to g &#92;)</span> in <span>&#92;( U^&#42; &#92;)</span> with the weak<span>&#92;( ^&#42; &#92;)</span> topology iff <span>&#92;( f&#95;k(x) \to g(x) &#92;)</span> for all <span>&#92;( x \in U &#92;)</span>.

**Remark 4.43.** When <span>&#92;( U &#92;)</span> is infinite-dimensional, the closed unit ball <span>&#92;( B&#95;{U^&#42;}(0,1) &#92;)</span> is **not** compact in the norm topology on <span>&#92;( U^&#42; &#92;)</span> (by Riesz's Theorem 3.8). The Banach-Alaoglu Theorem shows it is compact in a weaker topology.

**Theorem 4.44 (Banach-Alaoglu Theorem).** For any normed space <span>&#92;( U &#92;)</span>, the closed unit ball <span>&#92;( B&#95;{U^&#42;}(0,1) = \{f \in U^&#42; \mid \|f\| \leq 1\} &#92;)</span> is compact in the weak<span>&#92;( ^&#42; &#92;)</span> topology.

**Proof.** Let <span>&#92;( B = \{x \in U \mid \|x\| \leq 1\} &#92;)</span>, <span>&#92;( D = \{t \in \mathbb{F} \mid |t| \leq 1\} &#92;)</span>, and <span>&#92;( P = D^B = \prod&#95;{u \in B} D &#92;)</span> with the product topology. The restriction map <span>&#92;( R : B&#95;{U^&#42;}(0,1) \to P &#92;)</span>, <span>&#92;( R(f)(x) = f(x) &#92;)</span>, is injective and continuous (each component <span>&#92;( R&#95;u(f) = f(u) &#92;)</span> is continuous in the weak<span>&#92;( ^&#42; &#92;)</span> topology). The image <span>&#92;( R(B&#95;{U^&#42;}(0,1)) &#92;)</span> is closed in <span>&#92;( P &#92;)</span> (limit points of locally-linear functions on <span>&#92;( B &#92;)</span> extend to linear maps on <span>&#92;( U &#92;)</span>). Since <span>&#92;( D &#92;)</span> is compact, <span>&#92;( P &#92;)</span> is compact by Tychonoff. As a closed subset of a compact space, <span>&#92;( R(B&#95;{U^&#42;}(0,1)) &#92;)</span> is compact. Since <span>&#92;( R &#92;)</span> is a homeomorphism onto its image (its inverse is also continuous), <span>&#92;( B&#95;{U^&#42;}(0,1) &#92;)</span> is compact. <span>&#92;( \square &#92;)</span>

## Locally Convex Topological Vector Spaces

**Definition 4.45.** A **topological vector space** over <span>&#92;( \mathbb{F} &#92;)</span> is a Hausdorff vector space with a topology making addition and scalar multiplication continuous. It is **locally convex** when its topology has a basis of convex sets.

**Example 4.46.** For a normed space <span>&#92;( U &#92;)</span>: the norm topology, the weak topology <span>&#92;( (U, \text{wk}) &#92;)</span>, and the weak<span>&#92;( ^&#42; &#92;)</span> topology <span>&#92;( (U^&#42;, \text{wk}^&#42;) &#92;)</span> are all locally convex topological vector spaces. In particular, the weak topology is Hausdorff (by the Hahn-Banach Theorem, distinct points are separated by functionals) and has a basis of convex sets (finite intersections of sets of the form <span>&#92;( f^{-1}(V) &#92;)</span>).

**Note 4.49.** In a real topological vector space <span>&#92;( U &#92;)</span>, the interior of any set is contained in its core: <span>&#92;( A^\circ \subseteq \operatorname{Core}(A) &#92;)</span>.

**Theorem 4.50 (Hahn-Banach Separation for Topological Vector Spaces).** Let <span>&#92;( U &#92;)</span> be a real topological vector space and <span>&#92;( A, B \subseteq U &#92;)</span> disjoint nonempty convex subsets.
1. If <span>&#92;( A &#92;)</span> is open, there exists <span>&#92;( 0 \neq f \in U^&#42; &#92;)</span> and <span>&#92;( c \in \mathbb{R} &#92;)</span> with <span>&#92;( f(x) < c \leq f(y) &#92;)</span> for all <span>&#92;( x \in A &#92;)</span>, <span>&#92;( y \in B &#92;)</span>.
2. If <span>&#92;( U &#92;)</span> is locally convex, <span>&#92;( A &#92;)</span> is compact, and <span>&#92;( B &#92;)</span> is closed, there exists <span>&#92;( 0 \neq f \in U^&#42; &#92;)</span> and <span>&#92;( c \in \mathbb{R} &#92;)</span> with <span>&#92;( f(x) < c < f(y) &#92;)</span> for all <span>&#92;( x \in A &#92;)</span>, <span>&#92;( y \in B &#92;)</span>.

This geometric version of the Hahn-Banach Theorem provides the foundation for convex analysis and duality theory in functional analysis. Part (1) follows from Theorem 3.20 combined with Note 4.49 (which ensures the open set <span>&#92;( A &#92;)</span> is contained in its core). Part (2) uses local convexity to thicken <span>&#92;( A &#92;)</span> slightly and separate it from <span>&#92;( B &#92;)</span> with strict inequalities on both sides.
