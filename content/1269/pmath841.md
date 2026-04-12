---
title: "PMATH 841: Class Field Theory"
subjects: "PMATH"
---

*These notes synthesize material from J.S. Milne's Class Field Theory, J. Neukirch's Algebraic Number Theory, J.W.S. Cassels and A. Fröhlich's Algebraic Number Theory, and N. Childress's Class Field Theory, enriched with material from MIT OCW 18.785-786 (A. Sutherland) and K. Conrad's expository notes.*

---

## Chapter 1: Review of Algebraic Number Theory

### 1.1 Number Fields and Rings of Integers

Class field theory is, at its heart, the crowning achievement of algebraic number theory: it provides a complete classification of abelian extensions of a number field in terms of data intrinsic to the base field. Before we can state — let alone prove — the main theorems, we need a thorough command of the algebraic number theory that forms the foundation of the subject. This opening chapter reviews that foundation, fixing notation and recalling the key results we shall need throughout the course.

A number field is a finite extension of \(\mathbb{Q}\). Equivalently, it is a field \(K\) that is a finite-dimensional \(\mathbb{Q}\)-vector space. The degree \([K:\mathbb{Q}]\) is called the degree of the number field. Number fields arise naturally: whenever \(\alpha\) is an algebraic number (a root of some nonzero polynomial in \(\mathbb{Q}[x]\)), the field \(\mathbb{Q}(\alpha)\) is a number field.

<div class="definition">
<strong>Definition 1.1 (Number Field).</strong> A <em>number field</em> is a field extension \(K/\mathbb{Q}\) with \([K:\mathbb{Q}] < \infty\).
</div>

<div class="definition">
<strong>Definition 1.2 (Algebraic Integer).</strong> An element \(\alpha \in K\) is an <em>algebraic integer</em> if it is a root of a monic polynomial in \(\mathbb{Z}[x]\). The set of all algebraic integers in \(K\) is the <em>ring of integers</em> of \(K\), denoted \(\mathcal{O}_K\).
</div>

The ring of integers \(\mathcal{O}_K\) is a free \(\mathbb{Z}\)-module of rank \([K:\mathbb{Q}]\), and \(K\) is its field of fractions. When \(K = \mathbb{Q}\), we recover \(\mathcal{O}_K = \mathbb{Z}\). For \(K = \mathbb{Q}(\sqrt{d})\) with \(d\) squarefree, we have
\[
\mathcal{O}_K = \begin{cases} \mathbb{Z}[\sqrt{d}] & \text{if } d \equiv 2, 3 \pmod{4}, \\ \mathbb{Z}\!\left[\frac{1+\sqrt{d}}{2}\right] & \text{if } d \equiv 1 \pmod{4}. \end{cases}
\]

<div class="example">
<strong>Example 1.3.</strong> Consider \(K = \mathbb{Q}(\sqrt{-5})\). Since \(-5 \equiv 3 \pmod{4}\), the ring of integers is \(\mathcal{O}_K = \mathbb{Z}[\sqrt{-5}]\). This ring is not a unique factorization domain: we have
\[
6 = 2 \cdot 3 = (1+\sqrt{-5})(1-\sqrt{-5}),
\]
and one can verify that \(2\), \(3\), \(1+\sqrt{-5}\), and \(1-\sqrt{-5}\) are all irreducible in \(\mathcal{O}_K\), yet they are not associates. This failure of unique factorization in elements is precisely what motivated Kummer and Dedekind to develop the theory of ideals, which restores unique factorization at the level of ideals.
</div>

<div class="example">
<strong>Example 1.4.</strong> The cyclotomic field \(K = \mathbb{Q}(\zeta_n)\), where \(\zeta_n = e^{2\pi i/n}\) is a primitive \(n\)-th root of unity, has ring of integers \(\mathcal{O}_K = \mathbb{Z}[\zeta_n]\). The degree \([K:\mathbb{Q}] = \varphi(n)\), where \(\varphi\) is Euler's totient function. The Galois group \(\mathrm{Gal}(K/\mathbb{Q}) \cong (\mathbb{Z}/n\mathbb{Z})^\times\) is abelian, making cyclotomic fields the prototypical examples in class field theory.
</div>

### 1.2 Dedekind Domains and Ideal Theory

The algebraic structure that makes the ideal theory of number fields work so beautifully is that of a Dedekind domain. Rings of integers are the motivating examples, but the abstract framework applies more broadly and will serve us well when we study completions and localizations.

<div class="definition">
<strong>Definition 1.5 (Dedekind Domain).</strong> An integral domain \(R\) is a <em>Dedekind domain</em> if it satisfies:
<ol>
<li>\(R\) is Noetherian,</li>
<li>\(R\) is integrally closed in its field of fractions,</li>
<li>every nonzero prime ideal of \(R\) is maximal.</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem 1.6 (Unique Factorization of Ideals).</strong> Let \(R\) be a Dedekind domain. Every nonzero ideal \(\mathfrak{a}\) of \(R\) factors uniquely (up to order) as a product of prime ideals:
\[
\mathfrak{a} = \mathfrak{p}_1^{e_1} \mathfrak{p}_2^{e_2} \cdots \mathfrak{p}_r^{e_r}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> We sketch the argument. First, one shows that every nonzero ideal of a Dedekind domain contains a product of nonzero prime ideals (using the Noetherian property). Then, using the fact that every nonzero prime ideal is maximal and \(R\) is integrally closed, one constructs the inverse of a prime ideal: for a nonzero prime \(\mathfrak{p}\), define
\[
\mathfrak{p}^{-1} = \{ x \in K : x\mathfrak{p} \subseteq R \},
\]
where \(K = \mathrm{Frac}(R)\). One verifies that \(\mathfrak{p}\mathfrak{p}^{-1} = R\). This makes the set of nonzero fractional ideals into a group, and uniqueness of factorization follows from the cancellation law in this group. \(\square\)
</div>

This unique factorization of ideals is the central structural result of algebraic number theory. It replaces the unique factorization of elements that fails in general rings of integers.

<div class="definition">
<strong>Definition 1.7 (Fractional Ideal).</strong> A <em>fractional ideal</em> of a Dedekind domain \(R\) with fraction field \(K\) is a nonzero finitely generated \(R\)-submodule of \(K\). Equivalently, it is a subset \(\mathfrak{a} \subseteq K\) such that \(d\mathfrak{a} \subseteq R\) for some nonzero \(d \in R\).
</div>

The set of nonzero fractional ideals forms a group under multiplication, with identity \(R\) and inverse of \(\mathfrak{a}\) given by \(\mathfrak{a}^{-1} = \{x \in K : x\mathfrak{a} \subseteq R\}\). The principal fractional ideals — those of the form \(\alpha R\) for \(\alpha \in K^\times\) — form a subgroup.

### 1.3 Splitting of Primes

One of the most important constructions in algebraic number theory is the analysis of how prime ideals in a base field decompose in extensions. This "splitting behavior" is the arithmetic backbone of class field theory: the main theorems will tell us that the splitting of primes in abelian extensions is governed by congruence conditions.

Let \(K \subseteq L\) be an extension of number fields, and let \(\mathfrak{p}\) be a nonzero prime ideal of \(\mathcal{O}_K\). The extended ideal \(\mathfrak{p}\mathcal{O}_L\) factors in \(\mathcal{O}_L\):
\[
\mathfrak{p}\mathcal{O}_L = \mathfrak{P}_1^{e_1} \mathfrak{P}_2^{e_2} \cdots \mathfrak{P}_g^{e_g},
\]
where the \(\mathfrak{P}_i\) are distinct prime ideals of \(\mathcal{O}_L\) lying over \(\mathfrak{p}\).

<div class="definition">
<strong>Definition 1.8 (Ramification Index and Residue Degree).</strong> For each prime \(\mathfrak{P}_i\) lying over \(\mathfrak{p}\):
<ul>
<li>The <em>ramification index</em> is \(e_i = e(\mathfrak{P}_i | \mathfrak{p})\), the exponent of \(\mathfrak{P}_i\) in the factorization of \(\mathfrak{p}\mathcal{O}_L\).</li>
<li>The <em>residue degree</em> (or inertia degree) is \(f_i = f(\mathfrak{P}_i | \mathfrak{p}) = [\mathcal{O}_L/\mathfrak{P}_i : \mathcal{O}_K/\mathfrak{p}]\).</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem 1.9 (Fundamental Identity).</strong> With notation as above,
\[
\sum_{i=1}^{g} e_i f_i = [L:K].
\]
If \(L/K\) is Galois, then all \(e_i\) are equal (say to \(e\)) and all \(f_i\) are equal (say to \(f\)), and the identity becomes \(efg = [L:K]\).
</div>

<div class="definition">
<strong>Definition 1.10 (Splitting Types).</strong> A prime \(\mathfrak{p}\) of \(\mathcal{O}_K\) is said to be:
<ul>
<li><em>split</em> (or totally split) in \(L/K\) if \(g = [L:K]\) (equivalently, \(e_i = f_i = 1\) for all \(i\)),</li>
<li><em>inert</em> in \(L/K\) if \(g = 1\) and \(e_1 = 1\) (so \(f_1 = [L:K]\)),</li>
<li><em>ramified</em> in \(L/K\) if some \(e_i > 1\).</li>
</ul>
</div>

<div class="example">
<strong>Example 1.11.</strong> Consider the extension \(\mathbb{Q}(\sqrt{-5})/\mathbb{Q}\). In \(\mathcal{O}_K = \mathbb{Z}[\sqrt{-5}]\):
<ul>
<li>\((2) = (2, 1+\sqrt{-5})^2\): the prime 2 ramifies.</li>
<li>\((3) = (3, 1+\sqrt{-5})(3, 1-\sqrt{-5})\): the prime 3 splits.</li>
<li>\((7) = (7)\) remains prime: 7 is inert (since \(-5\) is not a square mod 7).</li>
</ul>
The splitting behavior of odd primes \(p\) in \(\mathbb{Q}(\sqrt{d})/\mathbb{Q}\) is governed by the Legendre symbol \(\left(\frac{d}{p}\right)\): the prime \(p\) splits if \(\left(\frac{d}{p}\right) = 1\), is inert if \(\left(\frac{d}{p}\right) = -1\), and ramifies if \(p \mid d\). This is the simplest instance of the reciprocity laws that class field theory generalizes.
</div>

### 1.4 The Frobenius Element

When \(L/K\) is Galois and \(\mathfrak{P}\) is a prime of \(\mathcal{O}_L\) lying over an unramified prime \(\mathfrak{p}\) of \(\mathcal{O}_K\), there is a distinguished element of the Galois group associated to this prime. This Frobenius element is the bridge between the arithmetic of primes and the structure of Galois groups, and it is the key ingredient in the Artin map.

<div class="definition">
<strong>Definition 1.12 (Decomposition and Inertia Groups).</strong> Let \(L/K\) be Galois with group \(G\), and let \(\mathfrak{P}\) lie over \(\mathfrak{p}\). The <em>decomposition group</em> is
\[
D(\mathfrak{P}|\mathfrak{p}) = \{\sigma \in G : \sigma(\mathfrak{P}) = \mathfrak{P}\},
\]
and the <em>inertia group</em> is
\[
I(\mathfrak{P}|\mathfrak{p}) = \{\sigma \in G : \sigma(x) \equiv x \pmod{\mathfrak{P}} \text{ for all } x \in \mathcal{O}_L\}.
\]
</div>

The inertia group \(I(\mathfrak{P}|\mathfrak{p})\) is a normal subgroup of \(D(\mathfrak{P}|\mathfrak{p})\), and there is a surjection \(D(\mathfrak{P}|\mathfrak{p}) \to \mathrm{Gal}((\mathcal{O}_L/\mathfrak{P})/(\mathcal{O}_K/\mathfrak{p}))\) with kernel \(I(\mathfrak{P}|\mathfrak{p})\). The residue field extension is cyclic, generated by the Frobenius automorphism \(x \mapsto x^{|\mathcal{O}_K/\mathfrak{p}|}\).

<div class="definition">
<strong>Definition 1.13 (Frobenius Element).</strong> If \(\mathfrak{p}\) is unramified in \(L/K\), then \(I(\mathfrak{P}|\mathfrak{p}) = 1\), and there is a unique element \(\mathrm{Frob}_{\mathfrak{P}} \in D(\mathfrak{P}|\mathfrak{p})\) such that
\[
\mathrm{Frob}_{\mathfrak{P}}(x) \equiv x^{N\mathfrak{p}} \pmod{\mathfrak{P}}
\]
for all \(x \in \mathcal{O}_L\), where \(N\mathfrak{p} = |\mathcal{O}_K/\mathfrak{p}|\). This is the <em>Frobenius element</em> at \(\mathfrak{P}\).
</div>

When we change the prime \(\mathfrak{P}\) above \(\mathfrak{p}\) to another prime \(\mathfrak{P}' = \sigma(\mathfrak{P})\), the Frobenius conjugates: \(\mathrm{Frob}_{\mathfrak{P}'} = \sigma \mathrm{Frob}_{\mathfrak{P}} \sigma^{-1}\). Thus, when \(L/K\) is abelian, the Frobenius depends only on \(\mathfrak{p}\) (not on the choice of \(\mathfrak{P}\) above it), and we write \(\mathrm{Frob}_{\mathfrak{p}}\) or \(\left(\frac{L/K}{\mathfrak{p}}\right)\) — the Artin symbol.

<div class="remark">
<strong>Remark 1.14.</strong> The Artin symbol \(\left(\frac{L/K}{\mathfrak{p}}\right) \in \mathrm{Gal}(L/K)\) is defined for every unramified prime \(\mathfrak{p}\) of \(K\) in the abelian extension \(L/K\). Extending this by multiplicativity to all ideals coprime to the ramified primes gives the <em>Artin map</em>, which is the protagonist of class field theory.
</div>

### 1.5 The Ideal Class Group

The failure of unique factorization of elements in \(\mathcal{O}_K\) is measured precisely by the ideal class group. This group is the simplest example of the "generalized class groups" that appear in the main theorems of class field theory.

<div class="definition">
<strong>Definition 1.15 (Ideal Class Group).</strong> The <em>ideal class group</em> of \(K\) is the quotient
\[
\mathrm{Cl}(K) = \frac{\{\text{nonzero fractional ideals of } \mathcal{O}_K\}}{\{\text{principal fractional ideals}\}}.
\]
The class number of \(K\) is \(h_K = |\mathrm{Cl}(K)|\).
</div>

<div class="theorem">
<strong>Theorem 1.16 (Finiteness of Class Number).</strong> For any number field \(K\), the class group \(\mathrm{Cl}(K)\) is a finite abelian group.
</div>

The proof uses the geometry of numbers (Minkowski's theorem): every ideal class contains an ideal of norm at most the Minkowski bound.

<div class="definition">
<strong>Definition 1.17 (Minkowski Bound).</strong> For a number field \(K\) of degree \(n = [K:\mathbb{Q}]\) with \(r_2\) pairs of complex embeddings and discriminant \(\Delta_K\), the <em>Minkowski bound</em> is
\[
M_K = \frac{n!}{n^n} \left(\frac{4}{\pi}\right)^{r_2} |\Delta_K|^{1/2}.
\]
Every ideal class in \(\mathrm{Cl}(K)\) contains an integral ideal of norm at most \(M_K\).
</div>

<div class="example">
<strong>Example 1.18.</strong> For \(K = \mathbb{Q}(\sqrt{-5})\), the discriminant is \(\Delta_K = -20\), and we have \(n = 2\), \(r_2 = 1\). The Minkowski bound is
\[
M_K = \frac{2!}{4} \cdot \frac{4}{\pi} \cdot \sqrt{20} = \frac{2\sqrt{20}}{\pi} \approx 2.85.
\]
So we need only consider primes of norm at most 2. The prime \((2) = (2, 1+\sqrt{-5})^2\) ramifies, and the ideal \(\mathfrak{p} = (2, 1+\sqrt{-5})\) is non-principal (if it were principal, say \(\mathfrak{p} = (\alpha)\), then \(N(\alpha) = 2\), i.e., \(a^2 + 5b^2 = 2\) for some integers \(a, b\), which has no solutions). Since \(\mathfrak{p}^2 = (2)\) is principal, \(\mathfrak{p}\) has order 2 in \(\mathrm{Cl}(K)\). Thus \(\mathrm{Cl}(K) \cong \mathbb{Z}/2\mathbb{Z}\) and \(h_K = 2\).
</div>

### 1.6 Dirichlet's Unit Theorem

The group of units \(\mathcal{O}_K^\times\) in the ring of integers is another fundamental invariant of a number field. Dirichlet's theorem describes its structure and will play a key role when we pass from ideal class groups to idele class groups.

<div class="theorem">
<strong>Theorem 1.19 (Dirichlet's Unit Theorem).</strong> Let \(K\) be a number field of degree \(n = r_1 + 2r_2\), where \(r_1\) is the number of real embeddings and \(r_2\) is the number of pairs of complex conjugate embeddings. Then
\[
\mathcal{O}_K^\times \cong \mu_K \times \mathbb{Z}^{r_1 + r_2 - 1},
\]
where \(\mu_K\) is the finite cyclic group of roots of unity in \(K\).
</div>

<div class="proof">
<strong>Proof (sketch).</strong> Consider the logarithmic embedding \(\ell: \mathcal{O}_K^\times \to \mathbb{R}^{r_1 + r_2}\) defined by
\[
\ell(u) = (\log|\sigma_1(u)|, \ldots, \log|\sigma_{r_1}(u)|, 2\log|\sigma_{r_1+1}(u)|, \ldots, 2\log|\sigma_{r_1+r_2}(u)|).
\]
The image lands in the hyperplane \(\sum x_i = 0\) (since \(|N_{K/\mathbb{Q}}(u)| = 1\) for units). The kernel of \(\ell\) is exactly \(\mu_K\). By Minkowski's theorem, the image is a full lattice in this hyperplane, which is \((r_1 + r_2 - 1)\)-dimensional. \(\square\)
</div>

<div class="example">
<strong>Example 1.20.</strong> For \(K = \mathbb{Q}(\sqrt{2})\), we have \(r_1 = 2\), \(r_2 = 0\), and \(\mu_K = \{\pm 1\}\). The rank of the unit group is \(r_1 + r_2 - 1 = 1\), so \(\mathcal{O}_K^\times = \{\pm 1\} \times \langle \varepsilon \rangle\) for a fundamental unit \(\varepsilon\). We find \(\varepsilon = 1 + \sqrt{2}\), which satisfies \(N_{K/\mathbb{Q}}(\varepsilon) = 1 - 2 = -1\).
</div>

### 1.7 Discriminants and the Different

The discriminant and different measure ramification and will be essential for understanding the conductor-discriminant formula in global class field theory.

<div class="definition">
<strong>Definition 1.21 (Different).</strong> Let \(L/K\) be an extension of number fields. The <em>different</em> of \(L/K\) is the ideal
\[
\mathfrak{d}_{L/K} = \left(\{x \in L : \mathrm{Tr}_{L/K}(x \mathcal{O}_L) \subseteq \mathcal{O}_K\}\right)^{-1}.
\]
The <em>discriminant</em> of \(L/K\) is the ideal \(\mathfrak{D}_{L/K} = N_{L/K}(\mathfrak{d}_{L/K})\) of \(\mathcal{O}_K\).
</div>

<div class="theorem">
<strong>Theorem 1.22.</strong> A prime \(\mathfrak{p}\) of \(\mathcal{O}_K\) ramifies in \(L/K\) if and only if \(\mathfrak{p}\) divides the discriminant \(\mathfrak{D}_{L/K}\). In particular, only finitely many primes ramify.
</div>

This characterization of ramification via the discriminant will be crucial: in class field theory, we will see that the conductor of an abelian extension controls exactly which primes ramify, and the conductor-discriminant formula relates these two measures of ramification.

---

## Chapter 2: Completions and Local Fields

### 2.1 Absolute Values and Completions

To formulate class field theory properly, we must work not just with the number field \(K\) itself, but also with its completions at all places. This "local" perspective — studying number fields one prime at a time — is enormously powerful. The local fields obtained by completion are simpler than the global field \(K\), and the local-global philosophy (crystallized in the adele ring of Chapter 3) is one of the great themes of modern number theory.

<div class="definition">
<strong>Definition 2.1 (Absolute Value).</strong> An <em>absolute value</em> on a field \(K\) is a function \(|\cdot|: K \to \mathbb{R}_{\geq 0}\) satisfying:
<ol>
<li>\(|x| = 0\) if and only if \(x = 0\),</li>
<li>\(|xy| = |x||y|\) for all \(x,y \in K\),</li>
<li>\(|x+y| \leq |x| + |y|\) for all \(x,y \in K\) (triangle inequality).</li>
</ol>
An absolute value is <em>non-archimedean</em> if it satisfies the stronger ultrametric inequality \(|x+y| \leq \max(|x|, |y|)\); otherwise it is <em>archimedean</em>.
</div>

Two absolute values are <em>equivalent</em> if they define the same topology on \(K\). An equivalence class of nontrivial absolute values is called a <em>place</em> (or <em>prime</em>) of \(K\).

<div class="theorem">
<strong>Theorem 2.2 (Ostrowski's Theorem for \(\mathbb{Q}\)).</strong> Every nontrivial absolute value on \(\mathbb{Q}\) is equivalent to either the usual archimedean absolute value \(|\cdot|_\infty\) or a \(p\)-adic absolute value \(|\cdot|_p\) for some prime \(p\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(|\cdot|\) be a nontrivial absolute value on \(\mathbb{Q}\). If it is archimedean, one shows that \(|n| = n^s\) for some \(s > 0\) and all positive integers \(n\) (by a careful analysis using the expansion of integers in different bases), so \(|\cdot|\) is equivalent to \(|\cdot|_\infty\). If it is non-archimedean, then \(|n| \leq 1\) for all \(n \in \mathbb{Z}\), and the set \(\{n \in \mathbb{Z} : |n| < 1\}\) is a nonzero prime ideal \((p)\) of \(\mathbb{Z}\). Writing any rational number in terms of its \(p\)-adic valuation gives the result. \(\square\)
</div>

For a number field \(K\), the places are classified as follows: the <em>archimedean</em> (or <em>infinite</em>) places correspond to the real and complex embeddings of \(K\), and the <em>non-archimedean</em> (or <em>finite</em>) places correspond to the nonzero prime ideals of \(\mathcal{O}_K\).

<div class="definition">
<strong>Definition 2.3 (\(\mathfrak{p}\)-adic Absolute Value).</strong> For a nonzero prime ideal \(\mathfrak{p}\) of \(\mathcal{O}_K\), the <em>\(\mathfrak{p}\)-adic absolute value</em> is defined by
\[
|x|_\mathfrak{p} = (N\mathfrak{p})^{-v_\mathfrak{p}(x)}
\]
for \(x \in K^\times\), where \(v_\mathfrak{p}(x)\) is the exponent of \(\mathfrak{p}\) in the factorization of the fractional ideal \((x)\), and \(|0|_\mathfrak{p} = 0\).
</div>

<div class="theorem">
<strong>Theorem 2.4 (Product Formula).</strong> For any \(x \in K^\times\),
\[
\prod_{v} |x|_v = 1,
\]
where the product runs over all places \(v\) of \(K\) (with appropriate normalizations at the archimedean places).
</div>

This product formula is a fundamental constraint linking the local and global behavior of elements. It will reappear as the statement that \(K^\times\) embeds diagonally into the idele group with image in the "norm-one" ideles.

### 2.2 The \(p\)-adic Numbers

The completion of \(\mathbb{Q}\) with respect to \(|\cdot|_p\) gives the field \(\mathbb{Q}_p\) of \(p\)-adic numbers, introduced by Hensel in 1897. These fields are the prototypical local fields and provide the testing ground for local class field theory.

<div class="definition">
<strong>Definition 2.5 (\(p\)-adic Numbers).</strong> The field of <em>\(p\)-adic numbers</em> \(\mathbb{Q}_p\) is the completion of \(\mathbb{Q}\) with respect to the \(p\)-adic absolute value \(|\cdot|_p\). The <em>ring of \(p\)-adic integers</em> is \(\mathbb{Z}_p = \{x \in \mathbb{Q}_p : |x|_p \leq 1\}\).
</div>

Every element of \(\mathbb{Q}_p\) can be written uniquely as a "Laurent series in \(p\)":
\[
x = \sum_{i=n}^{\infty} a_i p^i, \quad a_i \in \{0, 1, \ldots, p-1\}, \quad a_n \neq 0,
\]
where \(n = v_p(x) \in \mathbb{Z}\). The ring \(\mathbb{Z}_p\) consists of those series with \(n \geq 0\). Note that \(\mathbb{Z}_p\) is a local ring with unique maximal ideal \(p\mathbb{Z}_p\) and residue field \(\mathbb{Z}_p/p\mathbb{Z}_p \cong \mathbb{F}_p\).

<div class="proposition">
<strong>Proposition 2.6.</strong> The ring \(\mathbb{Z}_p\) is a principal ideal domain (indeed, a discrete valuation ring). Every ideal is of the form \(p^n \mathbb{Z}_p\) for some \(n \geq 0\). The group of units is \(\mathbb{Z}_p^\times = \{x \in \mathbb{Z}_p : |x|_p = 1\}\).
</div>

### 2.3 Hensel's Lemma

Hensel's lemma is the local analogue of Newton's method: it allows us to "lift" approximate roots of polynomials from the residue field to exact roots in the local field. It is indispensable for understanding extensions of local fields.

<div class="theorem">
<strong>Theorem 2.7 (Hensel's Lemma).</strong> Let \(K\) be a complete non-archimedean field with valuation ring \(\mathcal{O}\) and maximal ideal \(\mathfrak{m}\). Let \(f(x) \in \mathcal{O}[x]\) and suppose \(a \in \mathcal{O}\) satisfies
\[
|f(a)| < |f'(a)|^2.
\]
Then there exists a unique \(\alpha \in \mathcal{O}\) with \(f(\alpha) = 0\) and \(|\alpha - a| \leq |f(a)/f'(a)| < |f'(a)|\).
</div>

<div class="proof">
<strong>Proof.</strong> Define the Newton sequence \(a_0 = a\) and \(a_{n+1} = a_n - f(a_n)/f'(a_n)\). The condition \(|f(a)| < |f'(a)|^2\) ensures that \(|a_1 - a_0| < |f'(a_0)|\), which by the ultrametric inequality gives \(|f'(a_1)| = |f'(a_0)|\). An induction shows that \(|a_{n+1} - a_n| \leq |f(a_n)/f'(a_n)|\) decreases geometrically, so the sequence converges. The limit \(\alpha\) satisfies \(f(\alpha) = 0\) by continuity. Uniqueness in the stated disk follows from the mean value estimate for non-archimedean fields. \(\square\)
</div>

<div class="corollary">
<strong>Corollary 2.8 (Simple Root Lifting).</strong> If \(f(x) \in \mathcal{O}[x]\) and \(\bar{a}\) is a simple root of \(\bar{f}(x) \in (\mathcal{O}/\mathfrak{m})[x]\), then there is a unique root \(\alpha \in \mathcal{O}\) of \(f\) lifting \(\bar{a}\).
</div>

<div class="example">
<strong>Example 2.9.</strong> Does \(\sqrt{-1}\) exist in \(\mathbb{Q}_5\)? Consider \(f(x) = x^2 + 1\). In \(\mathbb{F}_5\), we have \(f(2) = 5 \equiv 0\) and \(f'(2) = 4 \not\equiv 0\). So \(\bar{a} = 2\) is a simple root of \(\bar{f}\) in \(\mathbb{F}_5\). By Hensel's lemma, there is a unique \(\alpha \in \mathbb{Z}_5\) with \(\alpha^2 + 1 = 0\) and \(\alpha \equiv 2 \pmod{5}\). Thus \(\mathbb{Q}_5\) contains a square root of \(-1\), which means the polynomial \(x^2+1\) splits in \(\mathbb{Q}_5[x]\), even though it is irreducible over \(\mathbb{Q}\) and \(\mathbb{R}\).
</div>

### 2.4 Structure of Local Fields

Let us now describe the general structure of local fields arising as completions of number fields. These are the arenas for local class field theory.

<div class="definition">
<strong>Definition 2.10 (Local Field).</strong> A <em>local field</em> is a field that is complete with respect to a nontrivial absolute value and has a finite residue field. Equivalently, a non-archimedean local field of characteristic zero is a finite extension of \(\mathbb{Q}_p\) for some prime \(p\).
</div>

If \(K_v\) is the completion of \(K\) at a finite place \(v\) corresponding to a prime \(\mathfrak{p}\), then \(K_v\) is a finite extension of \(\mathbb{Q}_p\) (where \(p\) is the rational prime below \(\mathfrak{p}\)). The valuation ring is \(\mathcal{O}_v = \{x \in K_v : |x|_v \leq 1\}\), with maximal ideal \(\mathfrak{m}_v\) and residue field \(k_v = \mathcal{O}_v/\mathfrak{m}_v \cong \mathbb{F}_q\) where \(q = N\mathfrak{p} = p^f\).

<div class="proposition">
<strong>Proposition 2.11 (Structure of \(K_v^\times\)).</strong> For a non-archimedean local field \(K_v\) with uniformizer \(\pi\), residue field \(\mathbb{F}_q\), and ring of integers \(\mathcal{O}_v\),
\[
K_v^\times \cong \mathbb{Z} \times \mathcal{O}_v^\times, \quad x = \pi^{v(x)} \cdot u,
\]
and
\[
\mathcal{O}_v^\times \cong \mu_{q-1} \times (1 + \mathfrak{m}_v),
\]
where \(\mu_{q-1}\) is the group of \((q-1)\)-st roots of unity (Teichmüller representatives), and \(1 + \mathfrak{m}_v\) is a pro-\(p\) group (the group of principal units).
</div>

The structure of the principal units \(1 + \mathfrak{m}_v\) is more subtle: as a \(\mathbb{Z}_p\)-module, \(1 + \mathfrak{m}_v \cong \mathbb{Z}_p^{[K_v:\mathbb{Q}_p]}\) (for \(p\) odd; the case \(p = 2\) requires a small modification). This precise description of \(K_v^\times\) is essential for local class field theory, where we need to understand all open subgroups of finite index in \(K_v^\times\).

### 2.5 Extensions of Local Fields

<div class="definition">
<strong>Definition 2.12 (Unramified and Totally Ramified Extensions).</strong> Let \(L/K\) be a finite extension of non-archimedean local fields. The extension is:
<ul>
<li><em>unramified</em> if the ramification index is \(e(L/K) = 1\), i.e., the residue field extension has degree \([L:K]\);</li>
<li><em>totally ramified</em> if the residue degree is \(f(L/K) = 1\), i.e., \(e(L/K) = [L:K]\).</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem 2.13 (Classification of Unramified Extensions).</strong> For each \(n \geq 1\), there is a unique (up to isomorphism) unramified extension of \(K\) of degree \(n\). It is obtained by adjoining a primitive \((q^n - 1)\)-st root of unity, where \(q = |k|\). The maximal unramified extension is \(K^{\mathrm{ur}} = \bigcup_n K_n\), and \(\mathrm{Gal}(K^{\mathrm{ur}}/K) \cong \hat{\mathbb{Z}}\), the profinite completion of \(\mathbb{Z}\), generated topologically by the Frobenius automorphism.
</div>

<div class="theorem">
<strong>Theorem 2.14.</strong> Every finite extension \(L/K\) of local fields decomposes as \(K \subset K^{\mathrm{ur}} \cap L \subset L\), where \(K^{\mathrm{ur}} \cap L / K\) is the maximal unramified subextension, and \(L / (K^{\mathrm{ur}} \cap L)\) is totally ramified.
</div>

<div class="proposition">
<strong>Proposition 2.15 (Eisenstein Polynomials).</strong> A totally ramified extension of degree \(n\) of a local field \(K\) is generated by a root of an Eisenstein polynomial
\[
f(x) = x^n + a_{n-1}x^{n-1} + \cdots + a_1 x + a_0 \in \mathcal{O}_K[x],
\]
where \(v(a_i) \geq 1\) for all \(i\) and \(v(a_0) = 1\). Conversely, every root of an Eisenstein polynomial generates a totally ramified extension.
</div>

### 2.6 Higher Ramification Groups

The decomposition and inertia groups from the global theory have local counterparts with much richer structure: the higher ramification groups, which provide a filtration of the inertia group.

<div class="definition">
<strong>Definition 2.16 (Higher Ramification Groups, Lower Numbering).</strong> Let \(L/K\) be a finite Galois extension of local fields with group \(G\). For \(i \geq -1\), the <em>\(i\)-th ramification group</em> (in the lower numbering) is
\[
G_i = \{\sigma \in G : v_L(\sigma(x) - x) \geq i+1 \text{ for all } x \in \mathcal{O}_L\}.
\]
</div>

We have \(G_{-1} = G\), \(G_0 = I\) (the inertia group), and \(G_1\) is the <em>wild inertia group</em> (a \(p\)-group). The quotient \(G_0/G_1\) is cyclic of order prime to \(p\) (the tame inertia). The groups \(G_i\) for \(i \geq 1\) form a descending filtration of \(p\)-groups.

<div class="remark">
<strong>Remark 2.17.</strong> The lower numbering is well-behaved for subgroups but not for quotients. Hasse and Herbrand introduced the <em>upper numbering</em> \(G^t\) via a change-of-variables function \(\varphi\), which is compatible with quotients. This compatibility is crucial for defining the filtration on the absolute Galois group and plays an important role in local class field theory.
</div>

### 2.7 Krasner's Lemma

Krasner's lemma is a remarkable rigidity result for non-archimedean fields: it says that if a point is closer to all conjugates of an algebraic element than any two conjugates are to each other, then the point generates the same extension.

<div class="theorem">
<strong>Theorem 2.18 (Krasner's Lemma).</strong> Let \(K\) be a complete non-archimedean field, \(\alpha\) separable over \(K\), and let \(\alpha_1 = \alpha, \alpha_2, \ldots, \alpha_n\) be the conjugates of \(\alpha\) over \(K\). If \(\beta \in \bar{K}\) satisfies
\[
|\beta - \alpha| < |\alpha_i - \alpha| \quad \text{for all } i \geq 2,
\]
then \(K(\alpha) \subseteq K(\beta)\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(\sigma \in \mathrm{Gal}(\bar{K}/K(\beta))\). Then \(\sigma(\beta) = \beta\), so
\[
|\sigma(\alpha) - \alpha| = |(\sigma(\alpha) - \beta) - (\alpha - \beta)| = |\sigma(\alpha - \beta) - (\alpha - \beta)|.
\]
Since \(\sigma\) is an isometry, \(|\sigma(\alpha - \beta)| = |\alpha - \beta|\). By the ultrametric inequality, \(|\sigma(\alpha) - \alpha| \leq |\alpha - \beta|\). By hypothesis, this is strictly less than \(|\alpha_i - \alpha|\) for all \(i \geq 2\). Hence \(\sigma(\alpha) = \alpha\), meaning \(\alpha \in K(\beta)\). \(\square\)
</div>

<div class="corollary">
<strong>Corollary 2.19.</strong> The set of extensions of \(K\) of a given degree \(n\) is finite (up to isomorphism). In particular, \(\mathbb{Q}_p\) has only finitely many extensions of any given degree.
</div>

This finiteness is a striking contrast with the global situation and is one of the features that makes local class field theory tractable.

---

## Chapter 3: Global Fields and the Adele Ring

### 3.1 Places of a Number Field

Having studied local fields individually, we now combine all completions of a number field into a single algebraic object — the adele ring. This construction, developed by Chevalley, Weil, and Tate in the 1930s–1950s, is one of the most elegant and powerful ideas in modern number theory. It replaces the cumbersome language of ideals and congruences with the clean formalism of topological groups and harmonic analysis.

<div class="definition">
<strong>Definition 3.1 (Places).</strong> A <em>place</em> of a number field \(K\) is an equivalence class of nontrivial absolute values on \(K\). The set of all places is denoted \(\Sigma_K\) (or \(M_K\)). It decomposes as
\[
\Sigma_K = \Sigma_K^\infty \cup \Sigma_K^f,
\]
where \(\Sigma_K^\infty\) consists of archimedean places (corresponding to embeddings \(K \hookrightarrow \mathbb{R}\) or conjugate pairs \(K \hookrightarrow \mathbb{C}\)) and \(\Sigma_K^f\) consists of non-archimedean places (corresponding to nonzero prime ideals of \(\mathcal{O}_K\)).
</div>

For each place \(v\), we write \(K_v\) for the completion of \(K\) at \(v\). When \(v\) is a finite place corresponding to a prime \(\mathfrak{p}\), we sometimes write \(K_\mathfrak{p}\) instead.

### 3.2 Restricted Direct Products

The adele ring is not a direct product of all completions (which would be too large) but rather a "restricted" direct product that captures the fact that a global element has nonnegative valuation at all but finitely many primes.

<div class="definition">
<strong>Definition 3.2 (Restricted Direct Product).</strong> Let \(\{G_v\}_{v \in S}\) be a family of locally compact groups, and for all but finitely many \(v\), let \(H_v \subseteq G_v\) be a compact open subgroup. The <em>restricted direct product</em> \(\prod'_v G_v\) (with respect to the \(H_v\)) is the set of elements \((x_v) \in \prod_v G_v\) such that \(x_v \in H_v\) for all but finitely many \(v\). It is given the topology generated by sets of the form
\[
\prod_{v \in T} U_v \times \prod_{v \notin T} H_v,
\]
where \(T\) is a finite set containing all \(v\) where \(H_v\) is not defined, and \(U_v \subseteq G_v\) is open.
</div>

The restricted direct product is again a locally compact group — this is the key point. The unrestricted direct product would not be locally compact (in the non-discrete case), and local compactness is essential for harmonic analysis.

### 3.3 The Adele Ring

<div class="definition">
<strong>Definition 3.3 (Adele Ring).</strong> The <em>adele ring</em> of a number field \(K\) is the restricted direct product
\[
\mathbb{A}_K = \prod_{v \in \Sigma_K}' K_v
\]
with respect to the compact open subrings \(\mathcal{O}_v \subset K_v\) at the finite places. An element \(a = (a_v) \in \mathbb{A}_K\) is called an <em>adele</em>: it is a tuple of local elements, one for each place of \(K\), with the constraint that \(a_v \in \mathcal{O}_v\) for all but finitely many finite places \(v\).
</div>

The adele ring \(\mathbb{A}_K\) is a locally compact topological ring. There is a diagonal embedding \(K \hookrightarrow \mathbb{A}_K\) sending \(\alpha \mapsto (\alpha, \alpha, \alpha, \ldots)\), which is well-defined because every element of \(K\) is a \(v\)-adic integer for all but finitely many \(v\).

<div class="theorem">
<strong>Theorem 3.4.</strong> The image of \(K\) under the diagonal embedding is a discrete subgroup of \(\mathbb{A}_K\), and the quotient \(\mathbb{A}_K/K\) is compact.
</div>

<div class="proof">
<strong>Proof (sketch).</strong> Discreteness: we need to find an open neighborhood of \(0\) in \(\mathbb{A}_K\) that intersects \(K\) only in \(\{0\}\). Take \(U = \prod_{v \mid \infty} \{x_v : |x_v| < 1\} \times \prod_{v \nmid \infty} \mathcal{O}_v\). If \(\alpha \in K \cap U\), then \(|\alpha|_v \leq 1\) for all \(v\), so by the product formula, \(\prod_v |\alpha|_v = 1\) forces \(|\alpha|_v = 1\) for all \(v\), hence \(\alpha = 0\) (since \(|\alpha|_v < 1\) at archimedean places).

Compactness of \(\mathbb{A}_K/K\): this can be deduced from Minkowski's theorem on lattice points in convex bodies, or equivalently from the finiteness of the class number and Dirichlet's unit theorem. It is a key structural result that encodes both the finiteness of \(\mathrm{Cl}(K)\) and the structure of \(\mathcal{O}_K^\times\). \(\square\)
</div>

<div class="remark">
<strong>Remark 3.5.</strong> The compactness of \(\mathbb{A}_K/K\) is the adelic reformulation of two classical finiteness theorems in algebraic number theory. It simultaneously encodes the finiteness of the class group and the Dirichlet unit theorem. This is one of the beauties of the adelic approach: fundamental but seemingly separate results about number fields become facets of one topological statement.
</div>

### 3.4 The Idele Group

<div class="definition">
<strong>Definition 3.6 (Idele Group).</strong> The <em>idele group</em> of \(K\) is the restricted direct product of the multiplicative groups:
\[
\mathbb{A}_K^\times = \prod_{v}' K_v^\times,
\]
where the restricted product is taken with respect to the compact open subgroups \(\mathcal{O}_v^\times \subset K_v^\times\) at the finite places. An element of \(\mathbb{A}_K^\times\) is called an <em>idele</em>.
</div>

The idele group \(\mathbb{A}_K^\times\) is the group of units of the adele ring, but its topology is <em>not</em> the subspace topology from \(\mathbb{A}_K\). Instead, it carries the restricted product topology, which makes it a locally compact group. The embedding \(\mathbb{A}_K^\times \hookrightarrow \mathbb{A}_K \times \mathbb{A}_K\) via \(x \mapsto (x, x^{-1})\) identifies the idele topology with the subspace topology from this embedding.

The diagonal embedding \(K^\times \hookrightarrow \mathbb{A}_K^\times\) maps \(\alpha\) to the "principal idele" \((\alpha, \alpha, \ldots)\).

<div class="definition">
<strong>Definition 3.7 (Content/Idele Norm).</strong> The <em>content</em> (or <em>idele norm</em>) is the continuous homomorphism
\[
\|\cdot\|: \mathbb{A}_K^\times \to \mathbb{R}_{>0}, \quad \|a\| = \prod_v |a_v|_v.
\]
By the product formula, \(\|\alpha\| = 1\) for all \(\alpha \in K^\times\), so the content factors through the idele class group.
</div>

### 3.5 The Idele Class Group

The idele class group is the central object of global class field theory: the global Artin map is a homomorphism from this group to the abelianized absolute Galois group.

<div class="definition">
<strong>Definition 3.8 (Idele Class Group).</strong> The <em>idele class group</em> of \(K\) is
\[
C_K = \mathbb{A}_K^\times / K^\times.
\]
The <em>norm-one idele class group</em> is \(C_K^1 = \ker(\|\cdot\|: C_K \to \mathbb{R}_{>0})\).
</div>

<div class="theorem">
<strong>Theorem 3.9 (Compactness of \(C_K^1\)).</strong> The norm-one idele class group \(C_K^1\) is compact. The full idele class group fits into an exact sequence
\[
1 \to C_K^1 \to C_K \xrightarrow{\|\cdot\|} \mathbb{R}_{>0} \to 1,
\]
so \(C_K \cong C_K^1 \times \mathbb{R}_{>0}\) (non-canonically).
</div>

<div class="proof">
<strong>Proof (sketch).</strong> Define the norm-one ideles \(\mathbb{A}_K^1 = \{a \in \mathbb{A}_K^\times : \|a\| = 1\}\). Then \(C_K^1 = \mathbb{A}_K^1/K^\times\). The compactness of \(C_K^1\) follows from a generalization of the argument for \(\mathbb{A}_K/K\): one constructs a compact subset \(W \subset \mathbb{A}_K^1\) such that for every \(a \in \mathbb{A}_K^1\), there exists \(\alpha \in K^\times\) with \(\alpha a \in W\). This construction uses Minkowski's theorem and is equivalent to the finiteness of the class number together with the compactness of the unit lattice. \(\square\)
</div>

### 3.6 Connection to Classical Objects

The power of the adelic formalism is that it unifies and subsumes the classical invariants of number fields. Let us spell out these connections explicitly.

<div class="theorem">
<strong>Theorem 3.10.</strong> There is an exact sequence
\[
1 \to \mathcal{O}_K^\times \to K^\times \to \mathbb{A}_{K,f}^\times / \prod_v \mathcal{O}_v^\times \to \mathrm{Cl}(K) \to 1,
\]
where \(\mathbb{A}_{K,f}^\times = \prod_v' K_v^\times\) (product over finite places). In particular, the class group is isomorphic to
\[
\mathrm{Cl}(K) \cong \mathbb{A}_{K,f}^\times / (K^\times \cdot \prod_v \mathcal{O}_v^\times).
\]
</div>

<div class="proof">
<strong>Proof.</strong> There is a surjective homomorphism from \(\mathbb{A}_{K,f}^\times\) to the group of fractional ideals, sending the idele \((a_v)_v\) to the fractional ideal \(\prod_v \mathfrak{p}_v^{v(a_v)}\). This map has kernel \(\prod_v \mathcal{O}_v^\times\). The image of \(K^\times\) under the diagonal embedding maps to the subgroup of principal fractional ideals. The result follows. \(\square\)
</div>

This tells us that the class group — a finite abelian group that was originally defined in terms of ideals — naturally arises as a quotient of the idele group. Similarly, Dirichlet's unit theorem can be recovered from the structure of the kernel of the map from \(K^\times\) to the ideles.

### 3.7 The Strong Approximation Theorem

<div class="theorem">
<strong>Theorem 3.11 (Strong Approximation).</strong> Let \(v_0\) be a place of \(K\). Then \(K\) is dense in \(\prod_{v \neq v_0}' K_v\) (the restricted direct product over all places except \(v_0\)).
</div>

This is a vast generalization of the Chinese Remainder Theorem. It says that we can approximate any adele arbitrarily well by a global element, provided we are willing to sacrifice control at one place. The strong approximation theorem has many applications: for instance, it implies that the class group is the quotient described above, and it is used in proofs of the Hasse-Minkowski theorem for quadratic forms.

<div class="remark">
<strong>Remark 3.12.</strong> The adelic perspective was championed by Chevalley and Weil in the 1930s and 1940s, and brought to its full power by Tate in his famous 1950 thesis (a student of Emil Artin at Princeton). Tate's thesis reproved the analytic continuation and functional equation of Hecke \(L\)-functions using harmonic analysis on the adeles, inaugurating the modern approach to automorphic forms. We will use the adelic language throughout the rest of these notes.
</div>

---

## Chapter 4: Local Class Field Theory

### 4.1 Overview and Motivation

Local class field theory classifies all abelian extensions of a local field \(K\) in terms of the multiplicative group \(K^\times\). It is both a complete theorem and a model for the global theory. The key result is the <em>local reciprocity map</em>, which establishes an intimate connection between the arithmetic of \(K^\times\) and the Galois theory of abelian extensions.

The story begins with a question: given a non-archimedean local field \(K\) (say, a finite extension of \(\mathbb{Q}_p\)), can we describe all finite abelian extensions of \(K\)? And can we identify which elements of \(K^\times\) correspond to which abelian extensions?

The answer is a resounding yes, and the correspondence is remarkably clean. The central object is the local Artin map.

### 4.2 Statement of Local Reciprocity

<div class="theorem">
<strong>Theorem 4.1 (Local Reciprocity Law).</strong> Let \(K\) be a non-archimedean local field. There exists a unique continuous homomorphism
\[
\mathrm{Art}_K: K^\times \to \mathrm{Gal}(K^{\mathrm{ab}}/K),
\]
called the <em>local Artin map</em> (or <em>local reciprocity map</em>), satisfying:
<ol>
<li>(Compatibility with unramified extensions) For the maximal unramified extension \(K^{\mathrm{ur}}/K\), the composition \(K^\times \xrightarrow{\mathrm{Art}_K} \mathrm{Gal}(K^{\mathrm{ab}}/K) \twoheadrightarrow \mathrm{Gal}(K^{\mathrm{ur}}/K)\) sends any uniformizer \(\pi\) to the Frobenius automorphism \(\mathrm{Frob}_K\).</li>
<li>(Norm compatibility) For any finite abelian extension \(L/K\), the kernel of the composition \(K^\times \xrightarrow{\mathrm{Art}_K} \mathrm{Gal}(K^{\mathrm{ab}}/K) \twoheadrightarrow \mathrm{Gal}(L/K)\) is exactly the norm group \(N_{L/K}(L^\times)\).</li>
</ol>
In particular, for each finite abelian extension \(L/K\), there is an isomorphism
\[
\mathrm{Art}_{L/K}: K^\times / N_{L/K}(L^\times) \xrightarrow{\;\sim\;} \mathrm{Gal}(L/K).
\]
</div>

<div class="remark">
<strong>Remark 4.2.</strong> There is a convention issue: some authors (Neukirch, Serre) normalize the Artin map so that uniformizers map to Frobenius, while others (Milne in some treatments) use the inverse convention where uniformizers map to the arithmetic Frobenius inverse. We follow the convention where uniformizers map to Frobenius, which is the more classical choice.
</div>

Let us unpack what this theorem says. The group \(K^\times\) has a rich structure (we described it in Proposition 2.11). The Artin map takes this arithmetic information and translates it into Galois-theoretic information. The norm groups \(N_{L/K}(L^\times)\) — the images of the norm map from the various abelian extensions — are precisely the open subgroups of finite index of \(K^\times\), and they correspond bijectively to the finite abelian extensions.

### 4.3 The Local Existence Theorem

<div class="theorem">
<strong>Theorem 4.3 (Local Existence Theorem).</strong> Let \(K\) be a non-archimedean local field. A subgroup \(N \subseteq K^\times\) is a norm group (i.e., \(N = N_{L/K}(L^\times)\) for some finite abelian extension \(L/K\)) if and only if \(N\) is an open subgroup of finite index in \(K^\times\).
</div>

<div class="remark">
<strong>Remark 4.4.</strong> Every open subgroup of \(K^\times\) automatically has finite index. The converse is not quite true in general (it depends on the group structure), but for our purposes, the characterization is: a subgroup is a norm group if and only if it is open and of finite index.
</div>

Together, the local reciprocity law and the existence theorem give a perfect dictionary:

\[
\left\{\begin{array}{c}\text{finite abelian extensions} \\ L/K\end{array}\right\} \xleftrightarrow{\;1:1\;} \left\{\begin{array}{c}\text{open subgroups of} \\ \text{finite index in } K^\times\end{array}\right\}
\]

The correspondence sends \(L\) to \(N_{L/K}(L^\times)\), and it reverses inclusions: if \(L_1 \subseteq L_2\), then \(N_{L_2/K}(L_2^\times) \subseteq N_{L_1/K}(L_1^\times)\). Moreover, \(L_1 L_2\) corresponds to \(N_1 \cap N_2\), and \(L_1 \cap L_2\) corresponds to \(N_1 N_2\).

### 4.4 Consequences for Unramified and Totally Ramified Extensions

<div class="proposition">
<strong>Proposition 4.5 (Unramified Case).</strong> The unique unramified extension of \(K\) of degree \(n\) corresponds under local class field theory to the norm group \(\langle \pi^n \rangle \cdot \mathcal{O}_K^\times\), where \(\pi\) is any uniformizer. In other words,
\[
N_{K_n^{\mathrm{ur}}/K}(K_n^{{\mathrm{ur}}\times}) = \langle \pi^n \rangle \cdot \mathcal{O}_K^\times,
\]
which is the subgroup of elements of valuation divisible by \(n\).
</div>

<div class="proof">
<strong>Proof.</strong> For the unramified extension \(L/K\) of degree \(n\), the residue field extension has degree \(n\), and the norm map on units surjects onto \(\mathcal{O}_K^\times\) (by Hensel's lemma and the surjectivity of the norm map on finite fields). A uniformizer of \(K\) is also a uniformizer of \(L\), so its norm is \(\pi^n\). Thus \(N_{L/K}(L^\times) = \langle \pi^n \rangle \cdot \mathcal{O}_K^\times\). This is indeed an open subgroup of index \(n\) in \(K^\times\), consistent with the isomorphism \(K^\times / N_{L/K}(L^\times) \cong \mathrm{Gal}(L/K) \cong \mathbb{Z}/n\mathbb{Z}\). \(\square\)
</div>

<div class="proposition">
<strong>Proposition 4.6 (Totally Ramified Abelian Case).</strong> A finite abelian extension \(L/K\) is totally ramified if and only if \(\mathcal{O}_K^\times \subseteq N_{L/K}(L^\times)\), equivalently if and only if the norm group contains \(\mathcal{O}_K^\times\). The maximal abelian totally ramified extension corresponds to the norm groups contained in \(\pi^{\mathbb{Z}} \cdot U\) for various open subgroups \(U\) of \(\mathcal{O}_K^\times\).
</div>

### 4.5 The Lubin-Tate Construction

The classical proofs of local class field theory (via group cohomology, as in Serre's <em>Local Fields</em> or Cassels-Fröhlich) establish the existence of the Artin map somewhat abstractly. In 1965, Lubin and Tate gave a beautiful explicit construction using formal groups that directly builds the totally ramified abelian extensions of \(K\) and the Artin map.

<div class="definition">
<strong>Definition 4.7 (Lubin-Tate Formal Group Law).</strong> Let \(K\) be a local field with uniformizer \(\pi\), residue field \(\mathbb{F}_q\), and ring of integers \(\mathcal{O}\). A <em>Lubin-Tate series</em> for \(\pi\) is a power series \(f(x) \in \mathcal{O}[[x]]\) such that
<ul>
<li>\(f(x) \equiv \pi x \pmod{x^2}\), and</li>
<li>\(f(x) \equiv x^q \pmod{\pi}\).</li>
</ul>
</div>

<div class="example">
<strong>Example 4.8.</strong> For \(K = \mathbb{Q}_p\) and \(\pi = p\), the polynomial \(f(x) = px + x^p\) is a Lubin-Tate series. Another choice is \(f(x) = (1+x)^p - 1\), which arises from the formal multiplicative group and connects to the theory of cyclotomic extensions.
</div>

<div class="theorem">
<strong>Theorem 4.9 (Lubin-Tate).</strong> Given a Lubin-Tate series \(f\) for \(\pi\), there exists a unique one-dimensional commutative formal group law \(F_f(x,y) \in \mathcal{O}[[x,y]]\) such that \(f\) is an endomorphism of \(F_f\). Moreover:
<ol>
<li>For each \(a \in \mathcal{O}\), there is a unique endomorphism \([a]_f(x) \in \mathcal{O}[[x]]\) of \(F_f\) with \([a]_f(x) \equiv ax \pmod{x^2}\).</li>
<li>The map \(a \mapsto [a]_f\) is a ring homomorphism \(\mathcal{O} \to \mathrm{End}(F_f)\).</li>
<li>Different choices of Lubin-Tate series for the same uniformizer give isomorphic formal groups.</li>
</ol>
</div>

The key construction is as follows. Let \(\bar{K}\) be an algebraic closure of \(K\), and let \(\mathfrak{m}_{\bar{K}}\) be the maximal ideal of the valuation ring of \(\bar{K}\). The formal group \(F_f\) defines a new abelian group structure on \(\mathfrak{m}_{\bar{K}}\): the sum of \(x\) and \(y\) is \(F_f(x,y)\) (which converges since \(x, y \in \mathfrak{m}_{\bar{K}}\)). The torsion points are the key.

<div class="definition">
<strong>Definition 4.10 (Torsion Points).</strong> For \(n \geq 1\), the \(\pi^n\)-torsion of the Lubin-Tate formal group is
\[
F_f[\pi^n] = \{x \in \mathfrak{m}_{\bar{K}} : [\pi^n]_f(x) = 0\}.
\]
</div>

<div class="theorem">
<strong>Theorem 4.11 (Lubin-Tate Extensions).</strong>
<ol>
<li>\(F_f[\pi^n] \cong \mathcal{O}/\pi^n\mathcal{O}\) as \(\mathcal{O}\)-modules, and \(|F_f[\pi^n]| = q^n\).</li>
<li>The field \(K_{\pi,n} = K(F_f[\pi^n])\) is a totally ramified abelian extension of \(K\) of degree \((q-1)q^{n-1}\).</li>
<li>\(\mathrm{Gal}(K_{\pi,n}/K) \cong (\mathcal{O}/\pi^n\mathcal{O})^\times\) via the action of Galois on torsion points.</li>
<li>The union \(K_\pi = \bigcup_n K_{\pi,n}\) is the maximal totally ramified abelian extension of \(K\) (with respect to the uniformizer \(\pi\)).</li>
<li>The maximal abelian extension of \(K\) is \(K^{\mathrm{ab}} = K_\pi \cdot K^{\mathrm{ur}}\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof (sketch of key ideas).</strong> Part (1): One shows by induction on \(n\) that \([\pi^n]_f(x)\) is an Eisenstein polynomial of degree \(q^n\) in the variable \([\pi^{n-1}]_f(x)\), hence has exactly \(q^n\) roots in \(\mathfrak{m}_{\bar{K}}\). The \(\mathcal{O}\)-module structure comes from the endomorphisms \([a]_f\).

Part (2): Since \([\pi]_f(x)\) is Eisenstein of degree \(q\), the field \(K_{\pi,1} = K(\lambda_1)\) (where \(\lambda_1\) is a nonzero root of \([\pi]_f\)) is totally ramified of degree \(q-1\) over \(K\). Inductively, each \(K_{\pi,n}/K_{\pi,n-1}\) is totally ramified of degree \(q\).

Part (3): Each \(\sigma \in \mathrm{Gal}(K_{\pi,n}/K)\) preserves the \(\mathcal{O}\)-module \(F_f[\pi^n]\), so acts as an \(\mathcal{O}\)-module automorphism, which must be multiplication by some unit \(u \in (\mathcal{O}/\pi^n\mathcal{O})^\times\). This defines the isomorphism.

Part (5): This is the deepest part. One uses the formal group to construct the local Artin map explicitly: on units \(u \in \mathcal{O}^\times\), the Artin map \(\mathrm{Art}_K(u)\) acts on \(K_\pi\) through the inverse of the action described in (3), and acts trivially on \(K^{\mathrm{ur}}\). On the uniformizer \(\pi\), the Artin map acts trivially on \(K_\pi\) and as Frobenius on \(K^{\mathrm{ur}}\). \(\square\)
</div>

### 4.6 Explicit Computations for \(\mathbb{Q}_p\)

<div class="example">
<strong>Example 4.12 (Local Class Field Theory for \(\mathbb{Q}_p\)).</strong> Take \(K = \mathbb{Q}_p\) with \(\pi = p\). We use the Lubin-Tate series \(f(x) = (1+x)^p - 1\), which corresponds to the formal multiplicative group \(\hat{\mathbb{G}}_m\). The \(p^n\)-torsion points are the elements \(\zeta - 1\) where \(\zeta\) is a \(p^n\)-th root of unity. Thus \(K_{p,n} = \mathbb{Q}_p(\zeta_{p^n})\), and the maximal totally ramified abelian extension is \(\mathbb{Q}_p(\mu_{p^\infty})\), where \(\mu_{p^\infty}\) denotes all \(p\)-power roots of unity.

The maximal abelian extension of \(\mathbb{Q}_p\) is
\[
\mathbb{Q}_p^{\mathrm{ab}} = \mathbb{Q}_p(\mu_{p^\infty}) \cdot \mathbb{Q}_p^{\mathrm{ur}} = \mathbb{Q}_p(\mu_{p^\infty}, \mu_{(p)'}),
\]
where \(\mu_{(p)'}\) denotes roots of unity of order prime to \(p\).

The local Artin map \(\mathrm{Art}_{\mathbb{Q}_p}: \mathbb{Q}_p^\times \to \mathrm{Gal}(\mathbb{Q}_p^{\mathrm{ab}}/\mathbb{Q}_p)\) is determined by:
<ul>
<li>\(\mathrm{Art}_{\mathbb{Q}_p}(p)\) acts as Frobenius on \(\mathbb{Q}_p^{\mathrm{ur}}\) (sending \(\zeta_n \mapsto \zeta_n^p\) for \(\gcd(n,p) = 1\)) and trivially on \(\mathbb{Q}_p(\mu_{p^\infty})\).</li>
<li>\(\mathrm{Art}_{\mathbb{Q}_p}(u)\) for \(u \in \mathbb{Z}_p^\times\) acts trivially on \(\mathbb{Q}_p^{\mathrm{ur}}\) and sends \(\zeta_{p^n} \mapsto \zeta_{p^n}^{u^{-1}}\) on \(\mathbb{Q}_p(\mu_{p^\infty})\).</li>
</ul>
(The inverse appears because of the convention that uniformizers map to Frobenius.)
</div>

### 4.7 The Norm Residue Symbol and Local Hilbert Symbol

<div class="definition">
<strong>Definition 4.13 (Hilbert Symbol).</strong> For a non-archimedean local field \(K\) containing the \(n\)-th roots of unity, the <em>Hilbert symbol</em> is the pairing
\[
(\cdot, \cdot)_n: K^\times \times K^\times \to \mu_n
\]
defined by \((a, b)_n = \mathrm{Art}_K(a)(\beta)/\beta\), where \(\beta^n = b\). This is well-defined and bilinear.
</div>

<div class="proposition">
<strong>Proposition 4.14 (Properties of the Hilbert Symbol).</strong> The Hilbert symbol satisfies:
<ol>
<li>Bilinearity: \((aa', b)_n = (a,b)_n (a',b)_n\) and \((a, bb')_n = (a,b)_n (a,b')_n\).</li>
<li>Skew-symmetry: \((a,b)_n (b,a)_n = 1\).</li>
<li>Non-degeneracy: \((a,b)_n = 1\) for all \(b\) implies \(a \in (K^\times)^n\).</li>
<li>\((a,b)_n = 1\) if and only if \(a\) is a norm from \(K(\sqrt[n]{b})/K\).</li>
</ol>
</div>

The Hilbert symbol for \(n = 2\) directly connects to quadratic reciprocity. For \(K = \mathbb{Q}_p\), the condition \((a,b)_2 = 1\) is equivalent to the equation \(ax^2 + by^2 = z^2\) having a nontrivial solution in \(\mathbb{Q}_p\).

<div class="remark">
<strong>Remark 4.15.</strong> Local class field theory was first proved by Hasse (1930) for the local fields of number fields and by F.K. Schmidt for function fields. The cohomological approach was developed by Hochschild, Nakayama, and later systematized by Artin-Tate and by Serre. The Lubin-Tate approach (1965) gave the first fully explicit construction. More recently, approaches via \((\varphi, \Gamma)\)-modules and via perfectoid spaces (due to Scholze) have provided new perspectives on local class field theory and its non-abelian generalizations.
</div>

---

## Chapter 5: Global Class Field Theory

### 5.1 Motivation: From Local to Global

We now arrive at the summit of these notes: global class field theory. The local theory (Chapter 4) classified abelian extensions of a single local field; the global theory classifies abelian extensions of a number field \(K\) in terms of the idele class group \(C_K = \mathbb{A}_K^\times / K^\times\).

The passage from local to global is guided by the philosophy that a global object should be determined by its local behavior at all places. The adele ring (Chapter 3) provides the framework to make this precise: the global Artin map is assembled from the local Artin maps at all places.

Historically, global class field theory was developed before the local theory. The origins go back to Hilbert's 1897 Zahlbericht, where he conjectured the existence of the Hilbert class field. Artin formulated the reciprocity law in 1923 and proved it in 1927, using a clever reduction to cyclotomic fields due to Chebotarev. The adelic reformulation was developed by Chevalley in the 1930s and 1940s.

### 5.2 The Global Artin Map

The global Artin map is constructed by gluing together the local Artin maps. For each place \(v\) of \(K\), we have the local Artin map \(\mathrm{Art}_{K_v}: K_v^\times \to \mathrm{Gal}(K_v^{\mathrm{ab}}/K_v)\). For a finite abelian extension \(L/K\) and a place \(w\) of \(L\) above \(v\), the local Galois group \(\mathrm{Gal}(L_w/K_v)\) is naturally a decomposition group inside \(\mathrm{Gal}(L/K)\), so we get a map \(\mathrm{Art}_{K_v}: K_v^\times \to \mathrm{Gal}(L/K)\).

<div class="definition">
<strong>Definition 5.1 (Global Artin Map).</strong> The <em>global Artin map</em> is the continuous homomorphism
\[
\mathrm{Art}_K: \mathbb{A}_K^\times \to \mathrm{Gal}(K^{\mathrm{ab}}/K)
\]
defined by
\[
\mathrm{Art}_K(a) = \prod_v \mathrm{Art}_{K_v}(a_v)
\]
for an idele \(a = (a_v)_v\). This product is well-defined because for any finite abelian extension \(L/K\), the local Artin map \(\mathrm{Art}_{K_v}(a_v)\) is trivial whenever \(v\) is unramified in \(L/K\) and \(a_v \in \mathcal{O}_v^\times\), which holds for all but finitely many \(v\).
</div>

<div class="remark">
<strong>Remark 5.2.</strong> When restricted to finite abelian extensions \(L/K\) that are unramified outside a finite set \(S\), and applied to an idele supported only at finite places outside \(S\), the global Artin map recovers the classical Artin map defined on ideals coprime to the ramification. Explicitly, if \(\mathfrak{a} = \prod \mathfrak{p}^{a_\mathfrak{p}}\) is an ideal coprime to the conductor, the classical Artin symbol is
\[
\left(\frac{L/K}{\mathfrak{a}}\right) = \prod_\mathfrak{p} \left(\frac{L/K}{\mathfrak{p}}\right)^{a_\mathfrak{p}} = \prod_\mathfrak{p} \mathrm{Frob}_\mathfrak{p}^{a_\mathfrak{p}}.
\]
</div>

### 5.3 The Artin Reciprocity Law

<div class="theorem">
<strong>Theorem 5.3 (Artin Reciprocity Law).</strong> The global Artin map \(\mathrm{Art}_K: \mathbb{A}_K^\times \to \mathrm{Gal}(K^{\mathrm{ab}}/K)\) satisfies:
<ol>
<li>\(\mathrm{Art}_K\) is surjective.</li>
<li>\(\mathrm{Art}_K\) is trivial on \(K^\times\) (embedded diagonally in \(\mathbb{A}_K^\times\)). That is, for any \(\alpha \in K^\times\),
\[
\prod_v \mathrm{Art}_{K_v}(\alpha) = 1 \in \mathrm{Gal}(K^{\mathrm{ab}}/K).
\]
</li>
<li>Consequently, \(\mathrm{Art}_K\) factors through the idele class group: there is a surjective homomorphism
\[
\mathrm{Art}_K: C_K = \mathbb{A}_K^\times / K^\times \twoheadrightarrow \mathrm{Gal}(K^{\mathrm{ab}}/K).
\]
</li>
<li>For each finite abelian extension \(L/K\), the induced map \(C_K / N_{L/K}(C_L) \xrightarrow{\sim} \mathrm{Gal}(L/K)\) is an isomorphism.</li>
<li>The kernel of \(\mathrm{Art}_K: C_K \to \mathrm{Gal}(K^{\mathrm{ab}}/K)\) is the connected component of the identity \(D_K\) in \(C_K\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof (outline of the strategy).</strong> The proof of the Artin reciprocity law is one of the deepest results in algebraic number theory. We outline the main steps.

<em>Step 1: Reciprocity for cyclotomic extensions.</em> For \(K = \mathbb{Q}\) and \(L = \mathbb{Q}(\zeta_n)\), the reciprocity map can be verified directly. The Artin map sends the idele with component \(a\) at the finite place \(p\) (and 1 elsewhere) to the automorphism \(\zeta_n \mapsto \zeta_n^{a^{-1}}\) (for \(p \nmid n\), this is the Frobenius). The triviality on \(\mathbb{Q}^\times\) can be checked using the explicit description and the product formula.

<em>Step 2: Reduction to the cyclic case.</em> By the theory of group extensions, it suffices to prove the reciprocity law for cyclic extensions. (One uses the fact that every abelian extension is a compositum of cyclic extensions.)

<em>Step 3: The First Inequality.</em> For a cyclic extension \(L/K\) of degree \(n\), one proves
\[
[C_K : N_{L/K}(C_L)] \geq n = [L:K].
\]
This is proved using analytic methods (the behavior of \(L\)-functions at \(s = 1\)).

<em>Step 4: The Second Inequality.</em> One proves the reverse inequality
\[
[C_K : N_{L/K}(C_L)] \leq [L:K].
\]
This is harder and uses cohomological methods (the Herbrand quotient of the idele class group).

<em>Step 5: Assembly.</em> From the two inequalities, \([C_K : N_{L/K}(C_L)] = [L:K]\), so the Artin map is an isomorphism \(C_K/N_{L/K}(C_L) \cong \mathrm{Gal}(L/K)\). The triviality of the Artin map on \(K^\times\) is a separate calculation using the product formula and the consistency of local and global norms. \(\square\)
</div>

<div class="remark">
<strong>Remark 5.4.</strong> The statement that \(\mathrm{Art}_K(\alpha) = 1\) for all \(\alpha \in K^\times\) — the "reciprocity law" proper — is the deepest part of the theorem. In the classical language of ideals, it says that the Artin symbol \(\left(\frac{L/K}{\alpha \mathcal{O}_K}\right) = 1\) for every \(\alpha \in K^\times\) that is positive at all real places ramified in \(L/K\) and congruent to 1 modulo the conductor. This generalizes all classical reciprocity laws (quadratic, cubic, quartic, etc.).
</div>

### 5.4 The Global Existence Theorem

<div class="theorem">
<strong>Theorem 5.5 (Global Existence Theorem).</strong> There is an inclusion-reversing bijection
\[
\left\{\begin{array}{c}\text{finite abelian extensions} \\ L/K\end{array}\right\} \xleftrightarrow{\;1:1\;} \left\{\begin{array}{c}\text{open subgroups of} \\ \text{finite index in } C_K\end{array}\right\}
\]
given by \(L \mapsto N_{L/K}(C_L)\). This correspondence satisfies:
<ul>
<li>\(L_1 \subseteq L_2 \iff N_{L_2/K}(C_{L_2}) \subseteq N_{L_1/K}(C_{L_1})\),</li>
<li>\(L_1 L_2 \leftrightarrow N_1 \cap N_2\),</li>
<li>\(L_1 \cap L_2 \leftrightarrow N_1 N_2\),</li>
<li>\([L:K] = [C_K : N_{L/K}(C_L)]\),</li>
<li>\(\mathrm{Gal}(L/K) \cong C_K / N_{L/K}(C_L)\).</li>
</ul>
</div>

<div class="proof">
<strong>Proof (sketch).</strong> By the reciprocity law, for any finite abelian extension \(L/K\), the norm group \(N_{L/K}(C_L)\) is an open subgroup of finite index in \(C_K\) with \([C_K : N_{L/K}(C_L)] = [L:K]\). Conversely, given an open subgroup \(N\) of finite index in \(C_K\), one needs to construct an abelian extension \(L/K\) with \(N_{L/K}(C_L) = N\). This is done using the Artin map: the quotient \(C_K/N\) is a finite abelian group, and the Artin map provides a surjection onto the Galois group of the corresponding extension. The existence of the extension itself uses the theory of ray class fields (see below). \(\square\)
</div>

### 5.5 Ray Class Fields and the Conductor

To make the existence theorem explicit, we introduce the notion of a modulus and the associated ray class groups and fields.

<div class="definition">
<strong>Definition 5.6 (Modulus).</strong> A <em>modulus</em> of \(K\) is a formal product
\[
\mathfrak{m} = \prod_{v} v^{n_v}
\]
where \(n_v \geq 0\) for all places, \(n_v = 0\) for all but finitely many, and:
<ul>
<li>For finite places, \(n_v \geq 0\) is an arbitrary non-negative integer.</li>
<li>For real places, \(n_v \in \{0, 1\}\).</li>
<li>For complex places, \(n_v = 0\).</li>
</ul>
We write \(\mathfrak{m} = \mathfrak{m}_0 \mathfrak{m}_\infty\) where \(\mathfrak{m}_0\) is the finite part (an ideal of \(\mathcal{O}_K\)) and \(\mathfrak{m}_\infty\) is the infinite part (a subset of the real places).
</div>

<div class="definition">
<strong>Definition 5.7 (Ray Class Group).</strong> For a modulus \(\mathfrak{m}\), the <em>ray class group modulo \(\mathfrak{m}\)</em> is
\[
\mathrm{Cl}_\mathfrak{m}(K) = I^\mathfrak{m}(K) / P_\mathfrak{m}(K),
\]
where \(I^\mathfrak{m}(K)\) is the group of fractional ideals coprime to \(\mathfrak{m}_0\), and \(P_\mathfrak{m}(K)\) is the subgroup of principal ideals \((\alpha)\) with \(\alpha \equiv 1 \pmod{\mathfrak{m}_0}\) and \(\sigma(\alpha) > 0\) for every real embedding \(\sigma\) appearing in \(\mathfrak{m}_\infty\).
</div>

<div class="proposition">
<strong>Proposition 5.8.</strong> The ray class group \(\mathrm{Cl}_\mathfrak{m}(K)\) is a finite abelian group. When \(\mathfrak{m} = 1\) (the trivial modulus), it is the ordinary class group \(\mathrm{Cl}(K)\). The ray class group fits into an exact sequence
\[
(\mathcal{O}_K/\mathfrak{m}_0)^\times \times \{\pm 1\}^{|\mathfrak{m}_\infty|} \to \mathrm{Cl}_\mathfrak{m}(K) \to \mathrm{Cl}(K) \to 1.
\]
</div>

The adelic description is cleaner: define the subgroup \(U_\mathfrak{m} \subseteq \mathbb{A}_K^\times\) by
\[
U_\mathfrak{m} = \prod_{v | \mathfrak{m}_\infty} \mathbb{R}_{>0} \times \prod_{v | \mathfrak{m}_0} (1 + \mathfrak{p}_v^{n_v}) \times \prod_{v \nmid \mathfrak{m}} \mathcal{O}_v^\times.
\]
Then \(\mathrm{Cl}_\mathfrak{m}(K) \cong \mathbb{A}_K^\times / (K^\times \cdot U_\mathfrak{m})\).

<div class="definition">
<strong>Definition 5.9 (Ray Class Field).</strong> The <em>ray class field</em> modulo \(\mathfrak{m}\), denoted \(K(\mathfrak{m})\), is the finite abelian extension of \(K\) corresponding to the open subgroup \(K^\times \cdot U_\mathfrak{m}\) of \(\mathbb{A}_K^\times\) (equivalently, to the image of \(U_\mathfrak{m}\) in \(C_K\)) under the Artin map. It satisfies:
\[
\mathrm{Gal}(K(\mathfrak{m})/K) \cong \mathrm{Cl}_\mathfrak{m}(K).
\]
</div>

<div class="remark">
<strong>Remark 5.10.</strong> Every finite abelian extension \(L/K\) is contained in some ray class field \(K(\mathfrak{m})\). The smallest such \(\mathfrak{m}\) is the <em>conductor</em> of \(L/K\), denoted \(\mathfrak{f}(L/K)\). A prime \(v\) ramifies in \(L/K\) if and only if \(v\) divides the conductor. The conductor measures the "depth of ramification" in a precise sense.
</div>

### 5.6 The Hilbert Class Field

The simplest and most beautiful case of global class field theory is the Hilbert class field.

<div class="definition">
<strong>Definition 5.11 (Hilbert Class Field).</strong> The <em>Hilbert class field</em> of \(K\), denoted \(H_K\), is the maximal unramified abelian extension of \(K\). It is the ray class field for the trivial modulus \(\mathfrak{m} = 1\).
</div>

<div class="theorem">
<strong>Theorem 5.12 (Properties of the Hilbert Class Field).</strong> Let \(H_K\) be the Hilbert class field of \(K\).
<ol>
<li>\(\mathrm{Gal}(H_K/K) \cong \mathrm{Cl}(K)\).</li>
<li>Every ideal of \(\mathcal{O}_K\) becomes principal in \(\mathcal{O}_{H_K}\) (the <em>principal ideal theorem</em>, proved by Furtwängler in 1930).</li>
<li>A prime \(\mathfrak{p}\) of \(K\) splits completely in \(H_K/K\) if and only if \(\mathfrak{p}\) is principal.</li>
<li>\(H_K\) is unramified at all places (finite and infinite).</li>
</ol>
</div>

<div class="proof">
<strong>Proof of (1) and (3).</strong> Part (1) is immediate from the general theory: the Hilbert class field corresponds to the trivial modulus, and \(\mathrm{Cl}_1(K) = \mathrm{Cl}(K)\).

For part (3), a prime \(\mathfrak{p}\) splits completely in an abelian extension if and only if the Frobenius \(\mathrm{Frob}_\mathfrak{p}\) is trivial. Under the Artin isomorphism \(\mathrm{Gal}(H_K/K) \cong \mathrm{Cl}(K)\), the Frobenius at \(\mathfrak{p}\) corresponds to the class \([\mathfrak{p}] \in \mathrm{Cl}(K)\). So \(\mathrm{Frob}_\mathfrak{p} = 1\) if and only if \([\mathfrak{p}]\) is the trivial class, i.e., \(\mathfrak{p}\) is principal. \(\square\)
</div>

<div class="example">
<strong>Example 5.13.</strong> For \(K = \mathbb{Q}(\sqrt{-5})\), we computed that \(\mathrm{Cl}(K) \cong \mathbb{Z}/2\mathbb{Z}\). The Hilbert class field is \(H_K = K(\sqrt{-1}) = \mathbb{Q}(\sqrt{-5}, \sqrt{-1})\). One can verify:
<ul>
<li>This is a degree 2 extension of \(K\), consistent with \(|\mathrm{Cl}(K)| = 2\).</li>
<li>It is unramified over \(K\) at all primes: the discriminant of \(\mathbb{Q}(\sqrt{-5}, \sqrt{-1})/\mathbb{Q}(\sqrt{-5})\) divides the discriminant of \(\mathbb{Q}(\sqrt{-1})/\mathbb{Q}\) restricted appropriately, and one checks no prime ramifies.</li>
<li>In \(\mathcal{O}_{H_K}\), the ideal \((2, 1+\sqrt{-5})\) becomes principal: indeed, \(2 = -i(1+i)^2\) and \(1+\sqrt{-5} = (1+i)(1+\frac{-1+\sqrt{-5}}{1+i})\) can be factored using elements of \(H_K\).</li>
<li>A prime \(p\) splits completely in \(H_K/\mathbb{Q}\) if and only if \(p\) is represented by the form \(x^2 + 5y^2\) (which corresponds to \(p\) splitting into principal primes in \(\mathcal{O}_K\)).</li>
</ul>
</div>

<div class="remark">
<strong>Remark 5.14.</strong> The question "which primes are represented by \(x^2 + ny^2\)?" was studied by Fermat, Euler, and Gauss, and motivated much of the development of algebraic number theory. Class field theory provides the definitive answer: \(p\) is represented by \(x^2 + ny^2\) (for \(n\) squarefree and \(p \nmid 4n\)) if and only if \(p\) splits completely in the Hilbert class field of \(\mathbb{Q}(\sqrt{-n})\), which is equivalent to a polynomial congruence condition on \(p\). David Cox's book <em>Primes of the Form \(x^2 + ny^2\)</em> beautifully traces this story from Fermat to class field theory.
</div>

### 5.7 The Conductor-Discriminant Formula

<div class="theorem">
<strong>Theorem 5.15 (Conductor-Discriminant Formula).</strong> Let \(L/K\) be a finite abelian extension with Galois group \(G\). Then the discriminant of \(L/K\) satisfies
\[
\mathfrak{D}_{L/K} = \prod_{\chi \in \hat{G}} \mathfrak{f}(\chi),
\]
where the product runs over all characters \(\chi: G \to \mathbb{C}^\times\) of the Galois group, and \(\mathfrak{f}(\chi)\) is the conductor of \(\chi\) (the conductor of the fixed field of \(\ker(\chi)\), viewed as an ideal).
</div>

This formula is a deep connection between ramification data (the discriminant), the Galois group, and the conductors of the associated characters. It generalizes the formula for the discriminant of a cyclotomic field.

<div class="example">
<strong>Example 5.16.</strong> For the cyclotomic extension \(\mathbb{Q}(\zeta_p)/\mathbb{Q}\) (with \(p\) an odd prime), the Galois group is \(G \cong (\mathbb{Z}/p\mathbb{Z})^\times\), which has \(p-1\) characters. Each nontrivial character has conductor \(p\), and the trivial character has conductor 1. So the conductor-discriminant formula gives
\[
\mathfrak{D}_{\mathbb{Q}(\zeta_p)/\mathbb{Q}} = (p)^{p-2}.
\]
Indeed, the discriminant of \(\mathbb{Q}(\zeta_p)\) is \((-1)^{(p-1)/2} p^{p-2}\), confirming the formula.
</div>

### 5.8 Genus Theory

Genus theory, initiated by Gauss for binary quadratic forms, is one of the earliest instances of class field theory. It provides a partial computation of the class group using only the arithmetic of the base field.

<div class="definition">
<strong>Definition 5.17 (Genus Field).</strong> Let \(K/\mathbb{Q}\) be an abelian extension. The <em>genus field</em> \(K^*\) of \(K\) is the maximal extension of \(K\) that is abelian over \(\mathbb{Q}\) and unramified over \(K\). The <em>genus group</em> is \(\mathrm{Gal}(K^*/K)\), which is a quotient of \(\mathrm{Cl}(K)\).
</div>

<div class="theorem">
<strong>Theorem 5.18 (Genus Theory for Quadratic Fields).</strong> Let \(K = \mathbb{Q}(\sqrt{d})\) where \(d\) is a squarefree integer, and let \(t\) be the number of prime discriminant divisors of the discriminant \(\Delta_K\). Then:
<ol>
<li>The genus field \(K^*\) has degree \(2^{t-1}\) over \(K\).</li>
<li>The number of genera (classes in the genus group) is \(2^{t-1}\).</li>
<li>The 2-rank of \(\mathrm{Cl}(K)\) is \(t - 1\).</li>
</ol>
</div>

<div class="example">
<strong>Example 5.19.</strong> For \(K = \mathbb{Q}(\sqrt{-56})\), the discriminant is \(\Delta_K = -224 = -2^5 \cdot 7\). The prime discriminant divisors are \(-4\), \(8\), and \(-7\), so \(t = 3\) and the genus group has order \(2^2 = 4\). This means \(\mathrm{Cl}(K)\) has 2-rank at least 2.
</div>

---

## Chapter 6: L-functions and Density Theorems

### 6.1 The Dedekind Zeta Function

Analytic methods have been inseparable from algebraic number theory since Dirichlet's 1837 proof that there are infinitely many primes in arithmetic progressions. The \(L\)-functions of number fields encode deep arithmetic information, and their analytic properties are essential tools in the proofs of class field theory.

<div class="definition">
<strong>Definition 6.1 (Dedekind Zeta Function).</strong> For a number field \(K\), the <em>Dedekind zeta function</em> is
\[
\zeta_K(s) = \sum_{\mathfrak{a} \subseteq \mathcal{O}_K} \frac{1}{(N\mathfrak{a})^s} = \prod_{\mathfrak{p}} \frac{1}{1 - (N\mathfrak{p})^{-s}},
\]
where the sum runs over nonzero ideals and the product over nonzero prime ideals of \(\mathcal{O}_K\). Both converge absolutely for \(\mathrm{Re}(s) > 1\).
</div>

When \(K = \mathbb{Q}\), this is the Riemann zeta function \(\zeta(s) = \sum_{n=1}^\infty n^{-s}\). The Euler product (the second expression) encodes the unique factorization of ideals, just as the Euler product for \(\zeta(s)\) encodes the unique factorization of integers.

<div class="theorem">
<strong>Theorem 6.2 (Analytic Properties of \(\zeta_K\)).</strong> The Dedekind zeta function \(\zeta_K(s)\) has the following properties:
<ol>
<li>It converges absolutely for \(\mathrm{Re}(s) > 1\) and extends to a meromorphic function on \(\mathbb{C}\).</li>
<li>It has a simple pole at \(s = 1\) and no other poles.</li>
<li>It satisfies a functional equation relating \(\zeta_K(s)\) and \(\zeta_K(1-s)\), involving the completed zeta function \(\Lambda_K(s) = |d_K|^{s/2} \gamma_K(s) \zeta_K(s)\), where \(\gamma_K(s)\) is a product of gamma factors.</li>
</ol>
</div>

### 6.2 The Analytic Class Number Formula

One of the most beautiful results in analytic number theory is the formula for the residue of \(\zeta_K(s)\) at \(s = 1\), which connects the analytic behavior of the zeta function to the arithmetic invariants of \(K\).

<div class="theorem">
<strong>Theorem 6.3 (Analytic Class Number Formula).</strong> The Dedekind zeta function has the Laurent expansion at \(s = 1\):
\[
\zeta_K(s) = \frac{\kappa}{s - 1} + O(1) \quad \text{as } s \to 1,
\]
where the residue is
\[
\kappa = \lim_{s \to 1^+} (s-1)\zeta_K(s) = \frac{2^{r_1}(2\pi)^{r_2} h_K R_K}{w_K \sqrt{|\Delta_K|}}.
\]
Here \(r_1\) is the number of real places, \(r_2\) the number of complex places, \(h_K = |\mathrm{Cl}(K)|\) is the class number, \(R_K\) is the regulator (the covolume of the unit lattice under the log embedding), \(w_K = |\mu_K|\) is the number of roots of unity, and \(\Delta_K\) is the discriminant.
</div>

<div class="proof">
<strong>Proof (sketch).</strong> The proof proceeds by counting lattice points. One splits the sum over ideals into a sum over ideal classes: \(\zeta_K(s) = \sum_{[\mathfrak{a}] \in \mathrm{Cl}(K)} \sum_{\mathfrak{b} \in [\mathfrak{a}]} (N\mathfrak{b})^{-s}\). For each class, the inner sum is computed by counting the number of ideals of norm at most \(x\) using geometry of numbers (Minkowski's theorem in the Minkowski space \(K \otimes_\mathbb{Q} \mathbb{R} \cong \mathbb{R}^{r_1} \times \mathbb{C}^{r_2}\)). The leading term of this count is \(\frac{2^{r_1}(2\pi)^{r_2} R_K}{w_K \sqrt{|\Delta_K|}} \cdot x\), and summing over all \(h_K\) classes gives the residue. \(\square\)
</div>

<div class="example">
<strong>Example 6.4.</strong> For \(K = \mathbb{Q}(\sqrt{-5})\), we have \(r_1 = 0\), \(r_2 = 1\), \(h_K = 2\), \(w_K = 2\), \(R_K = 1\) (since the unit rank is 0), and \(|\Delta_K| = 20\). The class number formula gives
\[
\kappa = \frac{2^0 \cdot (2\pi)^1 \cdot 2 \cdot 1}{2 \cdot \sqrt{20}} = \frac{2\pi}{\sqrt{20}} = \frac{\pi}{\sqrt{5}}.
\]
This can be verified numerically: the partial sums of \((s-1)\zeta_K(s)\) converge to \(\pi/\sqrt{5} \approx 1.4050\) as \(s \to 1^+\).
</div>

### 6.3 Dirichlet and Hecke L-functions

To study the distribution of primes in extensions and to prove the main theorems of class field theory, we need \(L\)-functions twisted by characters.

<div class="definition">
<strong>Definition 6.5 (Hecke L-function).</strong> Let \(\chi: C_K \to \mathbb{C}^\times\) be a continuous character of the idele class group (a <em>Hecke character</em> or <em>Grössencharakter</em>). The <em>Hecke \(L\)-function</em> is
\[
L(s, \chi) = \prod_{\mathfrak{p} \text{ unramified}} \frac{1}{1 - \chi(\mathfrak{p})(N\mathfrak{p})^{-s}},
\]
where \(\chi(\mathfrak{p})\) is the value of \(\chi\) on a uniformizer at \(\mathfrak{p}\) (well-defined for unramified primes). This converges for \(\mathrm{Re}(s) > 1\).
</div>

When \(\chi\) is trivial, \(L(s, \chi) = \zeta_K(s)\). When \(K = \mathbb{Q}\), a Hecke character of finite order is essentially a Dirichlet character, and we recover Dirichlet \(L\)-functions.

<div class="theorem">
<strong>Theorem 6.6 (Analytic Continuation of Hecke \(L\)-functions).</strong>
<ol>
<li>If \(\chi \neq 1\), then \(L(s, \chi)\) extends to an entire function on \(\mathbb{C}\).</li>
<li>\(L(s, \chi)\) satisfies a functional equation relating \(s\) and \(1 - s\).</li>
<li>(Key non-vanishing) \(L(1, \chi) \neq 0\) for \(\chi \neq 1\).</li>
</ol>
</div>

The non-vanishing \(L(1, \chi) \neq 0\) is the analytic heart of class field theory. For Dirichlet \(L\)-functions, this is Dirichlet's theorem. For general Hecke \(L\)-functions, this was proved by Hecke using the analytic class number formula for ray class fields.

<div class="remark">
<strong>Remark 6.7.</strong> The adelic approach to \(L\)-functions, pioneered by Tate in his 1950 thesis, reproves the analytic continuation and functional equation using Fourier analysis on the adele ring \(\mathbb{A}_K\). One defines a zeta integral
\[
Z(f, \chi, s) = \int_{\mathbb{A}_K^\times} f(x) \chi(x) \|x\|^s \, d^\times x
\]
for a suitable test function \(f\), and applies the Poisson summation formula (generalized to \(\mathbb{A}_K/K\)) to establish the functional equation. This beautiful approach treats all places uniformly and is the prototype for the theory of automorphic \(L\)-functions.
</div>

### 6.4 Factorization of the Dedekind Zeta Function

A crucial tool is the factorization of the Dedekind zeta function of an abelian extension as a product of \(L\)-functions over the base field.

<div class="theorem">
<strong>Theorem 6.8.</strong> Let \(L/K\) be a finite abelian extension with Galois group \(G\). Then
\[
\zeta_L(s) = \prod_{\chi \in \hat{G}} L(s, \chi),
\]
where the product runs over all characters \(\chi: G \to \mathbb{C}^\times\), viewed as Hecke characters of \(K\) via the Artin map.
</div>

<div class="proof">
<strong>Proof.</strong> This is a formal consequence of character theory. At an unramified prime \(\mathfrak{p}\) of \(K\), the Euler factor of \(\zeta_L(s)\) is
\[
\prod_{\mathfrak{P} | \mathfrak{p}} \frac{1}{1 - (N\mathfrak{P})^{-s}} = \left(\frac{1}{1 - (N\mathfrak{p})^{-fs}}\right)^g,
\]
where \(f = f(\mathfrak{P}|\mathfrak{p})\) and \(g = [L:K]/f\) (since \(e = 1\)). On the other hand, the product \(\prod_\chi (1 - \chi(\mathrm{Frob}_\mathfrak{p}) (N\mathfrak{p})^{-s})^{-1}\) equals the same expression, because the \(\chi(\mathrm{Frob}_\mathfrak{p})\) are the \(f\)-th roots of unity with appropriate multiplicities (by the character orthogonality relations). \(\square\)
</div>

### 6.5 The Chebotarev Density Theorem

The Chebotarev density theorem is one of the most important results in algebraic number theory, generalizing both Dirichlet's theorem on primes in arithmetic progressions and the fact that primes in a given splitting type have a natural density.

<div class="theorem">
<strong>Theorem 6.9 (Chebotarev Density Theorem).</strong> Let \(L/K\) be a finite Galois extension with group \(G\). For each conjugacy class \(C\) of \(G\), define
\[
\pi_C(x) = \#\{\mathfrak{p} \text{ prime of } K : N\mathfrak{p} \leq x, \, \mathfrak{p} \text{ unramified in } L/K, \, \mathrm{Frob}_\mathfrak{p} \in C\}.
\]
Then
\[
\pi_C(x) \sim \frac{|C|}{|G|} \cdot \frac{x}{\log x} \quad \text{as } x \to \infty.
\]
Equivalently, the set of primes with Frobenius in \(C\) has Dirichlet density \(|C|/|G|\).
</div>

<div class="proof">
<strong>Proof (sketch).</strong> The proof uses the \(L\)-functions \(L(s, \chi, L/K)\) for characters \(\chi\) of \(G\). The key inputs are:

(1) The Euler product gives \(\log L(s, \chi) = \sum_\mathfrak{p} \chi(\mathrm{Frob}_\mathfrak{p}) (N\mathfrak{p})^{-s} + O(1)\) for \(\mathrm{Re}(s) > 1\).

(2) Character orthogonality: \(\sum_\chi \bar{\chi}(\sigma) \chi(\mathrm{Frob}_\mathfrak{p}) = |G| \cdot \mathbf{1}_{\mathrm{Frob}_\mathfrak{p} \in C_\sigma}\) (where \(C_\sigma\) is the conjugacy class of \(\sigma\)).

(3) Non-vanishing: \(L(1, \chi) \neq 0\) for \(\chi \neq 1\), so \(\log L(s, \chi)\) is bounded as \(s \to 1^+\) for nontrivial \(\chi\), while \(\log L(s, 1) = \log \zeta_K(s) \sim \log \frac{1}{s-1}\) has a logarithmic singularity.

Combining these with character orthogonality, we get
\[
\sum_{\substack{\mathfrak{p}: \mathrm{Frob}_\mathfrak{p} \in C}} (N\mathfrak{p})^{-s} = \frac{|C|}{|G|} \log \frac{1}{s-1} + O(1) \quad \text{as } s \to 1^+,
\]
which gives Dirichlet density \(|C|/|G|\). Upgrading to natural density requires more work (using the zero-free region of \(L\)-functions). \(\square\)
</div>

<div class="corollary">
<strong>Corollary 6.10 (Dirichlet's Theorem).</strong> For \(\gcd(a, n) = 1\), the set of primes \(p \equiv a \pmod{n}\) has Dirichlet density \(1/\varphi(n)\).
</div>

<div class="proof">
<strong>Proof.</strong> Apply Chebotarev to \(L = \mathbb{Q}(\zeta_n)\), \(K = \mathbb{Q}\), and the conjugacy class of the element \(a \in (\mathbb{Z}/n\mathbb{Z})^\times \cong \mathrm{Gal}(L/K)\). Since the Galois group is abelian, every conjugacy class is a singleton, so the density is \(1/\varphi(n)\). \(\square\)
</div>

<div class="corollary">
<strong>Corollary 6.11.</strong> Let \(L/K\) be a Galois extension of number fields. Then the set of primes of \(K\) that split completely in \(L\) has density \(1/[L:K]\).
</div>

<div class="proof">
<strong>Proof.</strong> A prime \(\mathfrak{p}\) splits completely if and only if \(\mathrm{Frob}_\mathfrak{p} = 1\), which is the conjugacy class \(\{1\}\) of size 1. By Chebotarev, the density is \(1/|G| = 1/[L:K]\). \(\square\)
</div>

<div class="remark">
<strong>Remark 6.12.</strong> The Chebotarev density theorem was proved by Nikolai Chebotarev in 1922 (published in 1926). It was a sensation in the mathematical world: Artin had conjectured that his reciprocity law held, and Chebotarev's theorem (together with a reduction argument) provided the key ingredient for Artin's 1927 proof of the reciprocity law. Emil Artin wrote that Chebotarev's theorem was "the greatest advance in number theory in recent times."
</div>

### 6.6 Artin L-functions

The \(L\)-functions we have considered so far are associated to one-dimensional characters. For non-abelian extensions, the correct generalization involves representations of the Galois group.

<div class="definition">
<strong>Definition 6.13 (Artin L-function).</strong> Let \(L/K\) be a Galois extension with group \(G\), and let \(\rho: G \to \mathrm{GL}(V)\) be a finite-dimensional complex representation. The <em>Artin \(L\)-function</em> is
\[
L(s, \rho, L/K) = \prod_{\mathfrak{p}} \det\left(I - \rho(\mathrm{Frob}_\mathfrak{p}) (N\mathfrak{p})^{-s} \mid V^{I_\mathfrak{p}}\right)^{-1},
\]
where \(V^{I_\mathfrak{p}}\) is the subspace fixed by the inertia group \(I_\mathfrak{p}\).
</div>

<div class="remark">
<strong>Remark 6.14.</strong> Artin conjectured that for nontrivial irreducible representations \(\rho\), the \(L\)-function \(L(s, \rho, L/K)\) extends to an entire function. This <em>Artin conjecture</em> remains open in general, though it is known for monomial representations (by Artin-Brauer induction) and for many two-dimensional representations (by the modularity theorem and its generalizations). The Artin conjecture is intimately connected to the Langlands program: it follows from the Langlands reciprocity conjecture, which predicts that every Artin \(L\)-function equals the \(L\)-function of an automorphic representation.
</div>

When \(\rho\) is one-dimensional, i.e., a character \(\chi: G \to \mathbb{C}^\times\), and \(L/K\) is abelian, the Artin \(L\)-function coincides with the Hecke \(L\)-function associated to \(\chi\) via the Artin map. This is the content of "Artin reciprocity at the level of \(L\)-functions."

### 6.7 Distribution of Primes in Abelian Extensions

As a capstone application of the analytic machinery, let us state precisely how the Chebotarev density theorem, combined with class field theory, governs the distribution of primes.

<div class="theorem">
<strong>Theorem 6.15.</strong> Let \(L/K\) be a finite abelian extension with conductor \(\mathfrak{f}\). A prime \(\mathfrak{p}\) of \(K\) (coprime to \(\mathfrak{f}\)) splits completely in \(L/K\) if and only if \(\mathfrak{p}\) lies in the kernel of the Artin map, i.e., \(\mathfrak{p}\) maps to the identity in \(\mathrm{Gal}(L/K) \cong \mathrm{Cl}_\mathfrak{f}(K)/H\) for the appropriate subgroup \(H\). The set of such primes has density \(1/[L:K]\) among all primes of \(K\).
</div>

More generally, for each element \(\sigma \in \mathrm{Gal}(L/K)\), the set of primes \(\mathfrak{p}\) with \(\mathrm{Frob}_\mathfrak{p} = \sigma\) is determined by a congruence condition (namely, the class of \(\mathfrak{p}\) in \(\mathrm{Cl}_\mathfrak{f}(K)\)), and the density of this set is \(1/[L:K]\). This is the abelian analogue of the Sato-Tate conjecture: in abelian extensions, primes are equidistributed among Frobenius elements.

---

## Chapter 7: Applications and Outlook

### 7.1 Quadratic Reciprocity from Artin Reciprocity

We begin the applications by showing that the grand theorem of class field theory — the Artin reciprocity law — subsumes the classical reciprocity laws. This is fitting, since Gauss's law of quadratic reciprocity was the original inspiration for the entire theory.

<div class="theorem">
<strong>Theorem 7.1 (Quadratic Reciprocity, Classical Form).</strong> For distinct odd primes \(p\) and \(q\),
\[
\left(\frac{p}{q}\right)\left(\frac{q}{p}\right) = (-1)^{\frac{p-1}{2} \cdot \frac{q-1}{2}}.
\]
</div>

<div class="proof">
<strong>Proof (via Artin reciprocity).</strong> Consider the quadratic extension \(L = \mathbb{Q}(\sqrt{p^*})\) where \(p^* = (-1)^{(p-1)/2} p\), so that \(p^* \equiv 1 \pmod{4}\) and the discriminant of \(L\) is \(p^*\). The Artin map gives an isomorphism \(\mathrm{Gal}(L/\mathbb{Q}) \cong (\mathbb{Z}/|p^*|\mathbb{Z})^\times / \{\pm 1\}\).

For an odd prime \(q \neq p\), the Frobenius \(\mathrm{Frob}_q \in \mathrm{Gal}(L/\mathbb{Q}) \cong \{1, -1\}\) is determined by:
\[
\mathrm{Frob}_q = \left(\frac{p^*}{q}\right) = \left(\frac{(-1)^{(p-1)/2} p}{q}\right) = (-1)^{\frac{p-1}{2} \cdot \frac{q-1}{2}} \left(\frac{p}{q}\right).
\]
On the other hand, by the Artin reciprocity law applied to the map on ideals, the Frobenius at \(q\) is determined by the class of \(q\) modulo \(|p^*|\):
\[
\mathrm{Frob}_q = \left(\frac{q}{|p^*|}\right) = \left(\frac{q}{p}\right)
\]
(the second equality uses the fact that the conductor of \(L\) is \(|p^*|\) and the Artin map corresponds to the Legendre symbol). Comparing the two expressions:
\[
(-1)^{\frac{p-1}{2} \cdot \frac{q-1}{2}} \left(\frac{p}{q}\right) = \left(\frac{q}{p}\right),
\]
which is quadratic reciprocity. \(\square\)
</div>

<div class="remark">
<strong>Remark 7.2.</strong> This proof may seem circular — aren't we using much heavier machinery to prove a simpler result? The point is not efficiency but illumination. Quadratic reciprocity is revealed to be a special case of the general principle that the Artin map is trivial on principal ideals. Every reciprocity law in algebraic number theory (cubic, quartic, Eisenstein, etc.) follows from the same principle.
</div>

### 7.2 The Kronecker-Weber Theorem

<div class="theorem">
<strong>Theorem 7.3 (Kronecker-Weber).</strong> Every finite abelian extension of \(\mathbb{Q}\) is contained in a cyclotomic field \(\mathbb{Q}(\zeta_n)\) for some \(n\).
</div>

<div class="proof">
<strong>Proof (via class field theory).</strong> By the global existence theorem, every finite abelian extension \(L/\mathbb{Q}\) corresponds to an open subgroup \(N \subseteq C_\mathbb{Q} = \mathbb{A}_\mathbb{Q}^\times / \mathbb{Q}^\times\) of finite index. We need to show that every such \(N\) contains the norm group of some cyclotomic field \(\mathbb{Q}(\zeta_n)\).

The idele class group of \(\mathbb{Q}\) has a simple structure. By the strong approximation theorem and the fact that \(\mathrm{Cl}(\mathbb{Q})\) is trivial, we have
\[
C_\mathbb{Q} \cong \mathbb{R}_{>0} \times \prod_p \mathbb{Z}_p^\times / \{\pm 1\} \cong \mathbb{R}_{>0} \times \hat{\mathbb{Z}}^\times.
\]
An open subgroup of finite index in \(C_\mathbb{Q}\) must contain \(\mathbb{R}_{>0}\) (since \(\mathbb{R}_{>0}\) is connected) and an open subgroup of the form \(\prod_p (1 + p^{n_p} \mathbb{Z}_p)\) for some \(n_p\) (with \(n_p = 0\) for all but finitely many \(p\)). Setting \(n = \prod_p p^{n_p}\), this is exactly the norm group of \(\mathbb{Q}(\zeta_n)\). \(\square\)
</div>

<div class="remark">
<strong>Remark 7.4.</strong> The Kronecker-Weber theorem was first stated by Kronecker in 1853 and proved rigorously by Weber in 1886 (with a gap later fixed by Hilbert). It can also be proved using only local class field theory and the Hasse-Minkowski theorem, without the full force of global class field theory. The point of the proof above is to show how naturally it follows from the idelic formulation.
</div>

### 7.3 Hilbert's Twelfth Problem

Having shown that all abelian extensions of \(\mathbb{Q}\) arise from roots of unity (values of the exponential function \(e^{2\pi i z}\) at rational arguments), one naturally asks: can we do the same for abelian extensions of an arbitrary number field?

<div class="remark">
<strong>Remark 7.5 (Hilbert's 12th Problem — Kronecker's Jugendtraum).</strong> Hilbert's 12th problem asks: for a number field \(K\), find explicit analytic functions whose special values generate all abelian extensions of \(K\).

For \(K = \mathbb{Q}\), the answer is the exponential function (Kronecker-Weber).

For an imaginary quadratic field \(K = \mathbb{Q}(\sqrt{-d})\), the answer is given by the theory of <em>complex multiplication</em> (CM): the abelian extensions of \(K\) are generated by:
<ul>
<li>The \(j\)-invariant \(j(\mathcal{O}_K)\) of the elliptic curve with CM by \(\mathcal{O}_K\), which generates the Hilbert class field.</li>
<li>The values of suitable elliptic functions (Weber functions, Siegel units, etc.) at torsion points, which generate the ray class fields.</li>
</ul>

For other number fields, Hilbert's 12th problem remains wide open. There are partial results for CM fields using abelian varieties with complex multiplication (the Shimura-Taniyama theory), but a complete answer is not known for any non-abelian number field.
</div>

### 7.4 Complex Multiplication Preview

<div class="theorem">
<strong>Theorem 7.6 (Main Theorem of Complex Multiplication).</strong> Let \(K\) be an imaginary quadratic field with ring of integers \(\mathcal{O}_K\), and let \(E\) be an elliptic curve over \(\mathbb{C}\) with \(\mathrm{End}(E) \cong \mathcal{O}_K\). Then:
<ol>
<li>The \(j\)-invariant \(j(E)\) is an algebraic integer, and \(K(j(E))\) is the Hilbert class field \(H_K\) of \(K\).</li>
<li>For each ideal \(\mathfrak{a}\) of \(\mathcal{O}_K\), the value \(j(\mathfrak{a})\) (the \(j\)-invariant of the elliptic curve \(\mathbb{C}/\mathfrak{a}\)) is a conjugate of \(j(E)\) under \(\mathrm{Gal}(H_K/K)\), and the action of the Galois group is given by the Artin map:
\[
\left(\frac{H_K/K}{\mathfrak{p}}\right)(j(\mathfrak{a})) = j(\mathfrak{p}^{-1}\mathfrak{a}).
\]
</li>
<li>The ray class fields of \(K\) are generated over \(H_K\) by the coordinates of torsion points on \(E\).</li>
</ol>
</div>

<div class="example">
<strong>Example 7.7.</strong> For \(K = \mathbb{Q}(\sqrt{-1})\), the elliptic curve \(E: y^2 = x^3 - x\) has CM by \(\mathbb{Z}[i] = \mathcal{O}_K\) (the endomorphism \(i\) acts by \((x, y) \mapsto (-x, iy)\)). The \(j\)-invariant is \(j(E) = 1728\), which is rational, confirming that the Hilbert class field is \(K\) itself (since \(h_K = 1\)). The ray class fields are generated by torsion points, and these turn out to coincide with the cyclotomic extensions \(K(\zeta_n)\) — consistent with the fact that the abelian extensions of \(\mathbb{Q}(i)\) have a particularly transparent description.
</div>

<div class="example">
<strong>Example 7.8.</strong> For \(K = \mathbb{Q}(\sqrt{-5})\), with \(h_K = 2\), the Hilbert class field is \(H_K = K(\sqrt{-1})\). The CM theory says that the \(j\)-invariant of an elliptic curve with CM by \(\mathcal{O}_K = \mathbb{Z}[\sqrt{-5}]\) generates \(H_K\) over \(K\). Since \(\mathcal{O}_K\) is not a PID, the lattice \(\mathcal{O}_K \subset \mathbb{C}\) and the lattice representing the non-principal ideal class give two different elliptic curves, with \(j\)-invariants that are conjugate over \(K\) and satisfy a degree-2 polynomial over \(K\). The splitting field of this polynomial over \(K\) is exactly \(H_K\).
</div>

### 7.5 Introduction to the Langlands Program

Class field theory classifies abelian extensions — but what about non-abelian extensions? The Langlands program, proposed by Robert Langlands in a famous 1967 letter to André Weil, is an ambitious framework that extends class field theory to the non-abelian setting.

<div class="remark">
<strong>Remark 7.9 (The Langlands Reciprocity Conjecture).</strong> The global Langlands correspondence for \(\mathrm{GL}_n\) over a number field \(K\) predicts a bijection between:
<ul>
<li><em>Galois side</em>: \(n\)-dimensional continuous representations \(\rho: \mathrm{Gal}(\bar{K}/K) \to \mathrm{GL}_n(\mathbb{C})\) (more precisely, certain \(\ell\)-adic or motivic Galois representations), and</li>
<li><em>Automorphic side</em>: cuspidal automorphic representations of \(\mathrm{GL}_n(\mathbb{A}_K)\).</li>
</ul>
This bijection should match the \(L\)-functions on both sides: the Artin \(L\)-function of \(\rho\) should equal the automorphic \(L\)-function of the corresponding automorphic representation.

For \(n = 1\), this is precisely class field theory: the one-dimensional representations of \(\mathrm{Gal}(K^{\mathrm{ab}}/K)\) correspond to characters of \(C_K = \mathrm{GL}_1(\mathbb{A}_K)/\mathrm{GL}_1(K)\) via the Artin map.

For \(n = 2\) and \(K = \mathbb{Q}\), significant cases are known:
<ul>
<li>Odd two-dimensional representations correspond to classical modular forms (this is essentially the content of the Eichler-Shimura construction and the work of Deligne and Serre).</li>
<li>The proof of Fermat's Last Theorem by Wiles (1995) established the modularity of semistable elliptic curves over \(\mathbb{Q}\), which is a case of the Langlands correspondence (connecting two-dimensional \(\ell\)-adic Galois representations from elliptic curves to weight-2 modular forms).</li>
</ul>
</div>

<div class="remark">
<strong>Remark 7.10 (The Local Langlands Correspondence).</strong> The local Langlands correspondence for \(\mathrm{GL}_n(K)\) (where \(K\) is a local field) was proved by Harris-Taylor and Henniart (2001) for \(p\)-adic fields and by Langlands (1989) for archimedean fields. It establishes a bijection between \(n\)-dimensional Frobenius-semisimple Weil-Deligne representations of the Weil group \(W_K\) and irreducible smooth representations of \(\mathrm{GL}_n(K)\). For \(n = 1\), this is local class field theory: the Artin map identifies \(K^\times\) (which is \(\mathrm{GL}_1(K)\)) with characters of \(W_K^{\mathrm{ab}}\).
</div>

### 7.6 The Brauer Group and Reciprocity

Another important perspective on class field theory comes through the Brauer group, which measures the failure of the "Hasse principle" for central simple algebras and is closely related to \(H^2\) of the Galois group.

<div class="definition">
<strong>Definition 7.11 (Brauer Group).</strong> The <em>Brauer group</em> \(\mathrm{Br}(K)\) of a field \(K\) is the group of Morita equivalence classes of central simple algebras over \(K\), with multiplication given by the tensor product.
</div>

<div class="theorem">
<strong>Theorem 7.12 (Local Brauer Group).</strong> For a non-archimedean local field \(K\),
\[
\mathrm{Br}(K) \cong \mathbb{Q}/\mathbb{Z},
\]
via the invariant map \(\mathrm{inv}_K\). For \(K = \mathbb{R}\), \(\mathrm{Br}(\mathbb{R}) \cong \mathbb{Z}/2\mathbb{Z}\) (corresponding to \(\mathbb{R}\) and the quaternions \(\mathbb{H}\)). For \(K = \mathbb{C}\), \(\mathrm{Br}(\mathbb{C}) = 0\).
</div>

<div class="theorem">
<strong>Theorem 7.13 (Brauer Group Exact Sequence).</strong> For a number field \(K\), there is an exact sequence
\[
0 \to \mathrm{Br}(K) \to \bigoplus_v \mathrm{Br}(K_v) \xrightarrow{\sum \mathrm{inv}_v} \mathbb{Q}/\mathbb{Z} \to 0.
\]
</div>

This exact sequence says that a central simple algebra over \(K\) is determined by its local invariants (a rational number mod \(\mathbb{Z}\) at each place), subject to the constraint that their sum is zero. This is another incarnation of the reciprocity law: the surjectivity of \(\sum \mathrm{inv}_v\) onto \(\mathbb{Q}/\mathbb{Z}\) and the exactness at the middle term are equivalent to the Artin reciprocity law and the Hasse norm theorem, respectively.

<div class="remark">
<strong>Remark 7.14.</strong> The cohomological approach to class field theory, developed by Artin-Tate and by Serre, proceeds by computing the Brauer group \(\mathrm{Br}(L/K) = H^2(\mathrm{Gal}(L/K), L^\times)\) for Galois extensions \(L/K\), and showing that the invariant maps piece together to give the Artin map. This approach is more abstract but reveals the deep cohomological structure underlying reciprocity.
</div>

### 7.7 Higher Reciprocity Laws

<div class="theorem">
<strong>Theorem 7.15 (Eisenstein Reciprocity).</strong> Let \(p\) be an odd prime and \(K = \mathbb{Q}(\zeta_p)\). For \(\alpha \in \mathcal{O}_K\) with \(\alpha \equiv a \pmod{(1-\zeta_p)^2}\) for some \(a \in \mathbb{Z}\), \(\gcd((\alpha), (p)) = 1\), and a rational integer \(m\) with \(\gcd(m, p) = 1\),
\[
\left(\frac{\alpha}{m}\right)_p = \left(\frac{m}{\alpha}\right)_p,
\]
where \(\left(\frac{\cdot}{\cdot}\right)_p\) is the \(p\)-th power residue symbol.
</div>

<div class="proof">
<strong>Proof (sketch via class field theory).</strong> The \(p\)-th power residue symbol can be expressed in terms of the Artin symbol for the Kummer extension \(K(\sqrt[p]{\alpha})/K\). The Artin reciprocity law, applied to this extension, gives the symmetry between the roles of \(\alpha\) and \(m\) after tracking through the definitions of the power residue symbols. The congruence condition on \(\alpha\) ensures that the relevant Kummer extension has the right conductor. \(\square\)
</div>

### 7.8 Open Problems and Further Directions

We conclude these notes by highlighting several major open problems connected to class field theory.

<div class="remark">
<strong>Remark 7.16 (Non-Abelian Class Field Theory).</strong> The Langlands program, described in Section 7.5, is the most ambitious attempt to generalize class field theory to the non-abelian setting. While enormous progress has been made (the proof of the local Langlands correspondence for \(\mathrm{GL}_n\), the proof of Serre's conjecture by Khare-Wintenberger, the work of Scholze on the cohomology of Shimura varieties), a complete non-abelian class field theory remains elusive.
</div>

<div class="remark">
<strong>Remark 7.17 (The Riemann Hypothesis for Dedekind Zeta Functions).</strong> The generalized Riemann hypothesis (GRH) asserts that all nontrivial zeros of \(\zeta_K(s)\) lie on the critical line \(\mathrm{Re}(s) = 1/2\). GRH has profound consequences for the distribution of primes in extensions: it would give effective error terms in the Chebotarev density theorem, far sharper than what is known unconditionally.
</div>

<div class="remark">
<strong>Remark 7.18 (Class Field Towers).</strong> Golod and Shafarevich (1964) proved that the class field tower of a number field can be infinite. Specifically, they showed that if the number of prime divisors of the discriminant of a quadratic field is large enough, the tower of iterated Hilbert class fields does not terminate. This resolved a question of Furtwängler and showed that the principal ideal theorem cannot be iterated naively to embed \(\mathcal{O}_K\) into a PID.
</div>

<div class="remark">
<strong>Remark 7.19 (Iwasawa Theory).</strong> Iwasawa theory, developed by Kenkichi Iwasawa in the 1960s, studies the behavior of arithmetic objects (class groups, units, Selmer groups) in \(\mathbb{Z}_p\)-extensions — infinite towers of number fields with Galois group isomorphic to \(\mathbb{Z}_p\). The Main Conjecture of Iwasawa theory (proved by Mazur-Wiles for \(\mathbb{Q}\) and by Wiles for totally real fields) establishes a deep connection between the algebraic side (class groups in the tower) and the analytic side (\(p\)-adic \(L\)-functions). Iwasawa theory can be viewed as "\(p\)-adic class field theory" and provides a bridge between class field theory and the modern theory of Galois representations.
</div>

<div class="remark">
<strong>Remark 7.20 (Geometric and \(p\)-adic Class Field Theory).</strong> In the function field setting, class field theory has geometric interpretations via the Picard group and the theory of abelian covers of curves (this is the content of geometric class field theory, closely related to the Langlands program over function fields proved by Drinfeld for \(\mathrm{GL}_2\) and Lafforgue for \(\mathrm{GL}_n\)). In the \(p\)-adic setting, recent advances by Fargues and Scholze have given a new geometric approach to the local Langlands correspondence, using the Fargues-Fontaine curve — a remarkable geometric object that encodes \(p\)-adic Hodge theory and serves as a "curve" over which local Langlands can be formulated geometrically.
</div>

---

This concludes our tour of class field theory. We began with the basic algebraic number theory of ideals and primes, moved through the local theory of \(p\)-adic fields, assembled the global picture using adeles and ideles, and arrived at the Artin reciprocity law — the central theorem that classifies all abelian extensions of a number field in terms of its idele class group. Along the way, we saw how this grand theory subsumes the classical reciprocity laws, explains the Hilbert class field and ray class fields, and connects to the deepest open problems in modern number theory through the Langlands program.

The beauty of class field theory lies not only in the power of its main theorems but in the extraordinary interplay of algebra, analysis, and geometry that pervades every aspect of the subject. From Gauss's quadratic reciprocity to the Langlands program, from the geometry of numbers to harmonic analysis on adeles, from Lubin-Tate formal groups to the cohomology of Galois groups — class field theory sits at a nexus of mathematical ideas that continues to inspire and challenge mathematicians today.
